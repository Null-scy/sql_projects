WITH math AS(
SELECT
	address,
	ROUND(MAX(age)-MIN(age)::numeric/MAX(age), 2) AS formula,
	ROUND(AVG(age), 2) AS average
FROM public.person
GROUP BY address
)

SELECT
	address,
	formula,
	average,
	CASE 
		WHEN formula > average Then true 
		ELSE false
	END AS comparison
FROM math
ORDER BY address;