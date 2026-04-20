SELECT id
FROM public.pizzeria
WHERE id NOT IN (
	SELECT pizzeria_id 
	FROM public.person_visits);

SELECT id
FROM public.pizzeria
WHERE NOT EXISTS (
	SELECT pizzeria_id 
	FROM public.person_visits
	WHERE public.pizzeria.id = public.person_visits.pizzeria_id)