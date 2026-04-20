ALTER TABLE public.person_discounts
ADD CONSTRAINT ch_nn_person_id NOT NULL person_id,
ADD CONSTRAINT ch_nn_pizzeria_id NOT NULL pizzeria_id,
ADD CONSTRAINT ch_nn_discount NOT NULL discount,
ALTER discount SET DEFAULT 0,
ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100);
