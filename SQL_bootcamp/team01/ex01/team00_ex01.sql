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
OR total_cost = (
      SELECT MAX(total_cost)
      FROM v_road
	  WHERE step = 4
  )
ORDER BY 1, 2