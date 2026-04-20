SELECT missing_date::date FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')
	AS missing_date
LEFT JOIN public.person_visits pv ON pv.visit_date = missing_date 
AND (person_id = 1 OR person_id = 2)
WHERE pv.person_id IS NULL
ORDER BY missing_date 
