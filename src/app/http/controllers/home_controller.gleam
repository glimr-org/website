import compiled/loom/home
import glimr/http/http.{type Response}
import glimr/response/response

/// @get "/"
pub fn show() -> Response {
  response.loom(home.render(), 200)
}
