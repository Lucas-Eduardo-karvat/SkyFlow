INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC001',
    1,
    1,
    id,
    450,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 1
  AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC002',
    2,
    1,
    id,
    450,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 1
  AND numero = 'E2';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC003',
    3,
    2,
    id,
    620,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 2
  AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC004',
    4,
    2,
    id,
    620,
    'CHECKIN'
FROM assentos
WHERE voo_id = 2
  AND numero = 'E2';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC005',
    5,
    3,
    id,
    580,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 3
  AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC006',
    6,
    4,
    id,
    700,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 4
  AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC007',
    7,
    5,
    id,
    430,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 5
    AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC008',
    8,
    6,
    id,
    320,
    'CHECKIN'
FROM assentos
WHERE voo_id = 6
    AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC009',
    9,
    7,
    id,
    780,
    'CONFIRMADA'
FROM assentos
WHERE voo_id = 7
    AND numero = 'E1';

INSERT INTO reservas (
    localizador,
    passageiro_id,
    voo_id,
    assento_id,
    valor_pago,
    status
)
SELECT
    'ABC010',
    10,
    8,
    id,
    390,
    'CANCELADA'
FROM assentos
WHERE voo_id = 8
    AND numero = 'E1';

UPDATE assentos
SET disponivel = false
WHERE (voo_id, numero) IN (
    (1,'E1'),
    (1,'E2'),
    (2,'E1'),
    (2,'E2'),
    (3,'E1'),
    (4,'E1'),
    (5,'E1'),
    (6,'E1'),
    (7,'E1'),
    (8,'E1')
);