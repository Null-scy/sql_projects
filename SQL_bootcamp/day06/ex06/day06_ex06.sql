CREATE SEQUENCE seq_person_discounts
	START WITH 1
	INCREMENT BY 1; 

ALTER TABLE public.person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts',
(SELECT COUNT(*) FROM person_discounts));
