CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS(
SELECT pz.name AS pizzeria_name
FROM public.person_visits pv 
JOIN public.person p ON p.id = pv.person_id 
JOIN public.pizzeria pz ON pv.pizzeria_id = pz.id
WHERE p.name ='Dmitriy' 
AND pv.visit_date ='2022-01-08' 
AND EXISTS (
      SELECT 1
      FROM public.menu m
      WHERE m.pizzeria_id = pz.id
        AND m.price < 800
  ));

SELECT *
FROM public.mv_dmitriy_visits_and_eats;