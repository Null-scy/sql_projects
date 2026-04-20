
BEGIN; --Session1
BEGIN; --Session2
SELECT SUM(rating) FROM pizzeria; --Session1
INSERT INTO pizzeria VALUES (10, 'Kazan Pizza', 5); --Session2
COMMIT; --Session2
SELECT SUM(rating) FROM pizzeria; --Session1
COMMIT; --Session1
SELECT SUM(rating) FROM pizzeria; --Session1
SELECT SUM(rating) FROM pizzeria; --Session2