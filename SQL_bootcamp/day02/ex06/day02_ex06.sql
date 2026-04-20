SELECT m.pizza_name, pz.name AS pizzeria_name
FROM public.person_order pv
JOIN public.person p ON pv.person_id = p.id
JOIN public.menu m ON pv.menu_id = m.id
JOIN public.pizzeria pz ON m.pizzeria_id = pz.id
WHERE p.name IN ('Anna', 'Denis')
ORDER BY m.pizza_name, pizzeria_name
