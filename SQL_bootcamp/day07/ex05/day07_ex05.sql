SELECT DISTINCT p.name
FROM public.person_order
JOIN public.person p ON p.id = person_id
ORDER BY name;