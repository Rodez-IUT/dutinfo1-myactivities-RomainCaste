CREATE OR REPLACE FUNCTION find_all_activities_for_owner(ownername varchar(500)) returns SETOF activity AS $$
    SELECT a.*
    FROM activity a
    JOIN "user" u
    ON a.owner_id = u.id
    WHERE ownername = username 
$$ LANGUAGE SQL