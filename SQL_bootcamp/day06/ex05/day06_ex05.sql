COMMENT ON TABLE public.person_discounts IS
'the table contains information about personal discounts for each visitor in each pizzeria.';

COMMENT ON COLUMN person_discounts.id IS
'primary key of the table';

COMMENT ON COLUMN person_discounts.person_id IS
'Identifier of the person who receives the discount';

COMMENT ON COLUMN person_discounts.pizzeria_id IS
'Identifier of the pizzeria that offers the discount';

COMMENT ON COLUMN person_discounts.discount IS
'Discount value assigned to the person';



