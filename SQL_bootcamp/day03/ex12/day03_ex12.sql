WITH params AS (
    SELECT 
        (SELECT MAX(id) FROM person_order) + 1 AS start_id,
        (SELECT COUNT(*) FROM person) AS num_persons
)
INSERT INTO public.person_order
SELECT 
	gs.id,
	p.id,
	m.id,
	'2022-02-25'
FROM generate_series((SELECT start_id FROM params),
                     (SELECT start_id FROM params) + (SELECT num_persons FROM params) - 1
					 ) AS gs(id)
JOIN person p ON p.id = gs.id - (SELECT start_id FROM params) + 1
JOIN public.menu m ON m.pizza_name = 'greek pizza'
RETURNING *;