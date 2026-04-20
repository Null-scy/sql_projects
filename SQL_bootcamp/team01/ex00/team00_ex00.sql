CREATE TABLE TRIPS (point1 varchar, point2 varchar, cost integer);

INSERT INTO trips values 
	('a', 'b', 10),
	('b', 'a', 10),
	('a', 'c', 15),
	('c', 'a', 15),
	('a', 'd', 20),
	('d', 'a', 20),
	('b', 'd', 25),
	('d', 'b', 25),
	('c', 'd', 30),
	('d', 'c', 30),
	('b', 'c', 35),
	('c', 'b', 35);

CREATE VIEW v_road AS(
WITH RECURSIVE road AS (
    SELECT 
        point2 AS last_city,
        ARRAY[point1, point2] AS path,
        cost AS total_cost,
        1 AS step
    FROM trips
    WHERE point1 = 'a'

    UNION ALL

    SELECT                  
        trips.point2 AS last_city,     
        r.path || trips.point2 AS path,
        r.total_cost + trips.cost AS total_cost, 
        r.step + 1 AS step          
    FROM road r
    JOIN trips ON r.last_city = trips.point1 
    WHERE 
    r.step < 4 
    AND 
    (NOT trips.point2 = ANY(r.path)
	OR
    (trips.point2 = 'a'
    AND r.path @> ARRAY['b','c','d']::varchar[]
)))
SELECT *
FROM road)

SELECT 
	total_cost,
	path AS tour
FROM v_road
WHERE step = 4
AND total_cost = (
      SELECT MIN(total_cost)
      FROM v_road
	  WHERE step = 4
  )
ORDER BY 1, 2