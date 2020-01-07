# This package was automatically generated from:
#
#     tests/rules/inputs/cloudtrail_log_file_validation_enabled.tf
#
# using `generate_test_inputs.sh` and should not be modified
# directly.
package tests.rules.cloudtrail_log_file_validation_enabled
mock_input = {
  "format_version": "0.1",
  "terraform_version": "0.12.18",
  "planned_values": {
    "root_module": {
      "resources": [
        {
          "address": "aws_cloudtrail.invalid_trail",
          "mode": "managed",
          "type": "aws_cloudtrail",
          "name": "invalid_trail",
          "provider_name": "aws",
          "schema_version": 0,
          "values": {
            "cloud_watch_logs_group_arn": null,
            "cloud_watch_logs_role_arn": null,
            "enable_log_file_validation": false,
            "enable_logging": true,
            "event_selector": [],
            "include_global_service_events": true,
            "is_multi_region_trail": false,
            "is_organization_trail": false,
            "kms_key_id": null,
            "name": "invalid_trail",
            "s3_key_prefix": null,
            "sns_topic_name": null,
            "tags": null
          }
        },
        {
          "address": "aws_cloudtrail.valid_trail",
          "mode": "managed",
          "type": "aws_cloudtrail",
          "name": "valid_trail",
          "provider_name": "aws",
          "schema_version": 0,
          "values": {
            "cloud_watch_logs_group_arn": null,
            "cloud_watch_logs_role_arn": null,
            "enable_log_file_validation": true,
            "enable_logging": true,
            "event_selector": [],
            "include_global_service_events": true,
            "is_multi_region_trail": false,
            "is_organization_trail": false,
            "kms_key_id": null,
            "name": "valid_trail",
            "s3_key_prefix": null,
            "sns_topic_name": null,
            "tags": null
          }
        },
        {
          "address": "aws_s3_bucket.trail_bucket",
          "mode": "managed",
          "type": "aws_s3_bucket",
          "name": "trail_bucket",
          "provider_name": "aws",
          "schema_version": 0,
          "values": {
            "acl": "private",
            "bucket_prefix": null,
            "cors_rule": [],
            "force_destroy": true,
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "policy": null,
            "replication_configuration": [],
            "server_side_encryption_configuration": [],
            "tags": null,
            "website": []
          }
        },
        {
          "address": "aws_s3_bucket_policy.policy",
          "mode": "managed",
          "type": "aws_s3_bucket_policy",
          "name": "policy",
          "provider_name": "aws",
          "schema_version": 0
        },
        {
          "address": "data.aws_caller_identity.current",
          "mode": "data",
          "type": "aws_caller_identity",
          "name": "current",
          "provider_name": "aws",
          "schema_version": 0
        }
      ]
    }
  },
  "resource_changes": [
    {
      "address": "aws_cloudtrail.invalid_trail",
      "mode": "managed",
      "type": "aws_cloudtrail",
      "name": "invalid_trail",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "cloud_watch_logs_group_arn": null,
          "cloud_watch_logs_role_arn": null,
          "enable_log_file_validation": false,
          "enable_logging": true,
          "event_selector": [],
          "include_global_service_events": true,
          "is_multi_region_trail": false,
          "is_organization_trail": false,
          "kms_key_id": null,
          "name": "invalid_trail",
          "s3_key_prefix": null,
          "sns_topic_name": null,
          "tags": null
        },
        "after_unknown": {
          "arn": true,
          "event_selector": [],
          "home_region": true,
          "id": true,
          "s3_bucket_name": true
        }
      }
    },
    {
      "address": "aws_cloudtrail.valid_trail",
      "mode": "managed",
      "type": "aws_cloudtrail",
      "name": "valid_trail",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "cloud_watch_logs_group_arn": null,
          "cloud_watch_logs_role_arn": null,
          "enable_log_file_validation": true,
          "enable_logging": true,
          "event_selector": [],
          "include_global_service_events": true,
          "is_multi_region_trail": false,
          "is_organization_trail": false,
          "kms_key_id": null,
          "name": "valid_trail",
          "s3_key_prefix": null,
          "sns_topic_name": null,
          "tags": null
        },
        "after_unknown": {
          "arn": true,
          "event_selector": [],
          "home_region": true,
          "id": true,
          "s3_bucket_name": true
        }
      }
    },
    {
      "address": "aws_s3_bucket.trail_bucket",
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "trail_bucket",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "acl": "private",
          "bucket_prefix": null,
          "cors_rule": [],
          "force_destroy": true,
          "lifecycle_rule": [],
          "logging": [],
          "object_lock_configuration": [],
          "policy": null,
          "replication_configuration": [],
          "server_side_encryption_configuration": [],
          "tags": null,
          "website": []
        },
        "after_unknown": {
          "acceleration_status": true,
          "arn": true,
          "bucket": true,
          "bucket_domain_name": true,
          "bucket_regional_domain_name": true,
          "cors_rule": [],
          "hosted_zone_id": true,
          "id": true,
          "lifecycle_rule": [],
          "logging": [],
          "object_lock_configuration": [],
          "region": true,
          "replication_configuration": [],
          "request_payer": true,
          "server_side_encryption_configuration": [],
          "versioning": true,
          "website": [],
          "website_domain": true,
          "website_endpoint": true
        }
      }
    },
    {
      "address": "aws_s3_bucket_policy.policy",
      "mode": "managed",
      "type": "aws_s3_bucket_policy",
      "name": "policy",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {},
        "after_unknown": {
          "bucket": true,
          "id": true,
          "policy": true
        }
      }
    },
    {
      "address": "data.aws_caller_identity.current",
      "mode": "data",
      "type": "aws_caller_identity",
      "name": "current",
      "provider_name": "aws",
      "change": {
        "actions": [
          "read"
        ],
        "before": null,
        "after": {},
        "after_unknown": {
          "account_id": true,
          "arn": true,
          "id": true,
          "user_id": true
        }
      }
    }
  ],
  "configuration": {
    "provider_config": {
      "aws": {
        "name": "aws",
        "expressions": {
          "region": {
            "constant_value": "us-east-2"
          }
        }
      }
    },
    "root_module": {
      "resources": [
        {
          "address": "aws_cloudtrail.invalid_trail",
          "mode": "managed",
          "type": "aws_cloudtrail",
          "name": "invalid_trail",
          "provider_config_key": "aws",
          "expressions": {
            "enable_log_file_validation": {
              "constant_value": false
            },
            "name": {
              "constant_value": "invalid_trail"
            },
            "s3_bucket_name": {
              "references": [
                "aws_s3_bucket.trail_bucket"
              ]
            }
          },
          "schema_version": 0,
          "depends_on": [
            "aws_s3_bucket_policy.policy"
          ]
        },
        {
          "address": "aws_cloudtrail.valid_trail",
          "mode": "managed",
          "type": "aws_cloudtrail",
          "name": "valid_trail",
          "provider_config_key": "aws",
          "expressions": {
            "enable_log_file_validation": {
              "constant_value": true
            },
            "name": {
              "constant_value": "valid_trail"
            },
            "s3_bucket_name": {
              "references": [
                "aws_s3_bucket.trail_bucket"
              ]
            }
          },
          "schema_version": 0,
          "depends_on": [
            "aws_s3_bucket_policy.policy"
          ]
        },
        {
          "address": "aws_s3_bucket.trail_bucket",
          "mode": "managed",
          "type": "aws_s3_bucket",
          "name": "trail_bucket",
          "provider_config_key": "aws",
          "expressions": {
            "force_destroy": {
              "constant_value": true
            }
          },
          "schema_version": 0
        },
        {
          "address": "aws_s3_bucket_policy.policy",
          "mode": "managed",
          "type": "aws_s3_bucket_policy",
          "name": "policy",
          "provider_config_key": "aws",
          "expressions": {
            "bucket": {
              "references": [
                "aws_s3_bucket.trail_bucket"
              ]
            },
            "policy": {
              "references": [
                "aws_s3_bucket.trail_bucket",
                "aws_s3_bucket.trail_bucket",
                "data.aws_caller_identity.current"
              ]
            }
          },
          "schema_version": 0
        },
        {
          "address": "data.aws_caller_identity.current",
          "mode": "data",
          "type": "aws_caller_identity",
          "name": "current",
          "provider_config_key": "aws",
          "schema_version": 0
        }
      ]
    }
  }
}
