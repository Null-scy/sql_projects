SELECT order_date, 
format('%s (age:%s)', name, age) 
    AS person_information
FROM
    (SELECT order_date, person_id AS id FROM public.person_order)
NATURAL JOIN public.person
ORDER BY order_date, name


