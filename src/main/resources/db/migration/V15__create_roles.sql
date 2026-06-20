
-- CRIAÇÃO DAS ROLES


DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'atendente'
    ) THEN
        CREATE ROLE atendente LOGIN PASSWORD '123456';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'supervisor'
    ) THEN
        CREATE ROLE supervisor LOGIN PASSWORD '123456';
    END IF;
END
$$;

-- PERMISSÕES DO ATENDENTE


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


-- PERMISSÕES DO SUPERVISOR


GRANT CONNECT ON DATABASE skyflow_db TO supervisor;

GRANT USAGE ON SCHEMA public TO supervisor;

GRANT ALL PRIVILEGES
ON ALL TABLES IN SCHEMA public
TO supervisor;

GRANT ALL PRIVILEGES
ON ALL SEQUENCES IN SCHEMA public
TO supervisor;
-- Cria a role apenas se ela não existir
DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'cliente'
    ) THEN
        CREATE ROLE cliente LOGIN PASSWORD '123456';
    END IF;
END
$$;

-- Permissões básicas
GRANT CONNECT ON DATABASE skyflow_db TO cliente;

GRANT USAGE ON SCHEMA public TO cliente;

-- Consulta de informações
GRANT SELECT ON companhias_aereas TO cliente;
GRANT SELECT ON aeroportos TO cliente;
GRANT SELECT ON aeronaves TO cliente;
GRANT SELECT ON voos TO cliente;
GRANT SELECT ON escalas TO cliente;
GRANT SELECT ON classes TO cliente;
GRANT SELECT ON assentos TO cliente;

-- Cadastro e consulta de passageiros
GRANT SELECT, INSERT, UPDATE ON passageiros TO cliente;

-- Reservas
GRANT SELECT, INSERT ON reservas TO cliente;

-- Histórico apenas para consulta
GRANT SELECT ON historico_reservas TO cliente;

-- Uso das sequências
GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO cliente;
