CREATE INDEX idx_person_order_multi
ON public.person_order (person_id, menu_id, order_date);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 
AND menu_id = 14
AND order_date = '2022-01-07';