CREATE VIEW v_price_with_discount AS
SELECT 
	p.name,
	m.pizza_name,
	m.price,
	(price - price * 0.1)::int AS discount_price
FROM public.person_order po
JOIN public.person p ON po.person_id = p.id
JOIN public.menu m ON po.menu_id = m.id
ORDER BY 1, 2;

SELECT *
FROM public.v_price_with_discount;
