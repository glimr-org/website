import glimr/db/schema

pub const table_name = "signups"

pub fn definition() {
  schema.table(table_name, [
    schema.id(),
    schema.string("email"),
    schema.unix_timestamps(),
  ])
  |> schema.indexes([
    schema.unique(["email"]),
  ])
}
