import app/app.{type App}
import glimr/forms/validator.{type FormData, type Rule}
import glimr/http/context.{type Context}
import glimr/http/http.{type Response}
import glimr/response/redirect

/// Define the shape of the data returned after validation
///
pub type Data {
  Data(email: String)
}

/// Define your form's validation rules
///
fn rules(ctx: Context(App)) -> List(Rule(Context(App))) {
  [
    validator.for("email", [
      validator.Required,
      validator.Email,
      validator.MinLength(4),
      validator.MaxLength(255),
      validator.Unique(ctx.app.db, "signups"),
    ]),
  ]
}

/// Set the form data returned after validation. This is also
/// where you can transform validated input data before it
/// reaches your controller.
///
fn data(data: FormData) -> Data {
  Data(email: data.get("email"))
}

/// Run your validation rules. This is your entry point, you
/// dont't usually have to adjust anything in this function, but
/// you can if you want to add any custom logic before/after
/// validation.
///
pub fn validate(ctx: Context(App), next: fn(Data) -> Response) {
  use validated <- validator.run(ctx, rules, data, redirect.to("/#newsletter"))

  next(validated)
}
