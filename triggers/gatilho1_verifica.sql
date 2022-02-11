.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

SELECT * FROM Notification
WHERE id_User = 4;

INSERT INTO Episode 
VALUES (151, 6, 'Test', '0:52:14', '2022-01-26', 2);


SELECT * FROM Notification
WHERE id_User = 4;

DELETE FROM Episode 
WHERE id = 151;

