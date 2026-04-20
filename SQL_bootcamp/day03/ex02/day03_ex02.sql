SELECT m.pizza_name, m.price, pz.name
fROM public.menu m
LEFT JOIN public.person_order po ON po.menu_id = m.id
JOIN public.pizzeria pz ON pz.id = m.pizzeria_id
WHERE order_date IS NULL
ORDER BY 1, 2