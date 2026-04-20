WITH all_visits AS(
SELECT 
	pz.name AS pizzeria_name,
	p.gender
FROM public.person_visits pv 
JOIN public.pizzeria pz ON pz.id = pv.pizzeria_id
JOIN public.person p ON pv.person_id = p.id 
)

SELECT pizzeria_name
FROM all_visits
WHERE gender = 'female'
EXCEPT ALL
SELECT pizzeria_name
FROM all_visits
WHERE gender = 'male'

UNION ALL
(
SELECT pizzeria_name
FROM all_visits
WHERE gender = 'male'
EXCEPT ALL
SELECT pizzeria_name
FROM all_visits
WHERE gender = 'female'
)
ORDER BY pizzeria_name

