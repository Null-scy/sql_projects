CREATE VIEW v_persons_female AS
	SELECT *
	FROM public.person
	WHERE gender = 'female';

SELECT *
FROM v_persons_female;

CREATE VIEW v_persons_male AS
	SELECT *
	FROM public.person
	WHERE gender = 'male';

SELECT *
FROM v_persons_male;