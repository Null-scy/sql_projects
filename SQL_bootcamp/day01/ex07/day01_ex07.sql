SELECT order_date, 
format('%s (age:%s)', name, age) 
    AS person_information
FROM public.person_order po 
JOIN public.person p
ON po.person_id = p.id
ORDER BY order_date, name