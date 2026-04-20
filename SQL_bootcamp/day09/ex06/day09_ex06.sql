CREATE FUNCTION fnc_person_visits_and_eats_on_date(
	pperson VARCHAR DEFAULT 'Dmitriy', 
	pprice INT DEFAULT 500,
	pdate DATE DEFAULT '2022-01-08')
RETURNS SETOF VARCHAR AS $$
BEGIN
	RETURN QUERY
	SELECT pz.name AS pizzeria_name
	FROM public.person_visits pv 
	JOIN public.person p ON p.id = pv.person_id 
	JOIN public.pizzeria pz ON pv.pizzeria_id = pz.id
	WHERE p.name = pperson
	AND pv.visit_date = pdate
	AND EXISTS (
    	SELECT 1
    	FROM public.menu m
		WHERE m.pizzeria_id = pz.id
        AND m.price < pprice);
END;
$$ LANGUAGE plpgsql;

select *  
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *  
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

