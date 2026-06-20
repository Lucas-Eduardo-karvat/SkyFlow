
-- Transação 1 - Cadastro de passageiro

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

-- Transação 2 - Uso de Savepoint

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

-- Transação 3 - Isolamento Repeatable Read

BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT *
FROM voos;

SELECT *
FROM reservas;

COMMIT;

-- Transação 4 - Reserva de assento

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
  AND numero = 'E3'
  AND disponivel = true;

UPDATE assentos
SET disponivel = false
WHERE voo_id = 1
  AND numero = 'E3'
  AND disponivel = true;

COMMIT;

-- Transação 5 - Exemplo de rollback

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

