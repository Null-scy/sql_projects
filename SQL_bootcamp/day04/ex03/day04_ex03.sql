SELECT generated_date AS missing_date
FROM public.v_generated_dates
EXCEPT
SELECT visit_date
FROM public.person_visits
ORDER BY missing_date
