INSERT INTO public.menu (id, pizzeria_id, pizza_name, price)
SELECT 
	(SELECT  MAX(id) + 1 FROM public.menu),
	(SELECT  id FROM public.pizzeria
	WHERE name = 'Dominos'),
	'sicilian pizza',
	900
RETURNING *;