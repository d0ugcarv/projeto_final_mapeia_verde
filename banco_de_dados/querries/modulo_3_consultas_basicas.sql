-- Quantidade de relatorios por projeto
SELECT
    p.id AS projeto_id,
    p.nome AS projeto,
    COUNT(r.id) AS total_relatorios
FROM projeto AS p
LEFT JOIN relatorio AS r
    ON r.projeto_id = p.id
GROUP BY p.id, p.nome
ORDER BY p.iD
LIMIT 10
;