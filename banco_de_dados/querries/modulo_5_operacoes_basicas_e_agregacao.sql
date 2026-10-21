-- Verificar a distribuicao dos estados de saude:
SELECT
    estado_saude,
    COUNT(*) AS quantidade
FROM vistoria_arvore
GROUP BY estado_saude
ORDER BY quantidade DESC
;