SELECT p.name
FROM public.person p
WHERE p.gender = 'female'
AND EXISTS (
	SELECT 1
	FROM public.person_order po
    JOIN public.menu m ON m.id = po.menu_id
    WHERE po.person_id = p.id
	AND m.pizza_name = 'pepperoni pizza'
)
AND EXISTS (
	SELECT 1
	FROM public.person_order po
    JOIN public.menu m ON m.id = po.menu_id
    WHERE po.person_id = p.id
	AND m.pizza_name = 'cheese pizza'
)
ORDER BY p.name


