package model

import (
	"github.com/sparkymat/vault/database"
	"github.com/sparkymat/vault/errors"
)

type User struct {
	Name              string
	Email             string
	EncryptedPassword string
}

func UserLogin(email string, password string) (User, error) {
	return User{}, nil
}

func UserRegister(name string, email string, password string) (User, error) {
	var existingUser User

	if !database.Connection.Where("users.email = ?", email).First(&existingUser).RecordNotFound() {
		return User{}, errors.UserError{Type: errors.EmailAlreadyRegistered}
	}

	return User{}, nil
}
