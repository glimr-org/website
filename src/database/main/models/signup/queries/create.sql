INSERT INTO signups (email, created_at, updated_at)
VALUES ($1, $2, $3)
RETURNING *
