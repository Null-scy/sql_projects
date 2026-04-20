SELECT
	p.name,
	m.pizza_name,
	m.price,
	(m.price - m.price*pd.discount/100)::INT as discount_price,
	pz.name as pizzeria_name
FROM public.person_order po
JOIN public.person p ON po.person_id = p.id
JOIN public.menu m ON menu_id = m.id
JOIN public.pizzeria pz ON m.pizzeria_id = pz.id
JOIN public.person_discounts pd ON po.person_id = pd.person_id
AND m.pizzeria_id = pd.pizzeria_id
ORDER BY 1, 2