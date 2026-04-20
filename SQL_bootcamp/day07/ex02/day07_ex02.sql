(SELECT 
 pz.name,
 COUNT(*),
 'order' AS action_type
FROM public.person_order
JOIN public.menu m ON m.id = menu_id
JOIN public.pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY 2 DESC
LIMIT 3)
UNION ALL
(SELECT 
 pz.name,
 COUNT(*),
 'visit' AS action_type
FROM public.person_visits
JOIN public.pizzeria pz ON pz.id = pizzeria_id
GROUP BY pz.name
ORDER BY 2 DESC
LIMIT 3)
order by 3, 2 DESC;

