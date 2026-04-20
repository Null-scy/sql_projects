UPDATE public.menu
SET price = (price - price * 0.1)::int
WHERE pizza_name = 'greek pizza'
RETURNING *;