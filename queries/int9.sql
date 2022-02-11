.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- Listar todos os episódios que foram vistos  
-- por cada utilizador no último dia das suas subscrições.

SELECT DISTINCT username, wDate AS watched_date, name AS episode_name
FROM Episode E1, User U1, Watched W1
WHERE EXISTS(
  SELECT wDate, endDate, id_Episode, id_User
  FROM (Watched, Subscription) 
  JOIN User
  ON User.id = Watched.id_User
  WHERE U1.id = id_User AND E1.id = id_Episode
  AND W1.wDate = wDate AND Watched.wDate = Subscription.endDate 
);


