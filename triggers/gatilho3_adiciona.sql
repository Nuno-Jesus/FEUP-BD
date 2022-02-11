.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS GATILHO_3
BEFORE INSERT ON ShowGenre
WHEN NEW.id_Genre = NULL
BEGIN
  SELECT raise(abort, 'INVALID INSERTION: the show must have at least 1 genre.');
END;
