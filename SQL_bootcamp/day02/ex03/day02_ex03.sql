WITH dates AS(
	SELECT generate_series(
		'2022-01-01'::date, 
		'2022-01-10'::date, 
		'1 day')::date
	AS missing_date
)
SELECT missing_date
FROM dates
LEFT JOIN public.person_visits pv ON pv.visit_date = missing_date 
AND (person_id = 1 OR person_id = 2)
WHERE pv.person_id IS NULL
ORDER BY missing_date 
