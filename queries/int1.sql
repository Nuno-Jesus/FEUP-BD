.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

-- Lista os programas de um género específico (no caso, Western)
SELECT Show.id, Show.name AS show_name, Show.rating, Genre.name AS genre
FROM Show, Genre, ShowGenre
WHERE ShowGenre.id_Show = Show.id AND ShowGenre.id_Genre = Genre.id
AND Genre.name='Western';