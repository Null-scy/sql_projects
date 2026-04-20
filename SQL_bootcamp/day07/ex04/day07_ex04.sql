SELECT 
 p.name,
 COUNT(*) AS count_of_visits
FROM public.person_visits
JOIN public.person p ON p.id = person_id
GROUP BY p.name
HAVING COUNT(*) > 3;