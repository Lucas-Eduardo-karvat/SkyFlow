-- Companhias aéreas

CREATE TABLE companhias_aereas (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    codigo_iata CHAR(2) NOT NULL UNIQUE,
    pais VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Aeroportos

CREATE TABLE aeroportos (
    id BIGSERIAL PRIMARY KEY,
    codigo_iata CHAR(3) NOT NULL UNIQUE,
    nome VARCHAR(150) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100),
    pais VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Aeronaves

CREATE TABLE aeronaves (
    id BIGSERIAL PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    capacidade INTEGER NOT NULL CHECK(capacidade > 0),
    companhia_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_aeronave_companhia
        FOREIGN KEY(companhia_id)
        REFERENCES companhias_aereas(id)
);

-- Voos

CREATE TABLE voos (

    id BIGSERIAL PRIMARY KEY,

    numero_voo VARCHAR(20) NOT NULL UNIQUE,

    origem_id BIGINT NOT NULL,

    destino_id BIGINT NOT NULL,

    aeronave_id BIGINT NOT NULL,

    data_partida TIMESTAMP NOT NULL,

    data_chegada TIMESTAMP NOT NULL,

    preco NUMERIC(10,2) NOT NULL,

    status VARCHAR(20) NOT NULL
        CHECK(status IN ('AGENDADO','CANCELADO','FINALIZADO')),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_voo_origem
        FOREIGN KEY(origem_id)
        REFERENCES aeroportos(id),

    CONSTRAINT fk_voo_destino
        FOREIGN KEY(destino_id)
        REFERENCES aeroportos(id),

    CONSTRAINT fk_voo_aeronave
        FOREIGN KEY(aeronave_id)
        REFERENCES aeronaves(id)
);

-- Escalas

CREATE TABLE escalas (

    id BIGSERIAL PRIMARY KEY,

    voo_id BIGINT NOT NULL,

    aeroporto_id BIGINT NOT NULL,

    ordem INTEGER NOT NULL,

    horario_chegada TIMESTAMP,

    horario_saida TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_escala_voo
        FOREIGN KEY(voo_id)
        REFERENCES voos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_escala_aeroporto
        FOREIGN KEY(aeroporto_id)
        REFERENCES aeroportos(id),

    CONSTRAINT uk_ordem_escala
        UNIQUE(voo_id,ordem)
);

-- Classes

CREATE TABLE classes (

    id BIGSERIAL PRIMARY KEY,

    nome VARCHAR(50) NOT NULL UNIQUE,

    descricao TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Assentos

CREATE TABLE assentos (

    id BIGSERIAL PRIMARY KEY,

    voo_id BIGINT NOT NULL,

    numero VARCHAR(5) NOT NULL,

    classe_id BIGINT NOT NULL,

    disponivel BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_assento_voo
        FOREIGN KEY(voo_id)
        REFERENCES voos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_assento_classe
        FOREIGN KEY(classe_id)
        REFERENCES classes(id),

    CONSTRAINT uk_numero_assento
        UNIQUE(voo_id,numero),

    CONSTRAINT uk_assento_voo
        UNIQUE(id,voo_id)
);

-- Passageiros

CREATE TABLE passageiros (

    id BIGSERIAL PRIMARY KEY,

    nome VARCHAR(150) NOT NULL,

    cpf VARCHAR(14) NOT NULL UNIQUE,

    email VARCHAR(150) NOT NULL UNIQUE,

    telefone VARCHAR(20),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Reservas

CREATE TABLE reservas (

    id BIGSERIAL PRIMARY KEY,

    localizador VARCHAR(20) NOT NULL UNIQUE,

    passageiro_id BIGINT NOT NULL,

    voo_id BIGINT NOT NULL,

    assento_id BIGINT NOT NULL,

    data_reserva TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    valor_pago NUMERIC(10,2),

    status VARCHAR(20) NOT NULL
        CHECK(status IN ('CONFIRMADA','CANCELADA','CHECKIN')),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_reserva_passageiro
        FOREIGN KEY(passageiro_id)
        REFERENCES passageiros(id),

    CONSTRAINT fk_reserva_voo
        FOREIGN KEY(voo_id)
        REFERENCES voos(id),

    CONSTRAINT fk_reserva_assento
        FOREIGN KEY(assento_id)
        REFERENCES assentos(id),

    CONSTRAINT fk_reserva_assento_voo
        FOREIGN KEY(assento_id,voo_id)
        REFERENCES assentos(id,voo_id),

    CONSTRAINT uk_reserva_assento
        UNIQUE(assento_id)
);

-- Histórico de reservas

CREATE TABLE historico_reservas (

    id BIGSERIAL PRIMARY KEY,

    reserva_id BIGINT NOT NULL,

    operacao VARCHAR(30) NOT NULL,

    status_antigo VARCHAR(20),

    status_novo VARCHAR(20),

    usuario_alteracao VARCHAR(100),

    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historico_reserva
        FOREIGN KEY(reserva_id)
        REFERENCES reservas(id)
        ON DELETE CASCADE
);
