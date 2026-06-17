-- Índice para busca por origem

CREATE INDEX idx_voos_origem
ON voos(origem_id);

-- Índice para busca por destino

CREATE INDEX idx_voos_destino
ON voos(destino_id);

-- Índice para busca por data

CREATE INDEX idx_voos_data_partida
ON voos(data_partida);

-- Índice para reservas por passageiro

CREATE INDEX idx_reservas_passageiro
ON reservas(passageiro_id);

-- Índice para reservas por voo

CREATE INDEX idx_reservas_voo
ON reservas(voo_id);

-- Índice para assentos disponíveis

CREATE INDEX idx_assentos_disponivel
ON assentos(disponivel);