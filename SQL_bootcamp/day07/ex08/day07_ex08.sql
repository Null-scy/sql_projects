SELECT
 p.address,
 pz.name,
 COUNT(*) AS count_of_orders 
FROM public.person_order
JOIN public.person p ON p.id = person_id
JOIN menu m ON m.id = menu_id
JOIN public.pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY p.address, pz.name
ORDER BY  p.address, pz.name;