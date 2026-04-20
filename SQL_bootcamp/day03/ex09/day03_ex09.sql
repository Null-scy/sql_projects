INSERT INTO public.person_visits (id, person_id, pizzeria_id, visit_date)
VALUES 
(
	(SELECT MAX(id) + 1 FROM public.person_visits),
	(SELECT id FROM public.person WHERE name = 'Denis'),
	(SELECT id FROM public.pizzeria WHERE name = 'Dominos'),
	'2022-02-24'
	),
	(
	(SELECT MAX(id) + 2 FROM public.person_visits),
	(SELECT id FROM public.person WHERE name = 'Irina'),
	(SELECT id FROM public.pizzeria WHERE name = 'Dominos'),
	'2022-02-24'
	)
RETURNING *;
