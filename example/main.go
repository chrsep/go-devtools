package main

import "net/http"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		_, _ = w.Write([]byte("Hello Shakira"))
	})
	_ = http.ListenAndServe(":8080", nil)
}
