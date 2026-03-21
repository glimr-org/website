import app/app.{type App}
import app/http/validators/newsletter_store
import database/main/models/signup/gen/signup
import glimr/http/context.{type Context}
import glimr/http/http.{type Response}
import glimr/response/redirect
import glimr/session/session
import glimr/utils/unix_timestamp

/// @post "/newsletter"
pub fn store(ctx: Context(App)) -> Response {
  use data <- newsletter_store.validate(ctx)

  let now = unix_timestamp.now()

  signup.create_or_fail(
    pool: ctx.app.db,
    email: data.email,
    created_at: now,
    updated_at: now,
  )

  session.flash(ctx.session, "success.message", "Thanks for signing up!")

  redirect.to("/#newsletter")
}
