INSERT INTO assentos (voo_id, numero, classe_id)
SELECT
    v.id,
    'E' || gs,
    1
FROM voos v
CROSS JOIN generate_series(1,10) gs;

INSERT INTO assentos (voo_id, numero, classe_id)
SELECT
    v.id,
    'X' || gs,
    2
FROM voos v
CROSS JOIN generate_series(1,10) gs;

INSERT INTO assentos (voo_id, numero, classe_id)
SELECT
    v.id,
    'P' || gs,
    3
FROM voos v
CROSS JOIN generate_series(1,10) gs;