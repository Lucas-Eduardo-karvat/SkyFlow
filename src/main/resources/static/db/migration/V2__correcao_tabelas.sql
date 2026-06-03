ALTER TABLE estado
    ALTER COLUMN sigla TYPE CHAR(3);

ALTER TABLE estado
    DROP CONSTRAINT IF EXISTS uq_estado_sigla_pais,
    ADD CONSTRAINT uq_estado_sigla_pais UNIQUE (sigla, id_pais);

ALTER TABLE passageiro
    ALTER COLUMN cep TYPE VARCHAR(20);

ALTER TABLE status_reserva
    ALTER COLUMN descricao TYPE VARCHAR(30);

ALTER TABLE modelo_aeronave
    DROP CONSTRAINT IF EXISTS modelo_aeronave_nome_modelo_key,
    DROP CONSTRAINT IF EXISTS uq_fabricante_modelo,
    ADD CONSTRAINT uq_fabricante_modelo UNIQUE (fabricante, nome_modelo);