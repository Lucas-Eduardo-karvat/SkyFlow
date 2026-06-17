CREATE VIEW vw_reservas AS

SELECT

r.id,

r.localizador,

p.nome AS passageiro,

v.numero_voo,

a.numero AS assento,

r.status,

r.valor_pago,

r.data_reserva

FROM reservas r

JOIN passageiros p
ON p.id = r.passageiro_id

JOIN voos v
ON v.id = r.voo_id

JOIN assentos a
ON a.id = r.assento_id;