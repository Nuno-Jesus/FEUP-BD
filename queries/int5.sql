.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

-- Listar os episódios da primeira temporada de “Raised by Wolves”.
SELECT Episode.name AS episode_name, Episode.number AS episode_number, Season.number AS season_number, Show.name AS show
FROM Episode, Season, Serie, Show
WHERE Episode.id_Season=Season.id AND id_Serie=Serie.id AND Serie.id=Show.id
AND Show.id=17 AND Season.number=1;