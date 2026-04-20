CREATE INDEX idx_person_name
ON person (UPPER(name));

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT UPPER(name)
FROM person 
WHERE UPPER(name) = 'ANNA';
