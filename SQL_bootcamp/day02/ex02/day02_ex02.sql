SELECT 
	COALESCE(p.name, '-') AS person_name, 
	pv.visit_date, 
	COALESCE(pz.name, '-') AS pizzeria_name
FROM public.person_visits pv
RIGHT JOIN public.person p ON p.id = pv.person_id 
AND visit_date BETWEEN '2022-01-01' AND '2022-01-03'
FULL JOIN public.pizzeria pz on pz.id = pv.pizzeria_id
ORDER BY p.name ASC NULLS FIRST, pv.visit_date, pz.name
