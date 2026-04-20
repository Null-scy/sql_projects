CREATE UNIQUE INDEX idx_menu_unique
ON public.menu (pizza_name, pizzeria_id);

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT *
FROM public.menu
WHERE pizzeria_id = 1
AND pizza_name = 'cheese pizza';