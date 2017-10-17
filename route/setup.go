package route

import (
	"net/http"

	"github.com/gorilla/mux"
)

func SetupRouter() *mux.Router {
	router := mux.NewRouter()
	router.HandleFunc("/", HomeHandler)

	return router
}

func HomeHandler(response http.ResponseWriter, request *http.Request) {
	response.Write([]byte("ok"))
}
