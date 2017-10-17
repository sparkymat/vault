package database

import (
	"encoding/json"
	"fmt"
	"io/ioutil"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

type Config struct {
	Database string
	Host     string
	Password string
	Port     int
	Sslmode  string
	Username string
}

var (
	Connection *gorm.DB
)

func Setup() {
	var config Config

	rawConfigFile, err := ioutil.ReadFile("./.pgmgr.json")
	if err != nil {
		panic("Failed to load database config")
	}
	json.Unmarshal(rawConfigFile, &config)

	pgConfig := fmt.Sprintf("host=%v port=%v dbname=%v sslmode=%v", config.Host, config.Port, config.Database, config.Sslmode)
	if config.Username != "" {
		pgConfig = fmt.Sprintf("%v user=%v", pgConfig, config.Username)
	}
	if config.Password != "" {
		pgConfig = fmt.Sprintf("%v password=%v", pgConfig, config.Username)
	}

	Connection, err = gorm.Open("postgres", pgConfig)
	if err != nil {
		panic("Failed to open database")
	}
}
