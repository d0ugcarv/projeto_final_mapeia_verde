DELIMITER $$

CREATE PROCEDURE sp_projetos_cliente(
    IN p_cnpj CHAR(14)
)
BEGIN
    SELECT
        cl.nome AS cliente,
        c.id AS contrato_id,
        p.id AS projeto_id,
        p.nome AS projeto,
        p.data_inicio,
        p.data_fim
    FROM cliente AS cl
    INNER JOIN contrato AS c
        ON c.cliente_cnpj = cl.cnpj
    INNER JOIN projeto AS p
        ON p.contrato_id = c.id
    WHERE cl.cnpj = p_cnpj
    ORDER BY p.id;
END $$

DELIMITER 


CALL sp_projetos_cliente('12345678000195');