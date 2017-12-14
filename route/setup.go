package route

import (
	"net/http"

	"github.com/gorilla/mux"
	"github.com/sparkymat/vault/controller"
	"github.com/sparkymat/vault/settings"
)

func SetupRouter(config settings.ApplicationConfig) *mux.Router {
	router := mux.NewRouter()
	router.HandleFunc("/", HomeHandler)

	router.HandleFunc("/register", func(response http.ResponseWriter, request *http.Request) {
		controller.UserRegistrationHandler(config, response, request)
	}).Methods("GET")

	return router
}

func HomeHandler(response http.ResponseWriter, request *http.Request) {
	response.Write([]byte("ok"))
}
