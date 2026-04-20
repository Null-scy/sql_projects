SELECT 
	m.pizza_name, 
	m.price, 
	pz.name AS pizzeria_name, 
	pv.visit_date
FROM public.person_visits pv
JOIN public.person p ON pv.person_id = p.id 
	AND p.name = 'Kate'
JOIN public.pizzeria pz ON pv.pizzeria_id = pz.id
JOIN public.menu m ON pz.id = m.pizzeria_id 
	AND m.price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pizzeria_name
 
