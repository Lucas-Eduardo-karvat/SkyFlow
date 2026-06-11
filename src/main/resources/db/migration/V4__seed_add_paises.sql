INSERT INTO pais (nome, sigla) VALUES
('Alemanha',        'DE'),
('Itália',          'IT'),
('Espanha',         'ES'),
('Portugal',        'PT'),
('Países Baixos',   'NL'),
('Coreia do Sul',   'KR'),
('Índia',           'IN'),
('África do Sul',   'ZA'),
('Emirados Árabes Unidos', 'AE'),
('Chile',           'CL');
 
-- ============================================================================
-- 2. ESTADOS DOS NOVOS PAÍSES
-- ============================================================================
 
-- Alemanha (16 estados)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Bayern',                  'BY'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Nordrhein-Westfalen',     'NW'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Baden-Württemberg',       'BW'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Berlin',                  'BLN'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Hamburg',                 'HH'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Hessen',                  'HE'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Sachsen',                 'SN'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Rheinland-Pfalz',        'RP'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Sachsen-Anhalt',          'ST'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Thüringen',               'TH'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Brandenburg',             'BB'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Mecklenburg-Vorpommern',  'MV'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Niedersachsen',           'NI'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Schleswig-Holstein',      'SH'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Saarland',                'SL'),
((SELECT id_pais FROM pais WHERE sigla = 'DE'), 'Bremen',                  'HB');
 
-- Itália (20 regiões)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Lombardia',               'LOM'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Lazio',                   'LAZ'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Campania',                'CAM'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Sicilia',                 'SIC'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Veneto',                  'VEN'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Piemonte',                'PIE'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Emilia-Romagna',          'EMR'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Puglia',                  'PUG'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Toscana',                 'TOS'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Calabria',                'CAL'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Sardegna',                'SAR'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Liguria',                 'LIG'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Marche',                  'MAR'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Abruzzo',                 'ABR'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Friuli-Venezia Giulia',   'FVG'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Trentino-Alto Adige',     'TAA'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Umbria',                  'UMB'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Basilicata',              'BAS'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Molise',                  'MOL'),
((SELECT id_pais FROM pais WHERE sigla = 'IT'), 'Valle d''Aosta',          'VDA');
 
-- Espanha (17 comunidades autônomas)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Cataluña',                'CAT'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Madrid',                  'MAD'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Andalucía',               'AND'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Comunidad Valenciana',    'VAL'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'País Vasco',              'PVA'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Galicia',                 'GAL'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Castilla y León',         'CYL'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Canarias',                'CAN'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Castilla-La Mancha',      'CLM'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Región de Murcia',        'MUR'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Aragón',                  'ARA'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Extremadura',             'EXT'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Asturias',                'AST'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Navarra',                 'NAV'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Cantabria',               'CBR'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'La Rioja',                'RIO'),
((SELECT id_pais FROM pais WHERE sigla = 'ES'), 'Islas Baleares',          'BAL');
 
-- Portugal (7 regiões)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Lisboa',                  'LIS'),
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Porto',                   'PRT'),
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Centro',                  'CEN'),
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Alentejo',                'ALE'),
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Algarve',                 'ALG'),
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Norte',                   'NOR'),
((SELECT id_pais FROM pais WHERE sigla = 'PT'), 'Açores',                  'ACO');
 
-- Países Baixos (12 províncias)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Noord-Holland',           'NH'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Zuid-Holland',            'ZH'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Noord-Brabant',           'NB'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Gelderland',              'GE'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Utrecht',                 'UT'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Overijssel',              'OV'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Limburg',                 'LI'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Groningen',               'GR'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Friesland',               'FR'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Drenthe',                 'DR'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Zeeland',                 'ZE'),
((SELECT id_pais FROM pais WHERE sigla = 'NL'), 'Flevoland',               'FL');
 
-- Coreia do Sul (17 divisões)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Seoul',                   'SEO'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Busan',                   'BSN'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Incheon',                 'ICN'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Daegu',                   'DAE'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Daejeon',                 'DJN'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Gwangju',                 'GWJ'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Gyeonggi',                'GGI'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Gangwon',                 'GWN'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'North Chungcheong',       'CNB'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'South Chungcheong',       'CNS'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'North Jeolla',            'JNB'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'South Jeolla',            'JNS'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'North Gyeongsang',        'GNB'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'South Gyeongsang',        'GNS'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Jeju',                    'JEJ'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Ulsan',                   'ULS'),
((SELECT id_pais FROM pais WHERE sigla = 'KR'), 'Sejong',                  'SJG');
 
-- Índia (28 estados principais)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Maharashtra',             'MH'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Uttar Pradesh',           'UP'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Tamil Nadu',              'TN'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Karnataka',               'KA'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Gujarat',                 'GJ'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Rajasthan',               'RJ'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'West Bengal',             'WB'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Andhra Pradesh',          'AP'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Telangana',               'TS'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Kerala',                  'KL'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Punjab',                  'PB'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Haryana',                 'HR'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Madhya Pradesh',          'MP'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Bihar',                   'BR'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Odisha',                  'OD'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Jharkhand',               'JH'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Assam',                   'AS'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Uttarakhand',             'UK'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Himachal Pradesh',        'HP'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Chhattisgarh',            'CG'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Goa',                     'GA'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Delhi',                   'DL'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Jammu e Kashmir',         'JK'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Manipur',                 'MN'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Meghalaya',               'ML'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Nagaland',                'NL'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Tripura',                 'TR'),
((SELECT id_pais FROM pais WHERE sigla = 'IN'), 'Sikkim',                  'SK');
 
-- África do Sul (9 províncias)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Gauteng',                 'GP'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Western Cape',            'WC'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'KwaZulu-Natal',           'KZN'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Eastern Cape',            'EC'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Limpopo',                 'LP'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Mpumalanga',              'MP'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'North West',              'NW'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Free State',              'FS'),
((SELECT id_pais FROM pais WHERE sigla = 'ZA'), 'Northern Cape',           'NC');
 
-- Emirados Árabes Unidos (7 emirados)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Dubai',                   'DXB'),
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Abu Dhabi',               'AUH'),
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Sharjah',                 'SHJ'),
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Ajman',                   'AJM'),
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Ras Al Khaimah',          'RAK'),
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Fujairah',                'FUJ'),
((SELECT id_pais FROM pais WHERE sigla = 'AE'), 'Umm Al Quwain',           'UAQ');
 
-- Chile (16 regiões)
INSERT INTO estado (id_pais, nome, sigla) VALUES
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Metropolitana',           'RM'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Valparaíso',              'VAL'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Biobío',                  'BIO'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'La Araucanía',            'ARA'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Maule',                   'MAU'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'O''Higgins',              'OHI'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Los Lagos',               'LLA'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Coquimbo',                'COQ'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Antofagasta',             'ANT'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Atacama',                 'ATA'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Tarapacá',                'TAR'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Los Ríos',                'LRI'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Aysén',                   'AYS'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Magallanes',              'MAG'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Arica y Parinacota',      'AYP'),
((SELECT id_pais FROM pais WHERE sigla = 'CL'), 'Ñuble',                   'NUB');
 
-- ============================================================================
-- 3. CIDADES
-- ============================================================================
 
-- Alemanha - Bayern (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Munich'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Nuremberg'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Augsburg'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Regensburg'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Würzburg'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Erlangen'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Fürth'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Ingolstadt'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bayreuth'),
((SELECT id_estado FROM estado WHERE sigla = 'BY' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bamberg');
 
-- Alemanha - Nordrhein-Westfalen (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Cologne'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Dusseldorf'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Dortmund'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Essen'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Duisburg'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bochum'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Wuppertal'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bielefeld'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bonn'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Münster');
 
-- Alemanha - Berlin (conhecido: 10 cidades/distritos)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Berlin'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Mitte'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Kreuzberg'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Charlottenburg'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Prenzlauer Berg'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Friedrichshain'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Neukölln'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Spandau'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Steglitz'),
((SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Tempelhof');
 
-- Alemanha - Hamburg (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Hamburg'),
((SELECT id_estado FROM estado WHERE sigla = 'HH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Altona'),
((SELECT id_estado FROM estado WHERE sigla = 'HH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Harburg'),
((SELECT id_estado FROM estado WHERE sigla = 'HH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Wandsbek'),
((SELECT id_estado FROM estado WHERE sigla = 'HH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Eimsbüttel');
 
-- Alemanha - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Stuttgart'),
((SELECT id_estado FROM estado WHERE sigla = 'BW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Karlsruhe'),
((SELECT id_estado FROM estado WHERE sigla = 'BW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Mannheim'),
((SELECT id_estado FROM estado WHERE sigla = 'BW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Freiburg');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Frankfurt'),
((SELECT id_estado FROM estado WHERE sigla = 'HE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Wiesbaden'),
((SELECT id_estado FROM estado WHERE sigla = 'HE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Kassel'),
((SELECT id_estado FROM estado WHERE sigla = 'HE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Darmstadt');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Dresden'),
((SELECT id_estado FROM estado WHERE sigla = 'SN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Leipzig'),
((SELECT id_estado FROM estado WHERE sigla = 'SN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Chemnitz'),
((SELECT id_estado FROM estado WHERE sigla = 'SN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Zwickau');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Mainz'),
((SELECT id_estado FROM estado WHERE sigla = 'RP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Ludwigshafen'),
((SELECT id_estado FROM estado WHERE sigla = 'RP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Koblenz'),
((SELECT id_estado FROM estado WHERE sigla = 'RP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Trier');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Magdeburg'),
((SELECT id_estado FROM estado WHERE sigla = 'ST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Halle'),
((SELECT id_estado FROM estado WHERE sigla = 'ST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Dessau'),
((SELECT id_estado FROM estado WHERE sigla = 'ST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Lutherstadt Wittenberg');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Erfurt'),
((SELECT id_estado FROM estado WHERE sigla = 'TH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Jena'),
((SELECT id_estado FROM estado WHERE sigla = 'TH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Gera'),
((SELECT id_estado FROM estado WHERE sigla = 'TH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Weimar');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Potsdam'),
((SELECT id_estado FROM estado WHERE sigla = 'BB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Cottbus'),
((SELECT id_estado FROM estado WHERE sigla = 'BB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Brandenburg'),
((SELECT id_estado FROM estado WHERE sigla = 'BB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Frankfurt an der Oder');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Rostock'),
((SELECT id_estado FROM estado WHERE sigla = 'MV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Schwerin'),
((SELECT id_estado FROM estado WHERE sigla = 'MV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Stralsund'),
((SELECT id_estado FROM estado WHERE sigla = 'MV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Greifswald');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Hannover'),
((SELECT id_estado FROM estado WHERE sigla = 'NI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Brunswick'),
((SELECT id_estado FROM estado WHERE sigla = 'NI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Osnabrück'),
((SELECT id_estado FROM estado WHERE sigla = 'NI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Oldenburg');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Kiel'),
((SELECT id_estado FROM estado WHERE sigla = 'SH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Lübeck'),
((SELECT id_estado FROM estado WHERE sigla = 'SH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Flensburg'),
((SELECT id_estado FROM estado WHERE sigla = 'SH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Neumünster');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Saarbrücken'),
((SELECT id_estado FROM estado WHERE sigla = 'SL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Neunkirchen'),
((SELECT id_estado FROM estado WHERE sigla = 'SL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Homburg'),
((SELECT id_estado FROM estado WHERE sigla = 'SL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Völklingen');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bremen'),
((SELECT id_estado FROM estado WHERE sigla = 'HB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Bremerhaven'),
((SELECT id_estado FROM estado WHERE sigla = 'HB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Delmenhorst'),
((SELECT id_estado FROM estado WHERE sigla = 'HB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE')), 'Stuhr');
 
-- Itália - Lombardia (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Milan'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Bergamo'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Brescia'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Como'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Monza'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Pavia'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Cremona'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Mantova'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Varese'),
((SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Lecco');
 
-- Itália - Lazio (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Rome'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Latina'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Frosinone'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Viterbo'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Rieti'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Tivoli'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Civitavecchia'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Ostia'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Velletri'),
((SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Guidonia');
 
-- Itália - Toscana (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Florence'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Pisa'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Siena'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Lucca'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Livorno'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Arezzo'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Grosseto'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Pistoia'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Prato'),
((SELECT id_estado FROM estado WHERE sigla = 'TOS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Massa');
 
-- Itália - Veneto (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Venice'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Verona'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Padova'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Vicenza'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Treviso'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Belluno'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Rovigo'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Bassano del Grappa'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Mestre'),
((SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Chioggia');
 
-- Itália - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CAM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Naples'),
((SELECT id_estado FROM estado WHERE sigla = 'CAM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Salerno'),
((SELECT id_estado FROM estado WHERE sigla = 'CAM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Caserta'),
((SELECT id_estado FROM estado WHERE sigla = 'CAM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Avellino');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Palermo'),
((SELECT id_estado FROM estado WHERE sigla = 'SIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Catania'),
((SELECT id_estado FROM estado WHERE sigla = 'SIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Messina'),
((SELECT id_estado FROM estado WHERE sigla = 'SIC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Agrigento');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PIE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Turin'),
((SELECT id_estado FROM estado WHERE sigla = 'PIE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Novara'),
((SELECT id_estado FROM estado WHERE sigla = 'PIE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Alessandria'),
((SELECT id_estado FROM estado WHERE sigla = 'PIE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Asti');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'EMR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Bologna'),
((SELECT id_estado FROM estado WHERE sigla = 'EMR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Modena'),
((SELECT id_estado FROM estado WHERE sigla = 'EMR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Parma'),
((SELECT id_estado FROM estado WHERE sigla = 'EMR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Ferrara');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PUG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Bari'),
((SELECT id_estado FROM estado WHERE sigla = 'PUG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Taranto'),
((SELECT id_estado FROM estado WHERE sigla = 'PUG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Lecce'),
((SELECT id_estado FROM estado WHERE sigla = 'PUG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Foggia');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Reggio Calabria'),
((SELECT id_estado FROM estado WHERE sigla = 'CAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Catanzaro'),
((SELECT id_estado FROM estado WHERE sigla = 'CAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Cosenza'),
((SELECT id_estado FROM estado WHERE sigla = 'CAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Crotone');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Cagliari'),
((SELECT id_estado FROM estado WHERE sigla = 'SAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Sassari'),
((SELECT id_estado FROM estado WHERE sigla = 'SAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Nuoro'),
((SELECT id_estado FROM estado WHERE sigla = 'SAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Oristano');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LIG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Genoa'),
((SELECT id_estado FROM estado WHERE sigla = 'LIG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'La Spezia'),
((SELECT id_estado FROM estado WHERE sigla = 'LIG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Savona'),
((SELECT id_estado FROM estado WHERE sigla = 'LIG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Imperia');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Ancona'),
((SELECT id_estado FROM estado WHERE sigla = 'MAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Pesaro'),
((SELECT id_estado FROM estado WHERE sigla = 'MAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Macerata'),
((SELECT id_estado FROM estado WHERE sigla = 'MAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Fermo');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ABR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'L''Aquila'),
((SELECT id_estado FROM estado WHERE sigla = 'ABR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Pescara'),
((SELECT id_estado FROM estado WHERE sigla = 'ABR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Chieti'),
((SELECT id_estado FROM estado WHERE sigla = 'ABR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Teramo');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FVG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Trieste'),
((SELECT id_estado FROM estado WHERE sigla = 'FVG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Udine'),
((SELECT id_estado FROM estado WHERE sigla = 'FVG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Pordenone'),
((SELECT id_estado FROM estado WHERE sigla = 'FVG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Gorizia');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TAA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Trento'),
((SELECT id_estado FROM estado WHERE sigla = 'TAA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Bolzano'),
((SELECT id_estado FROM estado WHERE sigla = 'TAA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Rovereto'),
((SELECT id_estado FROM estado WHERE sigla = 'TAA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Merano');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'UMB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Perugia'),
((SELECT id_estado FROM estado WHERE sigla = 'UMB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Terni'),
((SELECT id_estado FROM estado WHERE sigla = 'UMB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Foligno'),
((SELECT id_estado FROM estado WHERE sigla = 'UMB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Assisi');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BAS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Potenza'),
((SELECT id_estado FROM estado WHERE sigla = 'BAS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Matera'),
((SELECT id_estado FROM estado WHERE sigla = 'BAS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Melfi'),
((SELECT id_estado FROM estado WHERE sigla = 'BAS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Venosa');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MOL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Campobasso'),
((SELECT id_estado FROM estado WHERE sigla = 'MOL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Isernia'),
((SELECT id_estado FROM estado WHERE sigla = 'MOL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Termoli'),
((SELECT id_estado FROM estado WHERE sigla = 'MOL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Venafro');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'VDA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Aosta'),
((SELECT id_estado FROM estado WHERE sigla = 'VDA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Courmayeur'),
((SELECT id_estado FROM estado WHERE sigla = 'VDA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Breuil-Cervinia'),
((SELECT id_estado FROM estado WHERE sigla = 'VDA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT')), 'Châtillon');
 
-- Espanha - Cataluña (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Barcelona'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Girona'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Lleida'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Tarragona'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Hospitalet de Llobregat'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Badalona'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Terrassa'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Sabadell'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Mataró'),
((SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Santa Coloma de Gramenet');
 
-- Espanha - Madrid (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Madrid'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Móstoles'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Alcalá de Henares'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Fuenlabrada'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Leganés'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Getafe'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Alcorcón'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Torrejón de Ardoz'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Parla'),
((SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Alcobendas');
 
-- Espanha - Andalucía (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Seville'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Malaga'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Córdoba'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Granada'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Almería'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Huelva'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Cádiz'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Jaén'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Jerez de la Frontera'),
((SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Marbella');
 
-- Espanha - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Valencia'),
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Alicante'),
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Castellón'),
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Elche');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PVA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Bilbao'),
((SELECT id_estado FROM estado WHERE sigla = 'PVA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'San Sebastián'),
((SELECT id_estado FROM estado WHERE sigla = 'PVA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Vitoria-Gasteiz'),
((SELECT id_estado FROM estado WHERE sigla = 'PVA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Barakaldo');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Vigo'),
((SELECT id_estado FROM estado WHERE sigla = 'GAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'A Coruña'),
((SELECT id_estado FROM estado WHERE sigla = 'GAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Santiago de Compostela'),
((SELECT id_estado FROM estado WHERE sigla = 'GAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Ourense');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CAN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Las Palmas'),
((SELECT id_estado FROM estado WHERE sigla = 'CAN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Santa Cruz de Tenerife'),
((SELECT id_estado FROM estado WHERE sigla = 'CAN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Arrecife'),
((SELECT id_estado FROM estado WHERE sigla = 'CAN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Puerto del Rosario');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Zaragoza'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Huesca'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Teruel'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Calatayud');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Oviedo'),
((SELECT id_estado FROM estado WHERE sigla = 'AST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Gijón'),
((SELECT id_estado FROM estado WHERE sigla = 'AST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Avilés'),
((SELECT id_estado FROM estado WHERE sigla = 'AST' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Mieres');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NAV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Pamplona'),
((SELECT id_estado FROM estado WHERE sigla = 'NAV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Tudela'),
((SELECT id_estado FROM estado WHERE sigla = 'NAV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Barañáin'),
((SELECT id_estado FROM estado WHERE sigla = 'NAV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Burlada');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CBR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Santander'),
((SELECT id_estado FROM estado WHERE sigla = 'CBR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Torrelavega'),
((SELECT id_estado FROM estado WHERE sigla = 'CBR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Castro-Urdiales'),
((SELECT id_estado FROM estado WHERE sigla = 'CBR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Camargo');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Logroño'),
((SELECT id_estado FROM estado WHERE sigla = 'RIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Calahorra'),
((SELECT id_estado FROM estado WHERE sigla = 'RIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Arnedo'),
((SELECT id_estado FROM estado WHERE sigla = 'RIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Haro');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Palma de Mallorca'),
((SELECT id_estado FROM estado WHERE sigla = 'BAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Ibiza'),
((SELECT id_estado FROM estado WHERE sigla = 'BAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Manacor'),
((SELECT id_estado FROM estado WHERE sigla = 'BAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Mahón');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CYL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Valladolid'),
((SELECT id_estado FROM estado WHERE sigla = 'CYL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Burgos'),
((SELECT id_estado FROM estado WHERE sigla = 'CYL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Salamanca'),
((SELECT id_estado FROM estado WHERE sigla = 'CYL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'León');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CLM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Toledo'),
((SELECT id_estado FROM estado WHERE sigla = 'CLM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Albacete'),
((SELECT id_estado FROM estado WHERE sigla = 'CLM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Ciudad Real'),
((SELECT id_estado FROM estado WHERE sigla = 'CLM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Cuenca');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MUR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Murcia'),
((SELECT id_estado FROM estado WHERE sigla = 'MUR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Cartagena'),
((SELECT id_estado FROM estado WHERE sigla = 'MUR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Lorca'),
((SELECT id_estado FROM estado WHERE sigla = 'MUR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Molina de Segura');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'EXT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Badajoz'),
((SELECT id_estado FROM estado WHERE sigla = 'EXT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Cáceres'),
((SELECT id_estado FROM estado WHERE sigla = 'EXT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Mérida'),
((SELECT id_estado FROM estado WHERE sigla = 'EXT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES')), 'Plasencia');
 
-- Portugal - Lisboa (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Lisbon'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Sintra'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Cascais'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Amadora'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Loures'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Oeiras'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Setúbal'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Almada'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Barreiro'),
((SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Seixal');
 
-- Portugal - Porto (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Porto'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Vila Nova de Gaia'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Braga'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Matosinhos'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Guimarães'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Gondomar'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Maia'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Valongo'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Barcelos'),
((SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Viana do Castelo');
 
-- Portugal - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Coimbra'),
((SELECT id_estado FROM estado WHERE sigla = 'CEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Leiria'),
((SELECT id_estado FROM estado WHERE sigla = 'CEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Aveiro'),
((SELECT id_estado FROM estado WHERE sigla = 'CEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Viseu');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ALE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Évora'),
((SELECT id_estado FROM estado WHERE sigla = 'ALE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Beja'),
((SELECT id_estado FROM estado WHERE sigla = 'ALE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Portalegre'),
((SELECT id_estado FROM estado WHERE sigla = 'ALE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Elvas');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ALG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Faro'),
((SELECT id_estado FROM estado WHERE sigla = 'ALG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Portimão'),
((SELECT id_estado FROM estado WHERE sigla = 'ALG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Albufeira'),
((SELECT id_estado FROM estado WHERE sigla = 'ALG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Lagos');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NOR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Braga'),
((SELECT id_estado FROM estado WHERE sigla = 'NOR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Vila Real'),
((SELECT id_estado FROM estado WHERE sigla = 'NOR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Bragança'),
((SELECT id_estado FROM estado WHERE sigla = 'NOR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Chaves');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ACO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Ponta Delgada'),
((SELECT id_estado FROM estado WHERE sigla = 'ACO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Angra do Heroísmo'),
((SELECT id_estado FROM estado WHERE sigla = 'ACO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Horta'),
((SELECT id_estado FROM estado WHERE sigla = 'ACO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT')), 'Ribeira Grande');
 
-- Países Baixos - Noord-Holland (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Amsterdam'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Haarlem'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Alkmaar'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Zaandam'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Hilversum'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Purmerend'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Hoorn'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Amstelveen'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Velsen'),
((SELECT id_estado FROM estado WHERE sigla = 'NH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Heerhugowaard');
 
-- Países Baixos - Zuid-Holland (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Rotterdam'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'The Hague'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Leiden'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Dordrecht'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Zoetermeer'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Delft'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Westland'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Alphen aan den Rijn'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Gouda'),
((SELECT id_estado FROM estado WHERE sigla = 'ZH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Brielle');
 
-- Países Baixos - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Eindhoven'),
((SELECT id_estado FROM estado WHERE sigla = 'NB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Tilburg'),
((SELECT id_estado FROM estado WHERE sigla = 'NB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Breda'),
((SELECT id_estado FROM estado WHERE sigla = 'NB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Den Bosch');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Nijmegen'),
((SELECT id_estado FROM estado WHERE sigla = 'GE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Arnhem'),
((SELECT id_estado FROM estado WHERE sigla = 'GE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Apeldoorn'),
((SELECT id_estado FROM estado WHERE sigla = 'GE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Ede');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'UT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Utrecht'),
((SELECT id_estado FROM estado WHERE sigla = 'UT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Amersfoort'),
((SELECT id_estado FROM estado WHERE sigla = 'UT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Nieuwegein'),
((SELECT id_estado FROM estado WHERE sigla = 'UT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Veenendaal');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Enschede'),
((SELECT id_estado FROM estado WHERE sigla = 'OV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Zwolle'),
((SELECT id_estado FROM estado WHERE sigla = 'OV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Deventer'),
((SELECT id_estado FROM estado WHERE sigla = 'OV' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Hengelo');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Maastricht'),
((SELECT id_estado FROM estado WHERE sigla = 'LI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Venlo'),
((SELECT id_estado FROM estado WHERE sigla = 'LI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Heerlen'),
((SELECT id_estado FROM estado WHERE sigla = 'LI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Sittard');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Groningen'),
((SELECT id_estado FROM estado WHERE sigla = 'GR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Emmen'),
((SELECT id_estado FROM estado WHERE sigla = 'GR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Assen'),
((SELECT id_estado FROM estado WHERE sigla = 'GR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Hoogeveen');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Leeuwarden'),
((SELECT id_estado FROM estado WHERE sigla = 'FR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Smallingerland'),
((SELECT id_estado FROM estado WHERE sigla = 'FR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Súdwest-Fryslân'),
((SELECT id_estado FROM estado WHERE sigla = 'FR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Heerenveen');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'DR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Emmen'),
((SELECT id_estado FROM estado WHERE sigla = 'DR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Meppel'),
((SELECT id_estado FROM estado WHERE sigla = 'DR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Coevorden'),
((SELECT id_estado FROM estado WHERE sigla = 'DR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Hoogeveen');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ZE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Middelburg'),
((SELECT id_estado FROM estado WHERE sigla = 'ZE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Vlissingen'),
((SELECT id_estado FROM estado WHERE sigla = 'ZE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Goes'),
((SELECT id_estado FROM estado WHERE sigla = 'ZE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Terneuzen');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Almere'),
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Lelystad'),
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Dronten'),
((SELECT id_estado FROM estado WHERE sigla = 'FL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL')), 'Zeewolde');
 
-- Coreia do Sul - Seoul (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Seoul'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gangnam'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jongno'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Mapo'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Nowon'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Dobong'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Songpa'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Eunpyeong'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Seodaemun'),
((SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Yongsan');
 
-- Coreia do Sul - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BSN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Busan'),
((SELECT id_estado FROM estado WHERE sigla = 'BSN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Haeundae'),
((SELECT id_estado FROM estado WHERE sigla = 'BSN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Suyeong'),
((SELECT id_estado FROM estado WHERE sigla = 'BSN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Buk-gu');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ICN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Incheon'),
((SELECT id_estado FROM estado WHERE sigla = 'ICN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Bupyeong'),
((SELECT id_estado FROM estado WHERE sigla = 'ICN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Namdong'),
((SELECT id_estado FROM estado WHERE sigla = 'ICN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Yeonsu');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'DAE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Daegu'),
((SELECT id_estado FROM estado WHERE sigla = 'DAE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Dalseo'),
((SELECT id_estado FROM estado WHERE sigla = 'DAE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Buk-gu Daegu'),
((SELECT id_estado FROM estado WHERE sigla = 'DAE' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Suseong');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GGI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Suwon'),
((SELECT id_estado FROM estado WHERE sigla = 'GGI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Seongnam'),
((SELECT id_estado FROM estado WHERE sigla = 'GGI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Goyang'),
((SELECT id_estado FROM estado WHERE sigla = 'GGI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Yongin');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'JEJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jeju City'),
((SELECT id_estado FROM estado WHERE sigla = 'JEJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Seogwipo'),
((SELECT id_estado FROM estado WHERE sigla = 'JEJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Aewol'),
((SELECT id_estado FROM estado WHERE sigla = 'JEJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jocheon');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'DJN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Daejeon'),
((SELECT id_estado FROM estado WHERE sigla = 'DJN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Yuseong'),
((SELECT id_estado FROM estado WHERE sigla = 'DJN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Seo-gu'),
((SELECT id_estado FROM estado WHERE sigla = 'DJN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Dong-gu');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GWJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gwangju'),
((SELECT id_estado FROM estado WHERE sigla = 'GWJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Buk-gu Gwangju'),
((SELECT id_estado FROM estado WHERE sigla = 'GWJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Nam-gu'),
((SELECT id_estado FROM estado WHERE sigla = 'GWJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gwangsan');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GWN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Chuncheon'),
((SELECT id_estado FROM estado WHERE sigla = 'GWN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Wonju'),
((SELECT id_estado FROM estado WHERE sigla = 'GWN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gangneung'),
((SELECT id_estado FROM estado WHERE sigla = 'GWN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Sokcho');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ULS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Ulsan'),
((SELECT id_estado FROM estado WHERE sigla = 'ULS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Nam-gu Ulsan'),
((SELECT id_estado FROM estado WHERE sigla = 'ULS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Dong-gu Ulsan'),
((SELECT id_estado FROM estado WHERE sigla = 'ULS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Buk-gu Ulsan');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SJG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Sejong'),
((SELECT id_estado FROM estado WHERE sigla = 'SJG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Dodam'),
((SELECT id_estado FROM estado WHERE sigla = 'SJG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Hansol'),
((SELECT id_estado FROM estado WHERE sigla = 'SJG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Naseong');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Cheongju'),
((SELECT id_estado FROM estado WHERE sigla = 'CNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Chungju'),
((SELECT id_estado FROM estado WHERE sigla = 'CNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jecheon'),
((SELECT id_estado FROM estado WHERE sigla = 'CNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Goesan');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Cheonan'),
((SELECT id_estado FROM estado WHERE sigla = 'CNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Asan'),
((SELECT id_estado FROM estado WHERE sigla = 'CNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Seosan'),
((SELECT id_estado FROM estado WHERE sigla = 'CNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Hongseong');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'JNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jeonju'),
((SELECT id_estado FROM estado WHERE sigla = 'JNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Iksan'),
((SELECT id_estado FROM estado WHERE sigla = 'JNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gunsan'),
((SELECT id_estado FROM estado WHERE sigla = 'JNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jeongeup');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'JNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Yeosu'),
((SELECT id_estado FROM estado WHERE sigla = 'JNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Suncheon'),
((SELECT id_estado FROM estado WHERE sigla = 'JNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Mokpo'),
((SELECT id_estado FROM estado WHERE sigla = 'JNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gwangyang');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Pohang'),
((SELECT id_estado FROM estado WHERE sigla = 'GNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gumi'),
((SELECT id_estado FROM estado WHERE sigla = 'GNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Andong'),
((SELECT id_estado FROM estado WHERE sigla = 'GNB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gyeongju');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Changwon'),
((SELECT id_estado FROM estado WHERE sigla = 'GNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Jinju'),
((SELECT id_estado FROM estado WHERE sigla = 'GNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Gimhae'),
((SELECT id_estado FROM estado WHERE sigla = 'GNS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR')), 'Tongyeong');
 
-- Índia - Maharashtra (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Mumbai'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Pune'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Nagpur'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Nashik'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Aurangabad'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Solapur'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Thane'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Amravati'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kolhapur'),
((SELECT id_estado FROM estado WHERE sigla = 'MH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Navi Mumbai');
 
-- Índia - Delhi (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'New Delhi'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Old Delhi'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dwarka'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Rohini'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Noida'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gurgaon'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Faridabad'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Saket'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Janakpuri'),
((SELECT id_estado FROM estado WHERE sigla = 'DL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Vasant Kunj');
 
-- Índia - Karnataka (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bangalore'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Mysore'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Hubli'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Mangalore'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Belgaum'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gulbarga'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Davanagere'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bellary'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Shimoga'),
((SELECT id_estado FROM estado WHERE sigla = 'KA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Tumkur');
 
-- Índia - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'UP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Lucknow'),
((SELECT id_estado FROM estado WHERE sigla = 'UP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kanpur'),
((SELECT id_estado FROM estado WHERE sigla = 'UP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Agra'),
((SELECT id_estado FROM estado WHERE sigla = 'UP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Varanasi');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Chennai'),
((SELECT id_estado FROM estado WHERE sigla = 'TN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Coimbatore'),
((SELECT id_estado FROM estado WHERE sigla = 'TN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Madurai'),
((SELECT id_estado FROM estado WHERE sigla = 'TN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Tiruchirappalli');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Ahmedabad'),
((SELECT id_estado FROM estado WHERE sigla = 'GJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Surat'),
((SELECT id_estado FROM estado WHERE sigla = 'GJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Vadodara'),
((SELECT id_estado FROM estado WHERE sigla = 'GJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Rajkot');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jaipur'),
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jodhpur'),
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Udaipur'),
((SELECT id_estado FROM estado WHERE sigla = 'RJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kota');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'WB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kolkata'),
((SELECT id_estado FROM estado WHERE sigla = 'WB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Howrah'),
((SELECT id_estado FROM estado WHERE sigla = 'WB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Durgapur'),
((SELECT id_estado FROM estado WHERE sigla = 'WB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Asansol');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Hyderabad'),
((SELECT id_estado FROM estado WHERE sigla = 'TS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Warangal'),
((SELECT id_estado FROM estado WHERE sigla = 'TS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Nizamabad'),
((SELECT id_estado FROM estado WHERE sigla = 'TS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Karimnagar');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'KL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Thiruvananthapuram'),
((SELECT id_estado FROM estado WHERE sigla = 'KL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kochi'),
((SELECT id_estado FROM estado WHERE sigla = 'KL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kozhikode'),
((SELECT id_estado FROM estado WHERE sigla = 'KL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Thrissur');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Panaji'),
((SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Margao'),
((SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Vasco da Gama'),
((SELECT id_estado FROM estado WHERE sigla = 'GA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Mapusa');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Visakhapatnam'),
((SELECT id_estado FROM estado WHERE sigla = 'AP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Vijayawada'),
((SELECT id_estado FROM estado WHERE sigla = 'AP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Guntur'),
((SELECT id_estado FROM estado WHERE sigla = 'AP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Nellore');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'PB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Ludhiana'),
((SELECT id_estado FROM estado WHERE sigla = 'PB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Amritsar'),
((SELECT id_estado FROM estado WHERE sigla = 'PB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jalandhar'),
((SELECT id_estado FROM estado WHERE sigla = 'PB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Patiala');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Faridabad'),
((SELECT id_estado FROM estado WHERE sigla = 'HR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gurgaon'),
((SELECT id_estado FROM estado WHERE sigla = 'HR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Panipat'),
((SELECT id_estado FROM estado WHERE sigla = 'HR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Ambala');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bhopal'),
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Indore'),
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jabalpur'),
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gwalior');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Patna'),
((SELECT id_estado FROM estado WHERE sigla = 'BR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gaya'),
((SELECT id_estado FROM estado WHERE sigla = 'BR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bhagalpur'),
((SELECT id_estado FROM estado WHERE sigla = 'BR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Muzaffarpur');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bhubaneswar'),
((SELECT id_estado FROM estado WHERE sigla = 'OD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Cuttack'),
((SELECT id_estado FROM estado WHERE sigla = 'OD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Rourkela'),
((SELECT id_estado FROM estado WHERE sigla = 'OD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Puri');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Guwahati'),
((SELECT id_estado FROM estado WHERE sigla = 'AS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Silchar'),
((SELECT id_estado FROM estado WHERE sigla = 'AS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dibrugarh'),
((SELECT id_estado FROM estado WHERE sigla = 'AS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jorhat');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'JH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Ranchi'),
((SELECT id_estado FROM estado WHERE sigla = 'JH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jamshedpur'),
((SELECT id_estado FROM estado WHERE sigla = 'JH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dhanbad'),
((SELECT id_estado FROM estado WHERE sigla = 'JH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bokaro');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'CG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Raipur'),
((SELECT id_estado FROM estado WHERE sigla = 'CG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bhilai'),
((SELECT id_estado FROM estado WHERE sigla = 'CG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bilaspur'),
((SELECT id_estado FROM estado WHERE sigla = 'CG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Korba');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'UK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dehradun'),
((SELECT id_estado FROM estado WHERE sigla = 'UK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Haridwar'),
((SELECT id_estado FROM estado WHERE sigla = 'UK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Roorkee'),
((SELECT id_estado FROM estado WHERE sigla = 'UK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Haldwani');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'HP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Shimla'),
((SELECT id_estado FROM estado WHERE sigla = 'HP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dharamshala'),
((SELECT id_estado FROM estado WHERE sigla = 'HP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Manali'),
((SELECT id_estado FROM estado WHERE sigla = 'HP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kullu');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'JK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Srinagar'),
((SELECT id_estado FROM estado WHERE sigla = 'JK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jammu'),
((SELECT id_estado FROM estado WHERE sigla = 'JK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Anantnag'),
((SELECT id_estado FROM estado WHERE sigla = 'JK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Baramulla');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Imphal'),
((SELECT id_estado FROM estado WHERE sigla = 'MN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Thoubal'),
((SELECT id_estado FROM estado WHERE sigla = 'MN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Bishnupur'),
((SELECT id_estado FROM estado WHERE sigla = 'MN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Churachandpur');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ML' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Shillong'),
((SELECT id_estado FROM estado WHERE sigla = 'ML' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Tura'),
((SELECT id_estado FROM estado WHERE sigla = 'ML' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Jowai'),
((SELECT id_estado FROM estado WHERE sigla = 'ML' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Nongstoin');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kohima'),
((SELECT id_estado FROM estado WHERE sigla = 'NL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dimapur'),
((SELECT id_estado FROM estado WHERE sigla = 'NL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Mokokchung'),
((SELECT id_estado FROM estado WHERE sigla = 'NL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Wokha');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Agartala'),
((SELECT id_estado FROM estado WHERE sigla = 'TR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Udaipur'),
((SELECT id_estado FROM estado WHERE sigla = 'TR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Dharmanagar'),
((SELECT id_estado FROM estado WHERE sigla = 'TR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Kailashahar');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gangtok'),
((SELECT id_estado FROM estado WHERE sigla = 'SK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Namchi'),
((SELECT id_estado FROM estado WHERE sigla = 'SK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Mangan'),
((SELECT id_estado FROM estado WHERE sigla = 'SK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN')), 'Gyalshing');
 
-- África do Sul - Gauteng (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Johannesburg'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Pretoria'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Soweto'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Sandton'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Midrand'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Centurion'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Roodepoort'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Ekurhuleni'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Tshwane'),
((SELECT id_estado FROM estado WHERE sigla = 'GP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Benoni');
 
-- África do Sul - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'WC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Cape Town'),
((SELECT id_estado FROM estado WHERE sigla = 'WC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Stellenbosch'),
((SELECT id_estado FROM estado WHERE sigla = 'WC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'George'),
((SELECT id_estado FROM estado WHERE sigla = 'WC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Paarl');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'KZN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Durban'),
((SELECT id_estado FROM estado WHERE sigla = 'KZN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Pietermaritzburg'),
((SELECT id_estado FROM estado WHERE sigla = 'KZN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Richards Bay'),
((SELECT id_estado FROM estado WHERE sigla = 'KZN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Newcastle');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'EC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Port Elizabeth'),
((SELECT id_estado FROM estado WHERE sigla = 'EC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'East London'),
((SELECT id_estado FROM estado WHERE sigla = 'EC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Mthatha'),
((SELECT id_estado FROM estado WHERE sigla = 'EC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Queenstown');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Polokwane'),
((SELECT id_estado FROM estado WHERE sigla = 'LP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Tzaneen'),
((SELECT id_estado FROM estado WHERE sigla = 'LP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Thohoyandou'),
((SELECT id_estado FROM estado WHERE sigla = 'LP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Mokopane');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Nelspruit'),
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Witbank'),
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Secunda'),
((SELECT id_estado FROM estado WHERE sigla = 'MP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Middelburg');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Rustenburg'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Potchefstroom'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Klerksdorp'),
((SELECT id_estado FROM estado WHERE sigla = 'NW' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Mahikeng');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Bloemfontein'),
((SELECT id_estado FROM estado WHERE sigla = 'FS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Welkom'),
((SELECT id_estado FROM estado WHERE sigla = 'FS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Kroonstad'),
((SELECT id_estado FROM estado WHERE sigla = 'FS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Phuthaditjhaba');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Kimberley'),
((SELECT id_estado FROM estado WHERE sigla = 'NC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Upington'),
((SELECT id_estado FROM estado WHERE sigla = 'NC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'Springbok'),
((SELECT id_estado FROM estado WHERE sigla = 'NC' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA')), 'De Aar');
 
-- Emirados Árabes Unidos - Dubai (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Dubai'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Deira'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Bur Dubai'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Jumeirah'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Quoz'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Barsha'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Downtown Dubai'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Palm Jumeirah'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Dubai Marina'),
((SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Nahda');
 
-- Emirados - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AUH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Abu Dhabi'),
((SELECT id_estado FROM estado WHERE sigla = 'AUH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Ain'),
((SELECT id_estado FROM estado WHERE sigla = 'AUH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Khalifa City'),
((SELECT id_estado FROM estado WHERE sigla = 'AUH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Mussafah');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'SHJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Sharjah'),
((SELECT id_estado FROM estado WHERE sigla = 'SHJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Majaz'),
((SELECT id_estado FROM estado WHERE sigla = 'SHJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Qasimia'),
((SELECT id_estado FROM estado WHERE sigla = 'SHJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Nahda Sharjah');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AJM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Ajman'),
((SELECT id_estado FROM estado WHERE sigla = 'AJM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Jurf'),
((SELECT id_estado FROM estado WHERE sigla = 'AJM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Rashidiya'),
((SELECT id_estado FROM estado WHERE sigla = 'AJM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Nuaimia');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RAK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Ras Al Khaimah'),
((SELECT id_estado FROM estado WHERE sigla = 'RAK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Jazirah Al Hamra'),
((SELECT id_estado FROM estado WHERE sigla = 'RAK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Khuzam'),
((SELECT id_estado FROM estado WHERE sigla = 'RAK' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Dafan');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'FUJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Fujairah'),
((SELECT id_estado FROM estado WHERE sigla = 'FUJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Dibba Al Fujairah'),
((SELECT id_estado FROM estado WHERE sigla = 'FUJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Khor Fakkan'),
((SELECT id_estado FROM estado WHERE sigla = 'FUJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Kalba');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'UAQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Umm Al Quwain'),
((SELECT id_estado FROM estado WHERE sigla = 'UAQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Salamah'),
((SELECT id_estado FROM estado WHERE sigla = 'UAQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Raudah'),
((SELECT id_estado FROM estado WHERE sigla = 'UAQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE')), 'Al Shuhada');
 
-- Chile - Metropolitana (conhecido: 10 cidades)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Santiago'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Puente Alto'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Maipú'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'La Florida'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Las Condes'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Peñalolén'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'San Bernardo'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Quilicura'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Lo Prado'),
((SELECT id_estado FROM estado WHERE sigla = 'RM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Providencia');
 
-- Chile - estados menos conhecidos (4 cidades cada)
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Valparaíso'),
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Viña del Mar'),
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Quilpué'),
((SELECT id_estado FROM estado WHERE sigla = 'VAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'San Antonio');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'BIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Concepción'),
((SELECT id_estado FROM estado WHERE sigla = 'BIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Talcahuano'),
((SELECT id_estado FROM estado WHERE sigla = 'BIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Chillán'),
((SELECT id_estado FROM estado WHERE sigla = 'BIO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Los Ángeles');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Temuco'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Padre Las Casas'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Villarrica'),
((SELECT id_estado FROM estado WHERE sigla = 'ARA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Pucón');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Talca'),
((SELECT id_estado FROM estado WHERE sigla = 'MAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Curicó'),
((SELECT id_estado FROM estado WHERE sigla = 'MAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Linares'),
((SELECT id_estado FROM estado WHERE sigla = 'MAU' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Cauquenes');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LLA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Puerto Montt'),
((SELECT id_estado FROM estado WHERE sigla = 'LLA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Osorno'),
((SELECT id_estado FROM estado WHERE sigla = 'LLA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Puerto Varas'),
((SELECT id_estado FROM estado WHERE sigla = 'LLA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Castro');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'COQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'La Serena'),
((SELECT id_estado FROM estado WHERE sigla = 'COQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Coquimbo'),
((SELECT id_estado FROM estado WHERE sigla = 'COQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Ovalle'),
((SELECT id_estado FROM estado WHERE sigla = 'COQ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Illapel');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ANT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Antofagasta'),
((SELECT id_estado FROM estado WHERE sigla = 'ANT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Calama'),
((SELECT id_estado FROM estado WHERE sigla = 'ANT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Tocopilla'),
((SELECT id_estado FROM estado WHERE sigla = 'ANT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Mejillones');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'ATA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Copiapó'),
((SELECT id_estado FROM estado WHERE sigla = 'ATA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Vallenar'),
((SELECT id_estado FROM estado WHERE sigla = 'ATA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Chañaral'),
((SELECT id_estado FROM estado WHERE sigla = 'ATA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Diego de Almagro');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'TAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Iquique'),
((SELECT id_estado FROM estado WHERE sigla = 'TAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Alto Hospicio'),
((SELECT id_estado FROM estado WHERE sigla = 'TAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Pozo Almonte'),
((SELECT id_estado FROM estado WHERE sigla = 'TAR' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Pica');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'OHI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Rancagua'),
((SELECT id_estado FROM estado WHERE sigla = 'OHI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'San Fernando'),
((SELECT id_estado FROM estado WHERE sigla = 'OHI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Pichilemu'),
((SELECT id_estado FROM estado WHERE sigla = 'OHI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Rengo');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'LRI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Valdivia'),
((SELECT id_estado FROM estado WHERE sigla = 'LRI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'La Unión'),
((SELECT id_estado FROM estado WHERE sigla = 'LRI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Río Bueno'),
((SELECT id_estado FROM estado WHERE sigla = 'LRI' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Panguipulli');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AYS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Coyhaique'),
((SELECT id_estado FROM estado WHERE sigla = 'AYS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Puerto Aysén'),
((SELECT id_estado FROM estado WHERE sigla = 'AYS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Chile Chico'),
((SELECT id_estado FROM estado WHERE sigla = 'AYS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Cochrane');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'MAG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Punta Arenas'),
((SELECT id_estado FROM estado WHERE sigla = 'MAG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Puerto Natales'),
((SELECT id_estado FROM estado WHERE sigla = 'MAG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Porvenir'),
((SELECT id_estado FROM estado WHERE sigla = 'MAG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Puerto Williams');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'AYP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Arica'),
((SELECT id_estado FROM estado WHERE sigla = 'AYP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Putre'),
((SELECT id_estado FROM estado WHERE sigla = 'AYP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Camarones'),
((SELECT id_estado FROM estado WHERE sigla = 'AYP' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'General Lagos');
 
INSERT INTO cidade (id_estado, nome) VALUES
((SELECT id_estado FROM estado WHERE sigla = 'NUB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Chillán'),
((SELECT id_estado FROM estado WHERE sigla = 'NUB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'San Carlos'),
((SELECT id_estado FROM estado WHERE sigla = 'NUB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Bulnes'),
((SELECT id_estado FROM estado WHERE sigla = 'NUB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL')), 'Yungay');
 
-- ============================================================================
-- 4. AEROPORTOS DOS NOVOS PAÍSES
-- ============================================================================
 
INSERT INTO aeroporto (id_cidade, codigo_iata, nome) VALUES
-- Alemanha
((SELECT id_cidade FROM cidade WHERE nome = 'Munich'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BY'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE'))), 'MUC', 'Munich International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Berlin'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BLN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE'))), 'BER', 'Berlin Brandenburg Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Frankfurt'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'HE'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE'))), 'FRA', 'Frankfurt Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Hamburg'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'HH'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE'))), 'HAM', 'Hamburg Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Dusseldorf'   AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NW'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'DE'))), 'DUS', 'Düsseldorf Airport'),
-- Itália
((SELECT id_cidade FROM cidade WHERE nome = 'Milan'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'LOM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT'))), 'MXP', 'Milan Malpensa Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Rome'         AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'LAZ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT'))), 'FCO', 'Rome Fiumicino Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Venice'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'VEN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT'))), 'VCE', 'Venice Marco Polo Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Naples'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'CAM' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IT'))), 'NAP', 'Naples International Airport'),
-- Espanha
((SELECT id_cidade FROM cidade WHERE nome = 'Madrid'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'MAD' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES'))), 'MAD', 'Adolfo Suárez Madrid-Barajas Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Barcelona'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'CAT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES'))), 'BCN', 'Barcelona El Prat Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Malaga'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'AND' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES'))), 'AGP', 'Málaga-Costa del Sol Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Palma de Mallorca' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BAL' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ES'))), 'PMI', 'Palma de Mallorca Airport'),
-- Portugal
((SELECT id_cidade FROM cidade WHERE nome = 'Lisbon'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'LIS' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT'))), 'LIS', 'Lisbon Humberto Delgado Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Porto'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'PRT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT'))), 'OPO', 'Francisco Sá Carneiro Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Faro'         AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ALG' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'PT'))), 'FAO', 'Faro Airport'),
-- Países Baixos
((SELECT id_cidade FROM cidade WHERE nome = 'Amsterdam'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NH'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL'))), 'AMS', 'Amsterdam Airport Schiphol'),
((SELECT id_cidade FROM cidade WHERE nome = 'Rotterdam'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ZH'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL'))), 'RTM', 'Rotterdam The Hague Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Eindhoven'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'NB'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'NL'))), 'EIN', 'Eindhoven Airport'),
-- Coreia do Sul
((SELECT id_cidade FROM cidade WHERE nome = 'Seoul'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SEO' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR'))), 'ICN', 'Incheon International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Busan'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'BSN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR'))), 'PUS', 'Gimhae International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Jeju City'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'JEJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'KR'))), 'CJU', 'Jeju International Airport'),
-- Índia
((SELECT id_cidade FROM cidade WHERE nome = 'Mumbai'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'MH'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN'))), 'BOM', 'Chhatrapati Shivaji Maharaj International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'New Delhi'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'DL'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN'))), 'DEL', 'Indira Gandhi International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Bangalore'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'KA'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN'))), 'BLR', 'Kempegowda International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Chennai'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'TN'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'IN'))), 'MAA', 'Chennai International Airport'),
-- África do Sul
((SELECT id_cidade FROM cidade WHERE nome = 'Johannesburg' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'GP'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA'))), 'JNB', 'O.R. Tambo International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Cape Town'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'WC'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA'))), 'CPT', 'Cape Town International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Durban'       AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'KZN' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'ZA'))), 'DUR', 'King Shaka International Airport'),
-- Emirados Árabes Unidos
((SELECT id_cidade FROM cidade WHERE nome = 'Dubai'        AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'DXB' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE'))), 'DXB', 'Dubai International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Abu Dhabi'    AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'AUH' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE'))), 'AUH', 'Abu Dhabi International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Sharjah'      AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'SHJ' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'AE'))), 'SHJ', 'Sharjah International Airport'),
-- Chile
((SELECT id_cidade FROM cidade WHERE nome = 'Santiago'     AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'RM'  AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL'))), 'SCL', 'Arturo Merino Benítez International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Antofagasta'  AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'ANT' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL'))), 'ANF', 'Andrés Sabella Gálvez International Airport'),
((SELECT id_cidade FROM cidade WHERE nome = 'Puerto Montt' AND id_estado = (SELECT id_estado FROM estado WHERE sigla = 'LLA' AND id_pais = (SELECT id_pais FROM pais WHERE sigla = 'CL'))), 'PMC', 'El Tepual International Airport');
 