WITH all_statistics AS (
(SELECT 
 pz.name,
 COUNT(*),
 'order' AS action_type
FROM public.person_order
JOIN public.menu m ON m.id = menu_id
JOIN public.pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name)
UNION ALL
(SELECT 
 pz.name,
 COUNT(*),
 'visit' AS action_type
FROM public.person_visits
JOIN public.pizzeria pz ON pz.id = pizzeria_id
GROUP BY pz.name)
ORDER BY count
)

SElECT 
	name,
	SUM(count) AS total_count
FROM all_statistics
GROUP BY name
ORDER BY total_count DESC, name;
