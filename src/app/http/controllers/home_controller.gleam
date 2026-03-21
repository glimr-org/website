import app/app.{type App}
import compiled/loom/home
import glimr/http/context.{type Context}
import glimr/http/http.{type Response}
import glimr/response/response

/// @get "/"
pub fn show(ctx: Context(App)) -> Response {
  response.html(home.render(ctx: ctx), 200)
}
