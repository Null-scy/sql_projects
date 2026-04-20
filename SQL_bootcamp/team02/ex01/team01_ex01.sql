--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
	COALESCE(c.name, 'not defined') AS currency_name,
	b.money * COALESCE(c1.rate_to_usd, c2.rate_to_usd) AS currency_in_usd
FROM balance b
LEFT JOIN "user" u ON u.id = b.user_id
JOIN currency c ON c.id = b.currency_id
LEFT JOIN currency c1 
ON c1.id = b.currency_id
AND c1.updated = (
    SELECT MAX(updated)
    FROM currency
    WHERE currency.id = b.currency_id
      AND updated <= b.updated
)
LEFT JOIN currency c2
ON c2.id = b.currency_id
AND c2.updated = (
    SELECT MIN(updated)
    FROM currency
    WHERE currency.id = b.currency_id
      AND updated > b.updated
)
GROUP BY b.money, u.name,u.lastname, currency_name, c1.rate_to_usd, c2.rate_to_usd
ORDER BY name DESC, lastname, currency_name;



