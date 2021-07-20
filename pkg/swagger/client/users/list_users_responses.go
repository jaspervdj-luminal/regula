// Code generated by go-swagger; DO NOT EDIT.

package users

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the swagger generate command

import (
	"fmt"
	"io"

	"github.com/go-openapi/runtime"
	"github.com/go-openapi/strfmt"

	"github.com/fugue/regula/pkg/swagger/models"
)

// ListUsersReader is a Reader for the ListUsers structure.
type ListUsersReader struct {
	formats strfmt.Registry
}

// ReadResponse reads a server response into the received o.
func (o *ListUsersReader) ReadResponse(response runtime.ClientResponse, consumer runtime.Consumer) (interface{}, error) {
	switch response.Code() {
	case 200:
		result := NewListUsersOK()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return result, nil
	case 400:
		result := NewListUsersBadRequest()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return nil, result
	case 401:
		result := NewListUsersUnauthorized()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return nil, result
	case 403:
		result := NewListUsersForbidden()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return nil, result
	case 404:
		result := NewListUsersNotFound()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return nil, result
	case 500:
		result := NewListUsersInternalServerError()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return nil, result

	default:
		return nil, runtime.NewAPIError("unknown error", response, response.Code())
	}
}

// NewListUsersOK creates a ListUsersOK with default headers values
func NewListUsersOK() *ListUsersOK {
	return &ListUsersOK{}
}

/*ListUsersOK handles this case with default header values.

User details.
*/
type ListUsersOK struct {
	Payload *models.Users
}

func (o *ListUsersOK) Error() string {
	return fmt.Sprintf("[GET /users][%d] listUsersOK  %+v", 200, o.Payload)
}

func (o *ListUsersOK) GetPayload() *models.Users {
	return o.Payload
}

func (o *ListUsersOK) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.Users)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}

// NewListUsersBadRequest creates a ListUsersBadRequest with default headers values
func NewListUsersBadRequest() *ListUsersBadRequest {
	return &ListUsersBadRequest{}
}

/*ListUsersBadRequest handles this case with default header values.

BadRequestError
*/
type ListUsersBadRequest struct {
	Payload *models.BadRequestError
}

func (o *ListUsersBadRequest) Error() string {
	return fmt.Sprintf("[GET /users][%d] listUsersBadRequest  %+v", 400, o.Payload)
}

func (o *ListUsersBadRequest) GetPayload() *models.BadRequestError {
	return o.Payload
}

func (o *ListUsersBadRequest) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.BadRequestError)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}

// NewListUsersUnauthorized creates a ListUsersUnauthorized with default headers values
func NewListUsersUnauthorized() *ListUsersUnauthorized {
	return &ListUsersUnauthorized{}
}

/*ListUsersUnauthorized handles this case with default header values.

AuthenticationError
*/
type ListUsersUnauthorized struct {
	Payload *models.AuthenticationError
}

func (o *ListUsersUnauthorized) Error() string {
	return fmt.Sprintf("[GET /users][%d] listUsersUnauthorized  %+v", 401, o.Payload)
}

func (o *ListUsersUnauthorized) GetPayload() *models.AuthenticationError {
	return o.Payload
}

func (o *ListUsersUnauthorized) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.AuthenticationError)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}

// NewListUsersForbidden creates a ListUsersForbidden with default headers values
func NewListUsersForbidden() *ListUsersForbidden {
	return &ListUsersForbidden{}
}

/*ListUsersForbidden handles this case with default header values.

AuthorizationError
*/
type ListUsersForbidden struct {
	Payload *models.AuthorizationError
}

func (o *ListUsersForbidden) Error() string {
	return fmt.Sprintf("[GET /users][%d] listUsersForbidden  %+v", 403, o.Payload)
}

func (o *ListUsersForbidden) GetPayload() *models.AuthorizationError {
	return o.Payload
}

func (o *ListUsersForbidden) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.AuthorizationError)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}

// NewListUsersNotFound creates a ListUsersNotFound with default headers values
func NewListUsersNotFound() *ListUsersNotFound {
	return &ListUsersNotFound{}
}

/*ListUsersNotFound handles this case with default header values.

NotFoundError
*/
type ListUsersNotFound struct {
	Payload *models.NotFoundError
}

func (o *ListUsersNotFound) Error() string {
	return fmt.Sprintf("[GET /users][%d] listUsersNotFound  %+v", 404, o.Payload)
}

func (o *ListUsersNotFound) GetPayload() *models.NotFoundError {
	return o.Payload
}

func (o *ListUsersNotFound) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.NotFoundError)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}

// NewListUsersInternalServerError creates a ListUsersInternalServerError with default headers values
func NewListUsersInternalServerError() *ListUsersInternalServerError {
	return &ListUsersInternalServerError{}
}

/*ListUsersInternalServerError handles this case with default header values.

InternalServerError
*/
type ListUsersInternalServerError struct {
	Payload *models.InternalServerError
}

func (o *ListUsersInternalServerError) Error() string {
	return fmt.Sprintf("[GET /users][%d] listUsersInternalServerError  %+v", 500, o.Payload)
}

func (o *ListUsersInternalServerError) GetPayload() *models.InternalServerError {
	return o.Payload
}

func (o *ListUsersInternalServerError) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.InternalServerError)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}
