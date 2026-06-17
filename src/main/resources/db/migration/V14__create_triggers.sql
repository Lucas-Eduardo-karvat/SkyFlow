-- ==========================================
-- FUNÇÃO PARA REGISTRAR HISTÓRICO
-- ==========================================

CREATE OR REPLACE FUNCTION registrar_historico()
RETURNS TRIGGER
AS
$$
BEGIN

    INSERT INTO historico_reservas (
        reserva_id,
        operacao,
        status_antigo,
        status_novo,
        data_alteracao
    )
    VALUES (
        OLD.id,
        'UPDATE',
        OLD.status,
        NEW.status,
        CURRENT_TIMESTAMP
    );

    RETURN NEW;

END;
$$
LANGUAGE plpgsql;

-- ==========================================
-- TRIGGER DE HISTÓRICO
-- ==========================================

CREATE TRIGGER trg_historico_reserva

AFTER UPDATE OF status
ON reservas

FOR EACH ROW

EXECUTE FUNCTION registrar_historico();

-- ==========================================
-- FUNÇÃO PARA IMPEDIR RESERVA EM VOO CANCELADO
-- ==========================================

CREATE OR REPLACE FUNCTION validar_voo_cancelado()
RETURNS TRIGGER
AS
$$
DECLARE
    status_voo VARCHAR(20);
BEGIN

    SELECT status
    INTO status_voo
    FROM voos
    WHERE id = NEW.voo_id;

    IF status_voo = 'CANCELADO' THEN
        RAISE EXCEPTION 'Não é permitido reservar um voo cancelado.';
    END IF;

    RETURN NEW;

END;
$$
LANGUAGE plpgsql;

-- ==========================================
-- TRIGGER DE VALIDAÇÃO
-- ==========================================

CREATE TRIGGER trg_validar_voo_cancelado

BEFORE INSERT
ON reservas

FOR EACH ROW

EXECUTE FUNCTION validar_voo_cancelado();