SHOW TRANSACTION ISOLATION LEVEL;
-- две сессии происходят одновременно, команды вызываются поочередно  
--Session #1

BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';


--Session #2

BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';