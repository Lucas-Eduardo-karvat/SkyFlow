CREATE VIEW vw_assentos_disponiveis AS

SELECT

a.id,

a.numero,

c.nome AS classe,

v.numero_voo

FROM assentos a

JOIN classes c
ON c.id = a.classe_id

JOIN voos v
ON v.id = a.voo_id

WHERE a.disponivel = true;