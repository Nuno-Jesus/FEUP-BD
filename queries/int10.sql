.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- Listar todos os utilizadores que apesar de possuírem uma subscrição ativa, 
-- não possuem qualquer tipo de interação com o conteúdo multimédia

SELECT id, username, fullName AS full_name, email 
FROM User 
WHERE id NOT IN (
  SELECT id_User
  FROM Following
  UNION
  SELECT id_User 
  FROM Watched
  UNION 
  SELECT id_User
  FROM Comment  
) AND subActive = true;


