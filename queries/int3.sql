.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

-- Lista os programas que contêm a palavra “game” no seu título.
SELECT Show.id, Show.name, Show.rating
FROM Show
WHERE name LIKE '%game%'
ORDER BY rating ASC;