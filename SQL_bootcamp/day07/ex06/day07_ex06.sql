SELECT 
 pz.name,
 COUNT(*) AS count_of_orders,
 ROUND(AVG(m.price), 2) AS average_price,
 MAX(m.price) AS max_price,
 MIn(m.price) AS min_price
FROM public.person_order
JOIN public.menu m ON m.id = menu_id
JOIN public.pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY pz.name;