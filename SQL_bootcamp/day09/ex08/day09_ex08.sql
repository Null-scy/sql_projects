
CREATE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10) 
RETURNS SETOF INT AS $$
 WITH RECURSIVE Fibonacci(n, current_val, next_val) AS (
    -- Базовый случай: первые два числа
    SELECT 1, 0, 1
    UNION ALL
    -- Рекурсивный шаг
    SELECT n + 1, next_val, current_val + next_val
    FROM Fibonacci
    WHERE next_val < pstop -- Количество итераций
)
	SELECT current_val
	FROM Fibonacci
$$ LANGUAGE sql;

select * from fnc_fibonacci();

select * from fnc_fibonacci(100);




