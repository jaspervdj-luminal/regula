package rego

import (
	"context"
	"embed"
	"fmt"
	"io/fs"
	"os"
	"path/filepath"

	"github.com/fugue/regula/pkg/loader"
	"github.com/open-policy-agent/opa/rego"
)

//go:embed lib
var regulaLib embed.FS

//go:embed rules
var regulaRules embed.FS

// RuleRunner wraps the logic to load Regula into OPA and evaluate rules
// against an input
type RuleRunner struct {
	Ctx   context.Context
	Query rego.PreparedEvalQuery
}

// RuleRunnerOptions is a set of options to instantiate a RuleRunner object.
type RuleRunnerOptions struct {
	Ctx      context.Context
	UserOnly bool
	Includes []string
	Debug    bool
}

var LoadExts map[string]bool = map[string]bool{
	".rego": true,
	".yaml": true,
	".yml":  true,
	".json": true,
}

func loadModule(fsys fs.FS, path string) (func(r *rego.Rego), error) {
	contents, err := fs.ReadFile(fsys, path)
	if err != nil {
		return nil, err
	}
	return rego.Module(path, string(contents)), nil
}

func loadDirectory(fsys fs.FS, path string) ([]func(r *rego.Rego), error) {
	modules := []func(r *rego.Rego){}
	walkDirFunc := func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if d.IsDir() {
			return nil
		}
		if ext := filepath.Ext(path); !LoadExts[ext] {
			return nil
		}
		module, err := loadModule(fsys, path)
		if err != nil {
			return err
		}
		modules = append(modules, module)
		return nil
	}

	if err := fs.WalkDir(fsys, path, walkDirFunc); err != nil {
		return nil, err
	}

	return modules, nil
}

func loadIncludes(includes []string) ([]func(r *rego.Rego), error) {
	modules := []func(r *rego.Rego){}
	o := osFs{}
	for _, path := range includes {
		info, err := fs.Stat(o, path)
		if err != nil {
			return nil, err
		}
		if info.IsDir() {
			dirModules, err := loadDirectory(o, path)
			if err != nil {
				return nil, err
			}

			modules = append(modules, dirModules...)
			continue
		}
		if ext := filepath.Ext(path); !LoadExts[ext] {
			return nil, fmt.Errorf("Unsupported file type %v in includes: %v", ext, path)
		}
		module, err := loadModule(o, path)
		if err != nil {
			return nil, err
		}
		if module != nil {
			modules = append(modules, module)
		}
	}

	return modules, nil
}

func loadRegula(userOnly bool) ([]func(r *rego.Rego), error) {
	modules, err := loadDirectory(regulaLib, "lib")
	if err != nil {
		return nil, err
	}

	if !userOnly {
		rules, err := loadDirectory(regulaRules, "rules")
		if err != nil {
			return nil, err
		}
		modules = append(modules, rules...)
	}
	return modules, nil
}

// NewRuleRunner instantiates a new RuleRunner
func NewRuleRunner(options *RuleRunnerOptions) (*RuleRunner, error) {
	// paths := append(options.RulesDirs, options.LibraryDir)
	regula, err := loadRegula(options.UserOnly)
	if err != nil {
		return nil, fmt.Errorf("Failed to load Regula: %v", err)
	}

	includes, err := loadIncludes(options.Includes)
	if err != nil {
		return nil, fmt.Errorf("Failed to load includes: %v", err)
	}
	regoFuncs := append(regula, includes...)
	regoFuncs = append(regoFuncs, rego.Query("data.fugue.regula.report"))
	query, err := rego.New(
		regoFuncs...,
	).PrepareForEval(options.Ctx)

	if err != nil {
		return nil, fmt.Errorf("Failed to initialize OPA: %v", err)
	}

	return &RuleRunner{
		Ctx:   options.Ctx,
		Query: query,
	}, nil
}

// Run evaluates rules against an input.
func (r *RuleRunner) Run(input []loader.RegulaInput) (rego.ResultSet, error) {
	results, err := r.Query.Eval(r.Ctx, rego.EvalInput(input))

	if err != nil {
		return nil, fmt.Errorf("Failed to evaluate against input: %v", err)
	}

	return results, nil
}

type osFs struct{}

func (o osFs) Open(name string) (fs.File, error) {
	f, err := os.Open(name)
	if err != nil {
		return nil, err
	}
	return f, nil
}
