INSERT INTO public.person_visits
SELECT 
	(SELECT MAX(id) +1 FROM public.person_visits),
	(SELECT id FROM public.person WHERE name = 'Dmitriy'),
	(SELECT id FROM public.pizzeria WHERE name = 'DoDo Pizza'),
	'2022-01-08'

RETURNING *;

REFRESH MATERIALIZED VIEW public.mv_dmitriy_visits_and_eats;

SELECT *
FROM public.mv_dmitriy_visits_and_eats;
	