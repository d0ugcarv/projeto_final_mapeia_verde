-- Historico de uma arvore especifica
SELECT
    arvore_id,
    `data`,
    estado_saude,
    altura,
    diametro,
    cobertura_sombra,
    observacoes
FROM monitoramento
WHERE arvore_id = 2
ORDER BY `data`;