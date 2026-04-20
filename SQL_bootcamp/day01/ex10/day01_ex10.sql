SELECT 
p.name AS person_name,
m.pizza_name,
pz.name AS pizzeria_name
FROM public.person_order po
JOIN public.person p ON po.person_id = p.id
JOIN public.menu m ON po.menu_id = m.id
JOIN public.pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY person_name, m.pizza_name, pizzeria_name
