SELECT name, rating
from public.pizzeria pz
LEFT JOIN public.person_visits pv 
ON pz.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL
