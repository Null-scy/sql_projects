INSERT INTO person_discounts 
SELECT 
	ROW_NUMBER() OVER (ORDER BY person_id, m.pizzeria_id) AS id,
	person_id, 
	m.pizzeria_id,
	CASE WHEN COUNT(*) = 1 THEN 10.5 
	WHEN COUNT(*) = 2 THEN 22
	ELSE 30 END 
FROM person_order po
JOIN menu m ON menu_id = m.id
GROUP BY person_id, m.pizzeria_id