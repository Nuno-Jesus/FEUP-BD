.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

--Lista os 10 users que mais viram episódios por ordem descendente

SELECT User.username, count() AS episodes_watched
FROM Watched, User
WHERE Watched.id_User = User.id
GROUP BY id_User
ORDER BY episodes_watched DESC
LIMIT 10;
