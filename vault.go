package main

import (
	"net/http"

	"github.com/sparkymat/vault/database"
	"github.com/sparkymat/vault/route"
	"github.com/sparkymat/vault/settings"
	"github.com/urfave/negroni"
)

func main() {
	settings.Load()

	database.Setup()
	defer database.Connection.Close()

	router := route.SetupRouter()

	n := negroni.Classic()
	n.UseHandler(router)

	http.ListenAndServe(":3001", n)
}
