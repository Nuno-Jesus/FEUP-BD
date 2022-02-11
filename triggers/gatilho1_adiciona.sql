.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

--notificate user when new episode of serie he is following is added
CREATE TRIGGER IF NOT EXISTS GATILHO_1
AFTER INSERT
ON Episode
--quando user seguir serie
-- WHEN
--     SELECT count(id_User) > 0
--     FROM Following, (
--         SELECT id_Serie as id_of_serie
--         FROM Season
--         WHERE id_Serie = (
--             SELECT id_Serie 
--             FROM Season
--             WHERE id = NEW.id_Season
--             --WHERE id = NEW.id_Season
--             )
--     )
--     WHERE id_Serie = id_of_serie


BEGIN
    INSERT INTO Notification
    SELECT NULL,'Episode ' || NEW.name || ' was added', id_User
    FROM Following, (
        SELECT id_Serie as id_of_serie
        FROM Season
        WHERE id_Serie = (
            SELECT id_Serie 
            FROM Season
            WHERE id = NEW.id_Season
            )
    )
    WHERE id_Serie = id_of_serie;
END;



