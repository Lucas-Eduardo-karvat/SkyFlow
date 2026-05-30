
INSERT INTO status_voo (descricao) VALUES
('AGENDADO'), ('ATRASADO'), ('CANCELADO'), ('FINALIZADO'),
('EMBARCANDO'), ('EM_VOO'), ('POUSADO');

INSERT INTO status_reserva (descricao) VALUES
('PENDENTE'), ('CONFIRMADA'), ('CANCELADA'),
('AGUARDANDO_PAGAMENTO'), ('EXPIRADA'), ('REEMBOLSADA'), ('NO_SHOW');

INSERT INTO metodo_pagamento (descricao) VALUES
('PIX'), ('CARTAO_CREDITO'), ('BOLETO'),
('CARTAO_DEBITO'), ('TRANSFERENCIA_BANCARIA'), ('PAYPAL');

INSERT INTO status_pagamento (descricao) VALUES
('PENDENTE'), ('APROVADO'), ('RECUSADO'),
('ESTORNADO'), ('EM_ANALISE'), ('REEMBOLSADO');

-- Moedas dos países do seed
INSERT INTO moeda (codigo_iso, nome, simbolo) VALUES
('BRL', 'Real Brasileiro',        'R$'),
('USD', 'Dólar Americano',        'US$'),
('EUR', 'Euro',                   '€'),
('GBP', 'Libra Esterlina',        '£'),
('JPY', 'Iene Japonês',           '¥'),
('CNY', 'Yuan Chinês',            '¥'),
('CAD', 'Dólar Canadense',        'CA$'),
('AUD', 'Dólar Australiano',      'A$'),
('ARS', 'Peso Argentino',         '$'),
('MXN', 'Peso Mexicano',          '$');

INSERT INTO tipo_classe (nome_classe, multiplicador_valor) VALUES
('ECONOMICA',         1.00),
('ECONOMICA_PREMIUM', 1.30),
('EXECUTIVA',         1.80),
('PRIMEIRA_CLASSE',   2.80),
('CLASSE_BUSINESS',   2.10);

-- ============================================================================
-- 2. PAÍSES
-- ============================================================================

INSERT INTO pais (nome, sigla) VALUES
('Brasil',          'BR'),
('Estados Unidos',  'US'),
('França',          'FR'),
('Reino Unido',     'GB'),
('Japão',           'JP'),
('China',           'CN'),
('Canadá',          'CA'),
('Austrália',       'AU'),
('Argentina',       'AR'),
('México',          'MX');

-- ============================================================================
-- 3. ESTADOS
-- ============================================================================

-- Brasil
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'São Paulo',           'SP'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Rio de Janeiro',      'RJ'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Minas Gerais',        'MG'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Bahia',               'BA'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Paraná',              'PR'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Rio Grande do Sul',   'RS'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Pernambuco',          'PE'),
((SELECT id_pais FROM pais WHERE sigla = 'BR'), 'Ceará',               'CE');

-- Estados Unidos
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'California',    'CA'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'New York',      'NY'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'Texas',         'TX'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'Florida',       'FL'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'Illinois',      'IL'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'Washington',    'WA'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'Georgia',       'GA'),
((SELECT id_pais FROM pais WHERE sigla = 'US'), 'Massachusetts', 'MA');

-- França
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Île-de-France',        'IDF'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Provence-Alpes',       'PAC'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Auvergne-Rhône-Alpes', 'ARA'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Occitanie',            'OCC'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Nouvelle-Aquitaine',   'NAQ'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Grand Est',            'GES'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Bretagne',             'BRE'),
((SELECT id_pais FROM pais WHERE sigla = 'FR'), 'Normandie',            'NOR');

-- Reino Unido
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'GB'), 'England',          'ENG'),
((SELECT id_pais FROM pais WHERE sigla = 'GB'), 'Scotland',         'SCT'),
((SELECT id_pais FROM pais WHERE sigla = 'GB'), 'Wales',            'WLS'),
((SELECT id_pais FROM pais WHERE sigla = 'GB'), 'Northern Ireland', 'NIR');

-- Japão
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Tokyo',    'TKY'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Osaka',    'OSK'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Kyoto',    'KYT'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Hokkaido', 'HKD'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Okinawa',  'OKN'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Aichi',    'AIC'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Fukuoka',  'FUK'),
((SELECT id_pais FROM pais WHERE sigla = 'JP'), 'Hiroshima','HRS');

-- China
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Beijing',   'BJ'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Shanghai',  'SH'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Guangdong', 'GD'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Sichuan',   'SC'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Zhejiang',  'ZJ'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Yunnan',    'YN'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Hubei',     'HB'),
((SELECT id_pais FROM pais WHERE sigla = 'CN'), 'Shandong',  'SD');

-- Canadá
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'CA'), 'Ontario',          'ON'),
((SELECT id_pais FROM pais WHERE sigla = 'CA'), 'Quebec',           'QC'),
((SELECT id_pais FROM pais WHERE sigla = 'CA'), 'British Columbia', 'BC'),
((SELECT id_pais FROM pais WHERE sigla = 'CA'), 'Alberta',          'AB'),
((SELECT id_pais FROM pais WHERE sigla = 'CA'), 'Manitoba',         'MB'),
((SELECT id_pais FROM pais WHERE sigla = 'CA'), 'Nova Scotia',      'NS');

-- Austrália
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'AU'), 'New South Wales',  'NSW'),
((SELECT id_pais FROM pais WHERE sigla = 'AU'), 'Victoria',         'VIC'),
((SELECT id_pais FROM pais WHERE sigla = 'AU'), 'Queensland',       'QLD'),
((SELECT id_pais FROM pais WHERE sigla = 'AU'), 'Western Australia','WAU'),
((SELECT id_pais FROM pais WHERE sigla = 'AU'), 'South Australia',  'SAU');

-- Argentina
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'AR'), 'Buenos Aires', 'BAI'),
((SELECT id_pais FROM pais WHERE sigla = 'AR'), 'Córdoba',      'COR'),
((SELECT id_pais FROM pais WHERE sigla = 'AR'), 'Mendoza',      'MDZ'),
((SELECT id_pais FROM pais WHERE sigla = 'AR'), 'Santa Fe',     'SFE'),
((SELECT id_pais FROM pais WHERE sigla = 'AR'), 'Tucumán',      'TUC');

-- México
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'MX'), 'Ciudad de México', 'CMX'),
((SELECT id_pais FROM pais WHERE sigla = 'MX'), 'Jalisco',          'JAL'),
((SELECT id_pais FROM pais WHERE sigla = 'MX'), 'Nuevo León',       'NLE'),
((SELECT id_pais FROM pais WHERE sigla = 'MX'), 'Yucatán',          'YUC'),
((SELECT id_pais FROM pais WHERE sigla = 'MX'), 'Quintana Roo',     'ROO'),
((SELECT id_pais FROM pais WHERE sigla = 'MX'), 'Oaxaca',           'OAX');

-- ============================================================================
-- 4. CIDADES
-- ============================================================================

-- Brasil - São Paulo
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'São Paulo'),
((SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Campinas'),
((SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Guarulhos'),
((SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Santos'),
((SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Ribeirão Preto'),
((SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'São José dos Campos');

-- Brasil - Rio de Janeiro
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Rio de Janeiro'),
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Niterói'),
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Petrópolis');

-- Brasil - Minas Gerais
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Belo Horizonte'),
((SELECT id_estado FROM estado WHERE sigla = 'MG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Uberlândia'),
((SELECT id_estado FROM estado WHERE sigla = 'MG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Juiz de Fora');

-- Brasil - Bahia
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Salvador'),
((SELECT id_estado FROM estado WHERE sigla = 'BA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Feira de Santana'),
((SELECT id_estado FROM estado WHERE sigla = 'BA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Porto Seguro');

-- Brasil - Paraná
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Curitiba'),
((SELECT id_estado FROM estado WHERE sigla = 'PR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Londrina'),
((SELECT id_estado FROM estado WHERE sigla = 'PR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Foz do Iguaçu');

-- Brasil - Rio Grande do Sul
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Porto Alegre'),
((SELECT id_estado FROM estado WHERE sigla = 'RS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Caxias do Sul'),
((SELECT id_estado FROM estado WHERE sigla = 'RS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Gramado');

-- Brasil - Pernambuco
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Recife'),
((SELECT id_estado FROM estado WHERE sigla = 'PE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Olinda');

-- Brasil - Ceará
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Fortaleza'),
((SELECT id_estado FROM estado WHERE sigla = 'CE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR')), 'Juazeiro do Norte');

-- EUA - California
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Los Angeles'),
((SELECT id_estado FROM estado WHERE sigla = 'CA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'San Francisco'),
((SELECT id_estado FROM estado WHERE sigla = 'CA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'San Diego'),
((SELECT id_estado FROM estado WHERE sigla = 'CA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Sacramento');

-- EUA - New York
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'New York City'),
((SELECT id_estado FROM estado WHERE sigla = 'NY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Buffalo'),
((SELECT id_estado FROM estado WHERE sigla = 'NY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Albany');

-- EUA - Texas
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Houston'),
((SELECT id_estado FROM estado WHERE sigla = 'TX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Dallas'),
((SELECT id_estado FROM estado WHERE sigla = 'TX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Austin');

-- EUA - Florida
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Miami'),
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Orlando'),
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Tampa');

-- EUA - Illinois
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'IL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Chicago'),
((SELECT id_estado FROM estado WHERE sigla = 'IL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Springfield');

-- EUA - Washington
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'WA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Seattle'),
((SELECT id_estado FROM estado WHERE sigla = 'WA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Spokane');

-- EUA - Georgia
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Atlanta'),
((SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Savannah');

-- EUA - Massachusetts
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Boston'),
((SELECT id_estado FROM estado WHERE sigla = 'MA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US')), 'Cambridge');

-- França - Île-de-France
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'IDF' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Paris'),
((SELECT id_estado FROM estado WHERE sigla = 'IDF' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Versailles');

-- França - Provence-Alpes
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PAC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Marseille'),
((SELECT id_estado FROM estado WHERE sigla = 'PAC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Nice'),
((SELECT id_estado FROM estado WHERE sigla = 'PAC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Cannes');

-- França - Auvergne-Rhône-Alpes
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Lyon'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Grenoble');

-- França - Occitanie
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OCC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Toulouse'),
((SELECT id_estado FROM estado WHERE sigla = 'OCC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Montpellier');

-- França - Bretagne
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BRE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Rennes'),
((SELECT id_estado FROM estado WHERE sigla = 'BRE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Brest');

-- França - Normandie
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NOR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Rouen'),
((SELECT id_estado FROM estado WHERE sigla = 'NOR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Caen');

-- França - Nouvelle-Aquitaine
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NAQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Bordeaux'),
((SELECT id_estado FROM estado WHERE sigla = 'NAQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Biarritz');

-- França - Grand Est
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GES' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Strasbourg'),
((SELECT id_estado FROM estado WHERE sigla = 'GES' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR')), 'Reims');

-- Reino Unido - England
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'London'),
((SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Manchester'),
((SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Birmingham'),
((SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Liverpool'),
((SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Bristol');

-- Reino Unido - Scotland
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SCT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Edinburgh'),
((SELECT id_estado FROM estado WHERE sigla = 'SCT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Glasgow');

-- Reino Unido - Wales
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'WLS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Cardiff'),
((SELECT id_estado FROM estado WHERE sigla = 'WLS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Swansea');

-- Reino Unido - Northern Ireland
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NIR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB')), 'Belfast');

-- Japão - Tokyo
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TKY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Tokyo'),
((SELECT id_estado FROM estado WHERE sigla = 'TKY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Shibuya'),
((SELECT id_estado FROM estado WHERE sigla = 'TKY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Shinjuku');

-- Japão - Osaka
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OSK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Osaka'),
((SELECT id_estado FROM estado WHERE sigla = 'OSK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Sakai');

-- Japão - Kyoto
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'KYT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Kyoto'),
((SELECT id_estado FROM estado WHERE sigla = 'KYT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Uji');

-- Japão - Hokkaido
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HKD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Sapporo'),
((SELECT id_estado FROM estado WHERE sigla = 'HKD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Hakodate');

-- Japão - Fukuoka
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FUK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Fukuoka'),
((SELECT id_estado FROM estado WHERE sigla = 'FUK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Kitakyushu');

-- Japão - Aichi
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Nagoya');

-- Japão - Hiroshima
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HRS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Hiroshima');

-- Japão - Okinawa
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OKN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP')), 'Naha');

-- China - Beijing
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Beijing');

-- China - Shanghai
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Shanghai');

-- China - Guangdong
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Guangzhou'),
((SELECT id_estado FROM estado WHERE sigla = 'GD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Shenzhen');

-- China - Sichuan
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Chengdu');

-- China - Zhejiang
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ZJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Hangzhou'),
((SELECT id_estado FROM estado WHERE sigla = 'ZJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Ningbo');

-- China - Yunnan
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'YN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Kunming');

-- China - Hubei
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Wuhan');

-- China - Shandong
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Qingdao'),
((SELECT id_estado FROM estado WHERE sigla = 'SD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN')), 'Jinan');

-- Canadá - Ontario
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ON' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Toronto'),
((SELECT id_estado FROM estado WHERE sigla = 'ON' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Ottawa'),
((SELECT id_estado FROM estado WHERE sigla = 'ON' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Hamilton');

-- Canadá - Quebec
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'QC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Montreal'),
((SELECT id_estado FROM estado WHERE sigla = 'QC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Quebec City');

-- Canadá - British Columbia
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Vancouver'),
((SELECT id_estado FROM estado WHERE sigla = 'BC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Victoria');

-- Canadá - Alberta
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Calgary'),
((SELECT id_estado FROM estado WHERE sigla = 'AB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Edmonton');

-- Canadá - Manitoba
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Winnipeg');

-- Canadá - Nova Scotia
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA')), 'Halifax');

-- Austrália - New South Wales
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NSW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Sydney'),
((SELECT id_estado FROM estado WHERE sigla = 'NSW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Newcastle');

-- Austrália - Victoria
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'VIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Melbourne'),
((SELECT id_estado FROM estado WHERE sigla = 'VIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Geelong');

-- Austrália - Queensland
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'QLD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Brisbane'),
((SELECT id_estado FROM estado WHERE sigla = 'QLD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Gold Coast'),
((SELECT id_estado FROM estado WHERE sigla = 'QLD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Cairns');

-- Austrália - Western Australia
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'WAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Perth');

-- Austrália - South Australia
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU')), 'Adelaide');

-- Argentina - Buenos Aires
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BAI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'Buenos Aires'),
((SELECT id_estado FROM estado WHERE sigla = 'BAI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'Mar del Plata'),
((SELECT id_estado FROM estado WHERE sigla = 'BAI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'La Plata');

-- Argentina - Córdoba
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'COR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'Córdoba');

-- Argentina - Mendoza
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MDZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'Mendoza');

-- Argentina - Santa Fe
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SFE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'Rosario'),
((SELECT id_estado FROM estado WHERE sigla = 'SFE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'Santa Fe');

-- Argentina - Tucumán
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TUC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR')), 'San Miguel de Tucumán');

-- México - Ciudad de México
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CMX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Ciudad de México');

-- México - Jalisco
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'JAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Guadalajara'),
((SELECT id_estado FROM estado WHERE sigla = 'JAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Puerto Vallarta');

-- México - Nuevo León
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NLE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Monterrey');

-- México - Yucatán
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'YUC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Mérida');

-- México - Quintana Roo
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ROO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Cancún'),
((SELECT id_estado FROM estado WHERE sigla = 'ROO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Playa del Carmen');

-- México - Oaxaca
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OAX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX')), 'Oaxaca de Juárez');

-- ============================================================================
-- 5. AEROPORTOS
-- ============================================================================

INSERT INTO aeroporto (id_cidade, codigo_iata, nome) VALUES
-- Brasil
((SELECT id_cidade FROM cidade WHERE nome = 'São Paulo'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'GRU', 'Aeroporto Internacional de Guarulhos'),
((SELECT id_cidade FROM cidade WHERE nome = 'São Paulo'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'CGH', 'Aeroporto de Congonhas'),
((SELECT id_cidade FROM cidade WHERE nome = 'Rio de Janeiro' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'GIG', 'Aeroporto Internacional Galeão'),
((SELECT id_cidade FROM cidade WHERE nome = 'Rio de Janeiro' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'SDU', 'Aeroporto Santos Dumont'),
((SELECT id_cidade FROM cidade WHERE nome = 'Belo Horizonte' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'MG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'CNF', 'Aeroporto Internacional de Confins'),
((SELECT id_cidade FROM cidade WHERE nome = 'Salvador'     AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'SSA', 'Aeroporto Internacional de Salvador'),
((SELECT id_cidade FROM cidade WHERE nome = 'Curitiba'     AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'PR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'CWB', 'Aeroporto Internacional Afonso Pena'),
((SELECT id_cidade FROM cidade WHERE nome = 'Porto Alegre' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'RS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'POA', 'Aeroporto Internacional Salgado Filho'),
((SELECT id_cidade FROM cidade WHERE nome = 'Recife'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'PE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'REC', 'Aeroporto Internacional do Recife'),
((SELECT id_cidade FROM cidade WHERE nome = 'Fortaleza'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'CE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'BR'))), 'FOR', 'Aeroporto Internacional Pinto Martins'),
-- EUA
((SELECT id_cidade FROM cidade WHERE nome = 'Los Angeles'  AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'CA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'LAX', 'Los Angeles International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'San Francisco' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'CA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'SFO', 'San Francisco International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'New York City' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'JFK', 'John F. Kennedy International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'New York City' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'LGA', 'LaGuardia Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Houston'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'TX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'IAH', 'George Bush Intercontinental Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Dallas'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'TX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'DFW', 'Dallas/Fort Worth International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Miami'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'MIA', 'Miami International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Orlando'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'MCO', 'Orlando International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Chicago'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'IL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'ORD', 'O''Hare International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Seattle'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'WA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'SEA', 'Seattle-Tacoma International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Atlanta'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'ATL', 'Hartsfield-Jackson Atlanta International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Boston'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'MA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'US'))), 'BOS', 'Logan International Airport'),
-- França
((SELECT id_cidade FROM cidade WHERE nome = 'Paris'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'IDF' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR'))), 'CDG', 'Aéroport Paris-Charles de Gaulle'),
((SELECT id_cidade FROM cidade WHERE nome = 'Paris'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'IDF' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR'))), 'ORY', 'Aéroport Paris-Orly'),
((SELECT id_cidade FROM cidade WHERE nome = 'Lyon'         AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR'))), 'LYS', 'Aéroport de Lyon-Saint Exupéry'),
((SELECT id_cidade FROM cidade WHERE nome = 'Nice'         AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'PAC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR'))), 'NCE', 'Aéroport Nice Côte d''Azur'),
((SELECT id_cidade FROM cidade WHERE nome = 'Marseille'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'PAC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'FR'))), 'MRS', 'Aéroport Marseille Provence'),
-- Reino Unido
((SELECT id_cidade FROM cidade WHERE nome = 'London'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB'))), 'LHR', 'London Heathrow Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'London'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB'))), 'LGW', 'London Gatwick Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Manchester'   AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ENG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB'))), 'MAN', 'Manchester Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Edinburgh'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SCT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'GB'))), 'EDI', 'Edinburgh Airport'),
-- Japão
((SELECT id_cidade FROM cidade WHERE nome = 'Tokyo'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'TKY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP'))), 'NRT', 'Narita International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Tokyo'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'TKY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP'))), 'HND', 'Tokyo Haneda Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Osaka'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'OSK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP'))), 'KIX', 'Kansai International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Sapporo'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'HKD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP'))), 'CTS', 'New Chitose Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Fukuoka'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'FUK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP'))), 'FUK', 'Fukuoka Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Nagoya'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'AIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'JP'))), 'NGO', 'Chubu Centrair International Airport'),
-- China
((SELECT id_cidade FROM cidade WHERE nome = 'Beijing'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BJ'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN'))), 'PEK', 'Beijing Capital International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Shanghai'     AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SH'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN'))), 'PVG', 'Shanghai Pudong International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Guangzhou'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'GD'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN'))), 'CAN', 'Guangzhou Baiyun International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Chengdu'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SC'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CN'))), 'CTU', 'Chengdu Tianfu International Airport'),
-- Canadá
((SELECT id_cidade FROM cidade WHERE nome = 'Toronto'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ON'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA'))), 'YYZ', 'Toronto Pearson International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Montreal'     AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'QC'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA'))), 'YUL', 'Montréal-Pierre Elliott Trudeau International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Vancouver'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BC'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA'))), 'YVR', 'Vancouver International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Calgary'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'AB'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CA'))), 'YYC', 'Calgary International Airport'),
-- Austrália
((SELECT id_cidade FROM cidade WHERE nome = 'Sydney'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NSW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU'))), 'SYD', 'Sydney Kingsford Smith Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Melbourne'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'VIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU'))), 'MEL', 'Melbourne Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Brisbane'     AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'QLD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU'))), 'BNE', 'Brisbane Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Perth'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'WAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AU'))), 'PER', 'Perth Airport'),
-- Argentina
((SELECT id_cidade FROM cidade WHERE nome = 'Buenos Aires' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BAI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR'))), 'EZE', 'Aeropuerto Internacional Ministro Pistarini'),
((SELECT id_cidade FROM cidade WHERE nome = 'Buenos Aires' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BAI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR'))), 'AEP', 'Aeroparque Jorge Newbery'),
((SELECT id_cidade FROM cidade WHERE nome = 'Córdoba'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'COR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AR'))), 'COR', 'Aeropuerto Internacional Ingeniero Ambrosio Taravella'),
-- México
((SELECT id_cidade FROM cidade WHERE nome = 'Ciudad de México' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'CMX' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX'))), 'MEX', 'Aeropuerto Internacional Benito Juárez'),
((SELECT id_cidade FROM cidade WHERE nome = 'Guadalajara'  AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'JAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX'))), 'GDL', 'Aeropuerto Internacional de Guadalajara'),
((SELECT id_cidade FROM cidade WHERE nome = 'Monterrey'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NLE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX'))), 'MTY', 'Aeropuerto Internacional de Monterrey'),
((SELECT id_cidade FROM cidade WHERE nome = 'Cancún'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ROO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'MX'))), 'CUN', 'Aeropuerto Internacional de Cancún');

-- ============================================================================
-- 6. COMPANHIAS AÉREAS
-- ============================================================================

INSERT INTO companhia (nome, codigo_icao) VALUES
('LATAM Airlines Brasil',    'TAM'),
('Azul Linhas Aéreas',       'AZU'),
('Gol Linhas Aéreas',        'GLO'),
('American Airlines',        'AAL'),
('Delta Air Lines',          'DAL'),
('United Airlines',          'UAL'),
('Air France',               'AFR'),
('British Airways',          'BAW'),
('Japan Airlines',           'JAL'),
('Qantas Airways',           'QFA'),
('Air Canada',               'ACA'),
('Aeromexico',               'AMX'),
('Lufthansa',                'DLH'),
('Emirates',                 'UAE'),
('Singapore Airlines',       'SIA');

-- ============================================================================
-- 7. MODELOS DE AERONAVE
-- ============================================================================

INSERT INTO modelo_aeronave (fabricante, nome_modelo, capacidade_assentos) VALUES
('Boeing',   '737-800',    186),
('Boeing',   '737 MAX 8',  178),
('Boeing',   '777-300ER',  396),
('Boeing',   '787-9',      296),
('Airbus',   'A320neo',    174),
('Airbus',   'A321neo',    220),
('Airbus',   'A330-300',   295),
('Airbus',   'A350-900',   369),
('Airbus',   'A380-800',   555),
('Embraer',  'E195-E2',    136);

-- ============================================================================
-- 8. AERONAVES
-- ============================================================================

-- LATAM (A320neo, B787-9, A321neo)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'TAM'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A320neo'),  'PR-XBA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'TAM'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A320neo'),  'PR-XBB', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'TAM'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '787-9'),    'PT-MXA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'TAM'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A321neo'),  'PR-MYA', true);

-- Azul (E195-E2, A320neo)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AZU'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'E195-E2'),  'PS-AEA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AZU'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'E195-E2'),  'PS-AEB', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AZU'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A320neo'),  'PS-AKA', true);

-- Gol (B737-800, B737 MAX 8)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'GLO'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '737-800'),  'PR-GXT', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'GLO'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '737-800'),  'PR-GXU', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'GLO'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '737 MAX 8'),'PR-XMH', true);

-- American Airlines (B737-800, B777-300ER)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AAL'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '737-800'),   'N905AN', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AAL'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '777-300ER'), 'N756AM', true);

-- Delta (B737-800, A350-900)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'DAL'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '737-800'),  'N814DN', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'DAL'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A350-900'), 'N501DN', true);

-- Air France (A320neo, A330-300, A380-800)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AFR'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A320neo'),  'F-GKXA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AFR'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A330-300'), 'F-GZCA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'AFR'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A380-800'), 'F-HPJA', true);

-- British Airways (A320neo, B777-300ER)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'BAW'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A320neo'),  'G-EUYA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'BAW'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '777-300ER'),'G-STBA', true);

-- Japan Airlines (B787-9, A350-900)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'JAL'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '787-9'),    'JA837J', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'JAL'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A350-900'), 'JA01XJ', true);

-- Qantas (B787-9, A380-800)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'QFA'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '787-9'),    'VH-ZNA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'QFA'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A380-800'), 'VH-OQA', true);

-- Emirates (A380-800, B777-300ER)
INSERT INTO aeronave (id_companhia, id_modelo, codigo_registro, ativo) VALUES
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'UAE'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = 'A380-800'), 'A6-EDA', true),
((SELECT id_companhia FROM companhia WHERE codigo_icao = 'UAE'), (SELECT id_modelo FROM modelo_aeronave WHERE nome_modelo = '777-300ER'),'A6-EGA', true);
