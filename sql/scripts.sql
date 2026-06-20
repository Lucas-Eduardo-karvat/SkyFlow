
-- Consulta 1 - Voos que possuem reservas

SELECT v.numero_voo
FROM voos v
WHERE EXISTS (
    SELECT 1
    FROM reservas r
    WHERE r.voo_id = v.id
);

-- Consulta 2 - Voos com preço maior que algum voo cancelado

SELECT numero_voo, preco
FROM voos
WHERE preco > ANY (
    SELECT preco
    FROM voos
    WHERE status = 'CANCELADO'
);

-- Consulta 3 - Quantidade de reservas por voo

WITH total_reservas AS (
    SELECT voo_id, COUNT(*) AS quantidade
    FROM reservas
    GROUP BY voo_id
)
SELECT v.numero_voo, t.quantidade
FROM voos v
JOIN total_reservas t
ON t.voo_id = v.id;

-- Consulta 4 - Ranking de voos por preço (ROW_NUMBER)

SELECT
    numero_voo,
    preco,
    ROW_NUMBER() OVER (ORDER BY preco DESC) AS posicao
FROM voos;

-- Consulta 5 - Ranking de voos com empates (RANK)

SELECT
    numero_voo,
    preco,
    RANK() OVER (ORDER BY preco DESC) AS ranking
FROM voos;

-- Consulta 6 - Ranking sem salto de posições (DENSE_RANK)

SELECT
    numero_voo,
    preco,
    DENSE_RANK() OVER (ORDER BY preco DESC) AS ranking
FROM voos;

-- Consulta 7 - Total de reservas por status

SELECT
    status,
    COUNT(*) AS quantidade
FROM reservas
GROUP BY status;

-- Consulta 8 - Passageiro, voo e status da reserva

SELECT
    p.nome,
    v.numero_voo,
    r.status
FROM reservas r
JOIN passageiros p
ON p.id = r.passageiro_id
JOIN voos v
ON v.id = r.voo_id;

-- Consulta 9 - Voos e suas escalas

SELECT
    v.numero_voo,
    e.ordem,
    e.aeroporto_id
FROM voos v
LEFT JOIN escalas e
ON e.voo_id = v.id
ORDER BY v.numero_voo, e.ordem;

-- Consulta 10 - Voos com pelo menos uma reserva

SELECT
    voo_id,
    COUNT(*) AS total_reservas
FROM reservas
GROUP BY voo_id
HAVING COUNT(*) >= 1;

-- Consulta 11 - Total de passageiros por voo

SELECT
    v.numero_voo,
    COUNT(r.id) AS passageiros
FROM voos v
LEFT JOIN reservas r
ON r.voo_id = v.id
GROUP BY v.numero_voo
ORDER BY passageiros DESC;

-- Consulta 12 - Assentos disponíveis por voo

SELECT
    v.numero_voo,
    COUNT(a.id) AS assentos_disponiveis
FROM voos v
JOIN assentos a
ON a.voo_id = v.id
WHERE a.disponivel = true
GROUP BY v.numero_voo
ORDER BY v.numero_voo;

-- Consulta 13 - Quantidade de escalas por voo

SELECT
    v.numero_voo,
    COUNT(e.id) AS quantidade_escalas
FROM voos v
JOIN escalas e
ON e.voo_id = v.id
GROUP BY v.numero_voo
ORDER BY quantidade_escalas DESC;

