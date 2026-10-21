USE mapeia_verde;

CREATE VIEW vw_resumo_projetos AS
SELECT
    p.id AS projeto_id,
    p.nome AS projeto,
    cl.nome AS cliente,
    c.tipo AS tipo_contrato,
    c.valor AS valor_contrato,
    p.data_inicio,
    p.data_fim,
    COUNT(DISTINCT r.id) AS total_relatorios
FROM projeto AS p
INNER JOIN contrato AS c
    ON p.contrato_id = c.id
INNER JOIN cliente AS cl
    ON c.cliente_cnpj = cl.cnpj
LEFT JOIN relatorio AS r
    ON r.projeto_id = p.id
GROUP BY
    p.id,
    p.nome,
    cl.nome,
    c.tipo,
    c.valor,
    p.data_inicio,
    p.data_fim;
