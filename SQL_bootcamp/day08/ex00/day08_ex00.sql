--Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
--проверяем что в этом сансе видны изменения
select * from pizzeria where name  = 'Pizza Hut';

--Session #2
-- проверяем что изменения не видны
select * from pizzeria where name = 'Pizza Hut';

--Session #1
-- фиксируем изменения
COMMIT;

--Session #2
-- проверяем что изменения видны
select * from pizzeria where name = 'Pizza Hut';
