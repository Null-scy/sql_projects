WITH all_orders AS(
SELECT 
	pz.name AS pizzeria_name,
	p.gender
FROM public.person_order po 
JOIN public.menu m ON m.id = po.menu_id
JOIN public.pizzeria pz ON m.pizzeria_id = pz.id
JOIN public.person p ON po.person_id = p.id 
)

SELECT pizzeria_name
FROM all_orders
WHERE gender = 'female'
EXCEPT
SELECT pizzeria_name
FROM all_orders
WHERE gender = 'male'

UNION
(
SELECT pizzeria_name
FROM all_orders
WHERE gender = 'male'
EXCEPT
SELECT pizzeria_name
FROM all_orders
WHERE gender = 'female'
)
ORDER BY pizzeria_name