.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

-- Lista episódios que ainda não saíram
SELECT Episode.name AS episode, 
  Episode.launchDate AS launch_date, 
  Show.name AS serie,  Episode.number AS ep_number, 
  Season.number AS season_number
FROM Episode, Season, Serie, Show
WHERE Episode.id_Season=Season.id AND id_Serie=Serie.id AND Serie.id=Show.id
AND DATE(Episode.launchDate) > DATE('now');