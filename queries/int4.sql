.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

-- Listar quantos utilizadores que não seguem a série “Loki”

SELECT count() AS users_not_following_Loki
FROM User
WHERE id NOT IN (
  SELECT id_User
  FROM User LEFT OUTER JOIN Following
  ON User.id = Following.id_User
  WHERE id_Serie = 22
  ORDER BY User.id
);