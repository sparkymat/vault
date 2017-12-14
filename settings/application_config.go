package settings

import (
	"io/ioutil"

	"github.com/BurntSushi/toml"
)

type ApplicationConfig struct {
	Authentication AuthenticationConfig
}

type AuthenticationConfig struct {
	Secret string
}

func Load() ApplicationConfig {
	var appConfig ApplicationConfig

	rawConfigFile, err := ioutil.ReadFile("./config/application.toml")
	if err != nil {
		panic("Failed to load application config")
	}

	if _, err := toml.Decode(string(rawConfigFile), &appConfig); err != nil {
		panic("Failed to load application config")
	}

	return appConfig
}
