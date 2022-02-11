.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- Inválido por subscrição expirada
INSERT INTO Watched (id_Episode, id_User, wDate)
VALUES (1, 1, '2021-09-01');

-- Inválido por inserção de data anterior ao launch do episódio
INSERT INTO Watched (id_Episode, id_User, wDate)
VALUES (100, 1, '2021-03-08');

SELECT * FROM Watched;
