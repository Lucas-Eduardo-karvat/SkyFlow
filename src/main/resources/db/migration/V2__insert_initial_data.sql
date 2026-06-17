-- ==========================================
-- COMPANHIAS AÉREAS
-- ==========================================

INSERT INTO companhias_aereas (nome, codigo_iata, pais)
VALUES
('LATAM Airlines', 'LA', 'Brasil'),
('GOL Linhas Aéreas', 'G3', 'Brasil'),
('Azul Linhas Aéreas', 'AD', 'Brasil');

-- ==========================================
-- AEROPORTOS
-- ==========================================

INSERT INTO aeroportos (
    codigo_iata,
    nome,
    cidade,
    estado,
    pais
)
VALUES
('GRU', 'Aeroporto Internacional de Guarulhos', 'Guarulhos', 'SP', 'Brasil'),

('CGH', 'Aeroporto de Congonhas', 'São Paulo', 'SP', 'Brasil'),

('VCP', 'Aeroporto Internacional de Viracopos', 'Campinas', 'SP', 'Brasil'),

('BSB', 'Aeroporto Internacional de Brasília', 'Brasília', 'DF', 'Brasil'),

('GIG', 'Aeroporto Internacional do Galeão', 'Rio de Janeiro', 'RJ', 'Brasil'),

('SDU', 'Aeroporto Santos Dumont', 'Rio de Janeiro', 'RJ', 'Brasil'),

('CNF', 'Aeroporto Internacional de Confins', 'Belo Horizonte', 'MG', 'Brasil'),

('SSA', 'Aeroporto Internacional de Salvador', 'Salvador', 'BA', 'Brasil'),

('REC', 'Aeroporto Internacional do Recife', 'Recife', 'PE', 'Brasil'),

('FOR', 'Aeroporto Internacional Pinto Martins', 'Fortaleza', 'CE', 'Brasil');

-- ==========================================
-- CLASSES
-- ==========================================

INSERT INTO classes (nome, descricao)
VALUES

(
    'ECONOMICA',
    'Classe econômica'
),

(
    'EXECUTIVA',
    'Classe executiva'
),

(
    'PRIMEIRA_CLASSE',
    'Primeira classe'
);

-- ==========================================
-- AERONAVES
-- ==========================================

INSERT INTO aeronaves (
    modelo,
    fabricante,
    capacidade,
    companhia_id
)
VALUES

(
    'A320neo',
    'Airbus',
    174,
    1
),

(
    'Boeing 737-800',
    'Boeing',
    186,
    2
),

(
    'Embraer E195-E2',
    'Embraer',
    136,
    3
),

(
    'Airbus A321neo',
    'Airbus',
    220,
    1
),

(
    'Boeing 737 MAX 8',
    'Boeing',
    176,
    2
),

(
    'ATR 72-600',
    'ATR',
    70,
    3
);