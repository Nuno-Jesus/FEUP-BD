.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- Um utilizador tem que possuir uma subscrição ativa para visualizar episódios 
-- de uma série e não pode ver episódios ainda por lançar.

CREATE TRIGGER IF NOT EXISTS GATILHO_2
BEFORE INSERT ON Watched

BEGIN
  SELECT raise(abort, 'INVALID INSERTION: the user must have an active subscription and can not
  watch episodes yet to launch.')
  WHERE NOT EXISTS (
    SELECT * 
    FROM User 
    WHERE User.id = NEW.id_User AND subActive = true
  )
  
  OR NOT EXISTS (
    SELECT launchDate
    FROM Episode
    WHERE Episode.id = NEW.id_Episode AND DATE(NEW.wDate) >= DATE(launchDate) 
  );
  
END;