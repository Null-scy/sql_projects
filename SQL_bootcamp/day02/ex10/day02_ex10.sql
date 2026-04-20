SELECT 
	p1.name AS person_name1,
	p2.name AS person_name2,
	p1.address AS common_address
FROM public.person p1
JOIN public.person p2 ON p1.address = p2.address
WHERE p1.id > p2.id
ORDER BY 1, 2, 3

