INSERT INTO public.person_order
VALUES (
	(SELECT MAX(id) + 1 FROM public.person_order),
	(SELECT id FROM public.person WHERE name = 'Denis'),
	(SELECT id FROM public.menu WHERE pizza_name = 'sicilian pizza'),
	'2022-02-24'
),(
	(SELECT MAX(id) + 2 FROM public.person_order),
	(SELECT id FROM public.person WHERE name = 'Irina'),
	(SELECT id FROM public.menu WHERE pizza_name = 'sicilian pizza'),
	'2022-02-24'
)
RETURNING *;