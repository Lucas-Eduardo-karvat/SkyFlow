-- ==========================================
-- CRIAÇÃO DAS ROLES
-- ==========================================

CREATE ROLE atendente LOGIN PASSWORD '123456';

CREATE ROLE supervisor LOGIN PASSWORD '123456';

-- ==========================================
-- PERMISSÕES DO ATENDENTE
-- ==========================================

GRANT CONNECT ON DATABASE skyflow_db TO atendente;

GRANT USAGE ON SCHEMA public TO atendente;

GRANT SELECT ON companhias_aereas TO atendente;
GRANT SELECT ON aeroportos TO atendente;
GRANT SELECT ON aeronaves TO atendente;
GRANT SELECT ON voos TO atendente;
GRANT SELECT ON escalas TO atendente;
GRANT SELECT ON classes TO atendente;
GRANT SELECT ON assentos TO atendente;

GRANT SELECT, INSERT, UPDATE ON passageiros TO atendente;

GRANT SELECT, INSERT, UPDATE ON reservas TO atendente;

GRANT SELECT ON historico_reservas TO atendente;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO atendente;

-- ==========================================
-- PERMISSÕES DO SUPERVISOR
-- ==========================================

GRANT CONNECT ON DATABASE skyflow_db TO supervisor;

GRANT USAGE ON SCHEMA public TO supervisor;

GRANT ALL PRIVILEGES
ON ALL TABLES IN SCHEMA public
TO supervisor;

GRANT ALL PRIVILEGES
ON ALL SEQUENCES IN SCHEMA public
TO supervisor;