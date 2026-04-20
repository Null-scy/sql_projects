SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    type,
    SUM(money) AS volume,
    COALESCE(currency.name, 'not defined') AS currency_name,
    COALESCE(rate_to_usd,1) AS last_rate_to_usd,
    SUM(money)*COALESCE(rate_to_usd,1) AS total_volume_in_usd
FROM balance b 
LEFT JOIN "user" u ON u.id=b.user_id
LEFT JOIN  (
    SELECT
        id,
        name,
        rate_to_usd,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) AS rn
    FROM currency 
) currency ON currency.id = b.currency_id AND currency.rn = 1
GROUP BY u.name,u.lastname,type,currency_name,last_rate_to_usd
ORDER BY name DESC, lastname,type;