-- ==========================================================
-- PROJETO - SISTEMA DE RESERVA DE PASSAGENS AÉREAS
-- Scripts de Consultas SQL
-- ==========================================================

-- ==========================================================
-- 1. CONSULTA COM EXISTS
-- Lista os voos que possuem pelo menos uma reserva
-- ==========================================================

SELECT
    v.numero_voo
FROM voos v
WHERE EXISTS (
    SELECT 1
    FROM reservas r
    WHERE r.voo_id = v.id
);

-- ==========================================================
-- 2. CONSULTA COM ANY
-- Lista voos com preço maior que pelo menos um voo cancelado
-- ==========================================================

SELECT
    numero_voo,
    preco
FROM voos
WHERE preco > ANY (
    SELECT preco
    FROM voos
    WHERE status = 'CANCELADO'
);

-- ==========================================================
-- 3. CONSULTA COM CTE (WITH)
-- Quantidade de reservas por voo
-- ==========================================================

WITH total_reservas AS (

    SELECT
        voo_id,
        COUNT(*) AS quantidade

    FROM reservas

    GROUP BY voo_id

)

SELECT

    v.numero_voo,

    t.quantidade

FROM voos v

JOIN total_reservas t

ON t.voo_id = v.id;

-- ==========================================================
-- 4. ROW_NUMBER()
-- Ranking dos voos por preço
-- ==========================================================

SELECT

    numero_voo,

    preco,

    ROW_NUMBER() OVER (
        ORDER BY preco DESC
    ) AS posicao

FROM voos;

-- ==========================================================
-- 5. RANK()
-- Ranking considerando empates
-- ==========================================================

SELECT

    numero_voo,

    preco,

    RANK() OVER (
        ORDER BY preco DESC
    ) AS ranking

FROM voos;

-- ==========================================================
-- 6. DENSE_RANK()
-- Ranking sem pular posições
-- ==========================================================

SELECT

    numero_voo,

    preco,

    DENSE_RANK() OVER (
        ORDER BY preco DESC
    ) AS ranking

FROM voos;

-- ==========================================================
-- 7. TOTAL DE RESERVAS POR STATUS
-- ==========================================================

SELECT

    status,

    COUNT(*) AS quantidade

FROM reservas

GROUP BY status;

-- ==========================================================
-- 8. JOIN
-- Passageiro, voo e status da reserva
-- ==========================================================

SELECT

    p.nome,

    v.numero_voo,

    r.status

FROM reservas r

JOIN passageiros p
    ON p.id = r.passageiro_id

JOIN voos v
    ON v.id = r.voo_id;

-- ==========================================================
-- 9. LEFT JOIN
-- Lista todos os voos e suas escalas (quando existirem)
-- ==========================================================

SELECT

    v.numero_voo,

    e.ordem,

    e.aeroporto_id

FROM voos v

LEFT JOIN escalas e
    ON e.voo_id = v.id

ORDER BY v.numero_voo, e.ordem;

-- ==========================================================
-- 10. HAVING
-- Voos que possuem pelo menos uma reserva
-- ==========================================================

SELECT

    voo_id,

    COUNT(*) AS total_reservas

FROM reservas

GROUP BY voo_id

HAVING COUNT(*) >= 1;

-- ==========================================================
-- 11. TOTAL DE PASSAGEIROS POR VOO
-- ==========================================================

SELECT

    v.numero_voo,

    COUNT(r.id) AS passageiros

FROM voos v

LEFT JOIN reservas r
    ON r.voo_id = v.id

GROUP BY v.numero_voo

ORDER BY passageiros DESC;

-- ==========================================================
-- 12. ASSENTOS DISPONÍVEIS POR VOO
-- ==========================================================

SELECT

    v.numero_voo,

    COUNT(a.id) AS assentos_disponiveis

FROM voos v

JOIN assentos a
    ON a.voo_id = v.id

WHERE a.disponivel = true

GROUP BY v.numero_voo

ORDER BY v.numero_voo;

-- ==========================================================
-- 13. VOOS COM ESCALA
-- ==========================================================

SELECT

    v.numero_voo,

    COUNT(e.id) AS quantidade_escalas

FROM voos v

JOIN escalas e
    ON e.voo_id = v.id

GROUP BY v.numero_voo

ORDER BY quantidade_escalas DESC;