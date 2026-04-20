SET enable_seqscan = on;
SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT pizza_name, pz.name AS pizzeria_name
FROM public.menu
JOIN public.pizzeria pz ON pizzeria_id=pz.id;
