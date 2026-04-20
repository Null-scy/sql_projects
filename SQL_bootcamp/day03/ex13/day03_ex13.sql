DELETE FROM public.person_order
WHERE order_date = '2022-02-25'
RETURNING *;

DELETE FROM public.menu
WHERE pizza_name = 'greek pizza'
RETURNING *;