CREATE OR REPLACE PROCEDURE reservar_assento(

    p_localizador VARCHAR,

    p_passageiro BIGINT,

    p_voo BIGINT,

    p_assento BIGINT,

    p_valor NUMERIC

)

LANGUAGE plpgsql

AS $$

BEGIN

    IF EXISTS (

        SELECT 1

        FROM assentos

        WHERE id=p_assento

        AND disponivel=false

    )

    THEN

        RAISE EXCEPTION 'Assento indisponível';

    END IF;

    INSERT INTO reservas(

        localizador,

        passageiro_id,

        voo_id,

        assento_id,

        valor_pago,

        status

    )

    VALUES(

        p_localizador,

        p_passageiro,

        p_voo,

        p_assento,

        p_valor,

        'CONFIRMADA'

    );

    UPDATE assentos

    SET disponivel=false

    WHERE id=p_assento;

END;

$$;
/*se precisar usar é algo tipo isso CALL reservar_assento(
'XYZ123',
1,
2,
35,
650.00
); */