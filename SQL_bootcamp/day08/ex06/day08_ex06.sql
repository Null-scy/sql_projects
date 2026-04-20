
BEGIN; --Session1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --Session1
BEGIN; --Session2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --Session2
SELECT SUM(rating) FROM pizzeria; --Session1
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4); --Session2
COMMIT; --Session2
SELECT SUM(rating) FROM pizzeria; --Session1
COMMIT; --Session1
SELECT SUM(rating) FROM pizzeria; --Session1
SELECT SUM(rating) FROM pizzeria; --Session2