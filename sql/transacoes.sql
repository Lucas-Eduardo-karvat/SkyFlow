-- ==========================================================
-- PROJETO - SISTEMA DE RESERVA DE PASSAGENS AÉREAS
-- Exemplos de Transações
-- ==========================================================

-- ==========================================================
-- 1. TRANSAÇÃO SIMPLES
-- Cadastro de um passageiro
-- ==========================================================

BEGIN;

INSERT INTO passageiros (
    nome,
    cpf,
    email,
    telefone
)
VALUES (
    'José da Silva',
    '98765432100',
    'jose@email.com',
    '11999999999'
);

COMMIT;

-- ==========================================================
-- 2. TRANSAÇÃO COM SAVEPOINT
-- Caso ocorra erro, apenas parte da transação é desfeita
-- ==========================================================

BEGIN;

INSERT INTO passageiros (
    nome,
    cpf,
    email,
    telefone
)
VALUES (
    'Carlos Souza',
    '12312312312',
    'carlos@email.com',
    '11988888888'
);

SAVEPOINT sp_passageiro;

-- Este INSERT pode gerar erro caso o CPF já exista

INSERT INTO passageiros (
    nome,
    cpf,
    email,
    telefone
)
VALUES (
    'Maria Souza',
    '12312312312',
    'maria@email.com',
    '11977777777'
);

ROLLBACK TO SAVEPOINT sp_passageiro;

COMMIT;

-- ==========================================================
-- 3. TRANSAÇÃO COM REPEATABLE READ
-- Garante que as leituras permaneçam consistentes
-- ==========================================================

BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT *
FROM voos;

SELECT *
FROM reservas;

COMMIT;

-- ==========================================================
-- 4. RESERVA DE ASSENTO
-- Atualiza duas tabelas na mesma transação
-- ==========================================================

BEGIN;

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'NOVA001',
    1,
    1,
    id,
    450.00,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 1
AND numero = 'E3';

UPDATE assentos
SET disponivel = false
WHERE voo_id = 1
AND numero = 'E3';

COMMIT;

-- ==========================================================
-- 5. EXEMPLO DE ROLLBACK
-- Toda a operação é cancelada
-- ==========================================================

BEGIN;

INSERT INTO passageiros (
    nome,
    cpf,
    email,
    telefone
)
VALUES (
    'Teste Rollback',
    '55544433322',
    'rollback@email.com',
    '11966666666'
);

ROLLBACK;