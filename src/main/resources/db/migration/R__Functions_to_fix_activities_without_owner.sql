CREATE OR REPLACE FUNCTION get_default_owner() RETURNS "user" AS $$
  DECLARE
    defaultOwner "user"%rowtype;
    defaultOwnerUsername varchar(500) := 'Default Owner';
  BEGIN
	SELECT * INTO defaultOwner FROM "user" WHERE username = defaultOwnerUsername;
	if NOT found THEN
	  INSERT INTO "user" (id, username) VALUES (nextval('id_generator'), defaultOwnerUsername);
	  SELECT * INTO defaultOwner FROM "user" WHERE username = defaultOwnerUsername;
	END if;
	RETURN defaultOwner;
  END 
$$ LANGUAGE plpgSQL;