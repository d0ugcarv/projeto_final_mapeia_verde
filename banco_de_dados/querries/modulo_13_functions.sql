-- Calcular a duracao de um contrato
USE mapeia_verde;

DELIMITER $$

CREATE FUNCTION fn_duracao_contrato(
    p_data_inicio DATE,
    p_data_fim DATE
)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN DATEDIFF(
        COALESCE(p_data_fim, CURDATE()),
        p_data_inicio
    );
END $$

DELIMITER 

SELECT
    id AS contrato_id,
    data_inicio,
    data_fim,
    fn_duracao_contrato(
        data_inicio,
        data_fim
    ) AS duracao_dias
FROM contrato;
;
