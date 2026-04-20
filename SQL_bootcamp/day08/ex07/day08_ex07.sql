
BEGIN; --Session 1
UPDATE pizzeria SET rating = 3.5 WHERE id = 10; --Session 1
BEGIN; --Session 2
UPDATE pizzeria SET rating = 3.4 WHERE id = 11; --Session 2
UPDATE pizzeria SET rating = 2.5 WHERE id = 11;  --Session 1
UPDATE pizzeria SET rating = 2.4 WHERE id = 10; --Session 2
COMMIT;  --Session 1
ROLLBACK; --Session 2
SELECT * FROM pizzeria  WHERE id = 10 OR id = 11; --Session 2

