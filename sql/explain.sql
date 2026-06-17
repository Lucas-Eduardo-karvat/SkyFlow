-- =====================================================
-- EXPLAIN - Busca de voos por origem e destino
-- =====================================================

EXPLAIN ANALYZE
SELECT *
FROM voos
WHERE origem = 'GRU'
  AND destino = 'GIG';


-- =====================================================
-- EXPLAIN - Busca por data do voo
-- =====================================================

EXPLAIN ANALYZE
SELECT *
FROM voos
WHERE data_partida >= CURRENT_DATE;


-- =====================================================
-- EXPLAIN - Busca de reservas por passageiro
-- =====================================================

EXPLAIN ANALYZE
SELECT *
FROM reservas
WHERE passageiro_id = 1;


-- =====================================================
-- EXPLAIN - Busca de assentos disponíveis
-- =====================================================

EXPLAIN ANALYZE
SELECT *
FROM assentos
WHERE voo_id = 1
  AND disponivel = true;


-- =====================================================
-- EXPLAIN - Consulta com JOIN
-- =====================================================

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