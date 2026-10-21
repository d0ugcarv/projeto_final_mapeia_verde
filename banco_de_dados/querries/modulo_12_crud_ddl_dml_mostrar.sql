SELECT
    c.id AS contrato_id,
    cl.nome AS cliente,
    c.valor,
    c.tipo,
    c.status
FROM cliente AS cl
LEFT JOIN contrato AS c
    ON cl.cnpj = c.cliente_cnpj;