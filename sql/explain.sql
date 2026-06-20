-- 1. Busca de voos por origem e destino

EXPLAIN ANALYZE
SELECT *
FROM voos
WHERE origem_id = 1
  AND destino_id = 2;


-- 2. Busca por data do voo

EXPLAIN ANALYZE
SELECT *
FROM voos
WHERE data_partida >= CURRENT_DATE;


-- 3. Busca de reservas por passageiro

EXPLAIN ANALYZE
SELECT *
FROM reservas
WHERE passageiro_id = 1;


-- 4. Busca de assentos disponíveis

EXPLAIN ANALYZE
SELECT *
FROM assentos
WHERE voo_id = 1
  AND disponivel = true;


-- 5. Consulta com JOIN

EXPLAIN ANALYZE
SELECT
    p.nome,
    v.numero_voo,
    r.status
FROM reservas r
JOIN passageiros p
    ON p.id = r.passageiro_id
JOIN voos v
    ON v.id = r.voo_id;


-- 6. Busca de reservas por voo

EXPLAIN ANALYZE
SELECT *
FROM reservas
WHERE voo_id = 1;


-- 7. Busca de escalas de um voo

EXPLAIN ANALYZE
SELECT *
FROM escalas
WHERE voo_id = 1;


-- 8. Busca de assentos por voo

EXPLAIN ANALYZE
SELECT *
FROM assentos
WHERE voo_id = 1;


-- 9. Contagem de reservas por voo

EXPLAIN ANALYZE
SELECT
    voo_id,
    COUNT(*)
FROM reservas
GROUP BY voo_id;


-- 10. Consulta de voos agendados

EXPLAIN ANALYZE
SELECT *
FROM voos
WHERE status = 'AGENDADO';