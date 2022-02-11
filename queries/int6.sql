.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

-- Listar a duração média (em minutos) dos filmes por cada género.

SELECT name AS movie_genre, 
round(avg(strftime(duration)), 1)*60.0 AS movie_genre_avg_minutes, 
count() AS genre_num_movies
FROM Movie, ShowGenre, Genre
WHERE id_Show IN(
  SELECT id
  FROM Movie
) AND Movie.id = ShowGenre.id_Show AND ShowGenre.id_Genre = Genre.id
GROUP BY name;