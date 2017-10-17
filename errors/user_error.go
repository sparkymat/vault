package errors

import "fmt"

type UserErrorType int

const (
	EmailAlreadyRegistered UserErrorType = iota
)

type UserError struct {
	Type UserErrorType
}

func (e UserError) Error() string {
	return fmt.Sprintf("")
}
