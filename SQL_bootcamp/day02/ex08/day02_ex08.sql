SELECT p.name
FROM public.person_order po
JOIN public.person p ON p.id = po.person_id
JOIN public.menu m ON m.id = menu_id
WHERE p.address IN ('Moscow', 'Samara') 
	AND p.gender = 'male'
	AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC
