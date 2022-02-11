.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- listar os comentários que 
-- foram publicados antes de um episódio ser lançado

SELECT name AS episode_name, 
  content AS comment, 
  cDate AS comment_date, 
  launchDate AS episode_launch_date
FROM Comment, Episode
WHERE Comment.id_Episode = Episode.id
AND DATE(Comment.cDate) < DATE(Episode.launchDate);
