SELECT 
	m.pizza_name, 
	pz.name AS pizzeria_name, 
	m.price
FROM public.menu m
JOIN public.pizzeria pz ON pz.id = m.pizzeria_id
WHERE m.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY m.pizza_name, pizzeria_name
