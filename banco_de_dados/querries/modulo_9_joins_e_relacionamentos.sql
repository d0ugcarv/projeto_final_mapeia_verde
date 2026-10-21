-- Listar projetos e seus respectivos clientes
SELECT
    p.id AS projeto_id,
    p.nome AS projeto,
    c.id AS contrato_id,
    cl.nome AS cliente,
    p.data_inicio,
    p.data_fim,
    p.area
FROM projeto AS p
INNER JOIN contrato AS c
    ON p.contrato_id = c.id
INNER JOIN cliente AS cl
    ON c.cliente_cnpj = cl.cnpj
ORDER BY p.id
LIMIT 10;