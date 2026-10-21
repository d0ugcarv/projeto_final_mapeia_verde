-- Quantidade de arvores associadas a cada levantamento
SELECT
    l.id AS levantamento_id,
    l.projeto_id,
    COUNT(ra.arvore_id) AS total_arvores
FROM levantamento AS l
LEFT JOIN registro_arvore AS ra
    ON ra.levantamento_id = l.id
GROUP BY l.id, l.projeto_id
ORDER BY l.id
LIMIT 10
;
