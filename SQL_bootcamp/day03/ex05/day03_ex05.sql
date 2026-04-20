SELECT pz.name AS pizzeria_name
FROM public.person_visits pv
LEFT JOIN public.person_order po ON pv.visit_date = po.order_date
JOIN public.person p ON pv.person_id = p.id
JOIN public.pizzeria pz ON pv.pizzeria_id = pz.id
WHERE po.order_date IS NULL
AND p.name = 'Andrey'
ORDER BY pizzeria_name