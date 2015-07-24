///bin/golang-tip-to-run-as-a-shell-script "$0" ; exec /bin/env go run "$0" "$@"
package main

import "github.com/go-martini/martini"

func main() {
  m := martini.Classic()
  m.Get("/my-hello", func() string {
    return "Bemvindo aluno do curso de Docker!. "+
        "Visite <a href='http://joao-parana.com.br'>" +
        "http://joao-parana.com.br</a>"
  })
  m.Run()
}
