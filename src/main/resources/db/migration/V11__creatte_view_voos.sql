CREATE VIEW vw_voos AS

SELECT

v.id,

v.numero_voo,

o.cidade AS origem,

d.cidade AS destino,

v.data_partida,

v.data_chegada,

v.preco,

v.status

FROM voos v

JOIN aeroportos o
ON o.id = v.origem_id

JOIN aeroportos d
ON d.id = v.destino_id;