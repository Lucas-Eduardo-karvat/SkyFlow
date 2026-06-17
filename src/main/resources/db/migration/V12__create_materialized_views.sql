CREATE MATERIALIZED VIEW mv_voos_agendados AS

SELECT *

FROM vw_voos

WHERE status='AGENDADO';


-- REFRESH MATERIALIZED VIEW mv_voos_agendados; pra atualiza mano veio