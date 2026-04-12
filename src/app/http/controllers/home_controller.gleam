import compiled/loom/home
import glimr/http/http.{type Response}
import glimr/response/response

/// @get "/"
pub fn show() -> Response {
  home.render() |> response.string_tree(200)
}
