UPDATE signups
SET email = $2
SET updated_at = $3
WHERE id = $1
RETURNING *
