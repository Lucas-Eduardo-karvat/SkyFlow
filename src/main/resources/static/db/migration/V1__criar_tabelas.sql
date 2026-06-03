
CREATE TABLE IF NOT EXISTS status_voo (
    id_status_voo SERIAL PRIMARY KEY,
    descricao VARCHAR(20) NOT NULL UNIQUE
    -- Valores esperados: AGENDADO, ATRASADO, CANCELADO, FINALIZADO
);

CREATE TABLE IF NOT EXISTS status_reserva (
    id_status_reserva SERIAL PRIMARY KEY,
    descricao VARCHAR(20) NOT NULL UNIQUE
    -- Valores esperados: PENDENTE, CONFIRMADA, CANCELADA
);

CREATE TABLE IF NOT EXISTS metodo_pagamento (
    id_metodo SERIAL PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL UNIQUE
    -- Valores esperados: PIX, CARTAO_CREDITO, BOLETO
);

CREATE TABLE IF NOT EXISTS status_pagamento (
    id_status_pagamento SERIAL PRIMARY KEY,
    descricao VARCHAR(20) NOT NULL UNIQUE
    -- Valores esperados: PENDENTE, APROVADO, RECUSADO
);

CREATE TABLE IF NOT EXISTS moeda (
    id_moeda   SERIAL PRIMARY KEY,
    codigo_iso CHAR(3)     NOT NULL UNIQUE,
    nome       VARCHAR(50) NOT NULL,
    simbolo    VARCHAR(5)  NOT NULL
);

CREATE TABLE IF NOT EXISTS pais (
    id_pais SERIAL PRIMARY KEY,
    nome    VARCHAR(100) NOT NULL UNIQUE,
    sigla   CHAR(2)      NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS estado (
    id_estado SERIAL PRIMARY KEY,
    id_pais   INT          NOT NULL,
    nome      VARCHAR(100) NOT NULL,
    sigla     CHAR(2)      NOT NULL,
    CONSTRAINT fk_estado_pais       FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE RESTRICT,
    CONSTRAINT uq_estado_sigla_pais UNIQUE (sigla, id_pais)
);

CREATE TABLE IF NOT EXISTS cidade (
    id_cidade SERIAL PRIMARY KEY,
    id_estado INT          NOT NULL,
    nome      VARCHAR(100) NOT NULL,
    CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS aeroporto (
    id_aeroporto SERIAL PRIMARY KEY,
    id_cidade    INT          NOT NULL,
    codigo_iata  CHAR(3)      NOT NULL UNIQUE,
    nome         VARCHAR(150) NOT NULL,
    CONSTRAINT fk_aeroporto_cidade FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS companhia (
    id_companhia SERIAL PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    codigo_icao  CHAR(3)      NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS modelo_aeronave (
    id_modelo           SERIAL PRIMARY KEY,
    fabricante          VARCHAR(50) NOT NULL,
    nome_modelo         VARCHAR(50) NOT NULL UNIQUE,
    capacidade_assentos INT         NOT NULL,
    CONSTRAINT chk_capacidade CHECK (capacidade_assentos > 0)
);

CREATE TABLE IF NOT EXISTS aeronave (
    id_aeronave     SERIAL PRIMARY KEY,
    id_companhia    INT         NOT NULL,
    id_modelo       INT         NOT NULL,
    codigo_registro VARCHAR(20) NOT NULL UNIQUE,
    ativo           BOOLEAN     NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_aeronave_companhia FOREIGN KEY (id_companhia) REFERENCES companhia(id_companhia)   ON DELETE RESTRICT,
    CONSTRAINT fk_aeronave_modelo    FOREIGN KEY (id_modelo)    REFERENCES modelo_aeronave(id_modelo) ON DELETE RESTRICT
);


CREATE TABLE IF NOT EXISTS tipo_classe (
    id_classe           SERIAL PRIMARY KEY,
    nome_classe         VARCHAR(50)   NOT NULL UNIQUE,
    multiplicador_valor NUMERIC(5, 2) NOT NULL DEFAULT 1.00
);

CREATE TABLE IF NOT EXISTS assento (
    id_assento     SERIAL PRIMARY KEY,
    id_aeronave    INT         NOT NULL,
    id_classe      INT         NOT NULL,
    numero_assento VARCHAR(10) NOT NULL,
    CONSTRAINT fk_assento_aeronave FOREIGN KEY (id_aeronave) REFERENCES aeronave(id_aeronave)  ON DELETE CASCADE,
    CONSTRAINT fk_assento_classe   FOREIGN KEY (id_classe)   REFERENCES tipo_classe(id_classe) ON DELETE RESTRICT,
    CONSTRAINT uq_assento_aeronave UNIQUE (id_aeronave, numero_assento)
);

CREATE TABLE IF NOT EXISTS voo (
    id_voo        SERIAL PRIMARY KEY,
    id_companhia  INT         NOT NULL,
    id_status_voo INT         NOT NULL,
    codigo_voo    VARCHAR(10) NOT NULL UNIQUE,
    CONSTRAINT fk_voo_companhia FOREIGN KEY (id_companhia)  REFERENCES companhia(id_companhia)   ON DELETE RESTRICT,
    CONSTRAINT fk_voo_status    FOREIGN KEY (id_status_voo) REFERENCES status_voo(id_status_voo) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS trecho_voo (
    id_trecho            SERIAL PRIMARY KEY,
    id_voo               INT           NOT NULL,
    id_aeronave          INT           NOT NULL,
    id_aeroporto_origem  INT           NOT NULL,
    id_aeroporto_destino INT           NOT NULL,
    ordem_trecho         INT           NOT NULL,
    distancia_km         NUMERIC(7, 2) NOT NULL,
    data_partida         TIMESTAMPTZ   NOT NULL,
    data_chegada         TIMESTAMPTZ   NOT NULL,
    CONSTRAINT fk_trecho_voo      FOREIGN KEY (id_voo)               REFERENCES voo(id_voo)             ON DELETE CASCADE,
    CONSTRAINT fk_trecho_aeronave FOREIGN KEY (id_aeronave)          REFERENCES aeronave(id_aeronave)   ON DELETE RESTRICT,
    CONSTRAINT fk_trecho_origem   FOREIGN KEY (id_aeroporto_origem)  REFERENCES aeroporto(id_aeroporto) ON DELETE RESTRICT,
    CONSTRAINT fk_trecho_destino  FOREIGN KEY (id_aeroporto_destino) REFERENCES aeroporto(id_aeroporto) ON DELETE RESTRICT,
    CONSTRAINT uq_voo_ordem          UNIQUE (id_voo, ordem_trecho),
    CONSTRAINT chk_aeroportos_trecho CHECK (id_aeroporto_origem <> id_aeroporto_destino),
    CONSTRAINT chk_datas_trecho      CHECK (data_chegada > data_partida),
    CONSTRAINT chk_distancia         CHECK (distancia_km > 0)
);

CREATE TABLE IF NOT EXISTS tarifa (
    id_tarifa             SERIAL PRIMARY KEY,
    id_voo                INT            NOT NULL,
    id_classe             INT            NOT NULL,
    id_moeda              INT            NOT NULL,
    preco_por_km          NUMERIC(10, 4) NOT NULL,
    quantidade_disponivel INT            NOT NULL,
    CONSTRAINT fk_tarifa_voo    FOREIGN KEY (id_voo)    REFERENCES voo(id_voo)             ON DELETE CASCADE,
    CONSTRAINT fk_tarifa_classe FOREIGN KEY (id_classe) REFERENCES tipo_classe(id_classe)  ON DELETE RESTRICT,
    CONSTRAINT fk_tarifa_moeda  FOREIGN KEY (id_moeda)  REFERENCES moeda(id_moeda)         ON DELETE RESTRICT,
    CONSTRAINT uq_voo_classe  UNIQUE (id_voo, id_classe),
    CONSTRAINT chk_qtd_tarifa CHECK (quantidade_disponivel >= 0),
    CONSTRAINT chk_preco_km   CHECK (preco_por_km > 0.0000)
);



CREATE TABLE IF NOT EXISTS passageiro (
    id_passageiro      SERIAL PRIMARY KEY,
    id_cidade_endereco INT          NOT NULL,
    nome               VARCHAR(150) NOT NULL,
    documento          VARCHAR(20)  NOT NULL UNIQUE,
    email              VARCHAR(100) NOT NULL UNIQUE,
    telefone           VARCHAR(20),
    logradouro         VARCHAR(150) NOT NULL,
    numero             VARCHAR(20)  NOT NULL,
    complemento        VARCHAR(50),
    cep                CHAR(8)      NOT NULL,
    CONSTRAINT fk_passageiro_cidade FOREIGN KEY (id_cidade_endereco) REFERENCES cidade(id_cidade) ON DELETE RESTRICT
);


CREATE TABLE IF NOT EXISTS reserva (
    id_reserva        SERIAL PRIMARY KEY,
    id_passageiro     INT            NOT NULL,
    id_tarifa         INT            NOT NULL,
    id_status_reserva INT            NOT NULL,
    codigo_reserva    CHAR(6)        NOT NULL UNIQUE,
    data_reserva      TIMESTAMPTZ    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_final       NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_reserva_passageiro FOREIGN KEY (id_passageiro)     REFERENCES passageiro(id_passageiro)         ON DELETE RESTRICT,
    CONSTRAINT fk_reserva_tarifa     FOREIGN KEY (id_tarifa)         REFERENCES tarifa(id_tarifa)                 ON DELETE RESTRICT,
    CONSTRAINT fk_reserva_status     FOREIGN KEY (id_status_reserva) REFERENCES status_reserva(id_status_reserva) ON DELETE RESTRICT,
    CONSTRAINT chk_valor_final       CHECK (valor_final > 0)
);

CREATE TABLE IF NOT EXISTS reserva_assento (
    id_reserva_assento SERIAL PRIMARY KEY,
    id_reserva         INT NOT NULL,
    id_trecho          INT NOT NULL,
    id_assento         INT NOT NULL,
    CONSTRAINT fk_ra_reserva     FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)      ON DELETE CASCADE,
    CONSTRAINT fk_ra_trecho      FOREIGN KEY (id_trecho)  REFERENCES trecho_voo(id_trecho)     ON DELETE RESTRICT,
    CONSTRAINT fk_ra_assento     FOREIGN KEY (id_assento) REFERENCES assento(id_assento)       ON DELETE RESTRICT,
    CONSTRAINT uq_trecho_assento UNIQUE (id_trecho, id_assento),
    CONSTRAINT uq_reserva_trecho UNIQUE (id_reserva, id_trecho)
);

CREATE TABLE IF NOT EXISTS historico_reserva (
    id_historico       SERIAL PRIMARY KEY,
    id_reserva         INT         NOT NULL,
    id_status_anterior INT,
    id_status_novo     INT         NOT NULL,
    data_alteracao     TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_alteracao  VARCHAR(50)          DEFAULT CURRENT_USER,
    detalhes           TEXT
    -- Sem FK intencionalmente: preserva histórico mesmo se status for excluído
);

CREATE TABLE IF NOT EXISTS pagamento (
    id_pagamento        SERIAL PRIMARY KEY,
    id_reserva          INT            NOT NULL,
    id_metodo           INT            NOT NULL,
    id_status_pagamento INT            NOT NULL,
    valor_pago          NUMERIC(10, 2) NOT NULL,
    data_pagamento      TIMESTAMPTZ    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pagamento_reserva FOREIGN KEY (id_reserva)          REFERENCES reserva(id_reserva)                   ON DELETE CASCADE,
    CONSTRAINT fk_pagamento_metodo  FOREIGN KEY (id_metodo)           REFERENCES metodo_pagamento(id_metodo)           ON DELETE RESTRICT,
    CONSTRAINT fk_pagamento_status  FOREIGN KEY (id_status_pagamento) REFERENCES status_pagamento(id_status_pagamento) ON DELETE RESTRICT,
    CONSTRAINT chk_valor_pago       CHECK (valor_pago > 0)
);