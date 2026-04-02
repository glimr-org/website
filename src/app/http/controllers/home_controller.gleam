import compiled/loom/home
import glimr/http/http.{type Response}
import glimr/response/response

/// @get "/"
pub fn show() -> Response {
  response.html(home.render(), 200)
}
