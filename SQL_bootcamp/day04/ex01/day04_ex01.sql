SELECT name
FROM public.v_persons_female
UNION 
SELECT name
FROM public.v_persons_male
ORDER BY name