SELECT order_date AS action_date, p.name 
FROM public.person_order po 
JOIN public.person p
ON po.person_id = p.id
UNION
SELECT visit_date AS action_date, p.name
FROM public.person_visits pv 
JOIN public.person p
ON pv.person_id = p.id
ORDER BY action_date, name DESC
