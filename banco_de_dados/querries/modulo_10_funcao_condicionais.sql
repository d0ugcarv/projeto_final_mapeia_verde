-- classificar a saude das arvores
SELECT
    m.arvore_id,
    m.data,
    m.estado_saude,
    m.cobertura_sombra,

    CASE
        WHEN m.estado_saude = 'Critico' THEN 'Acao urgente'
        WHEN m.estado_saude = 'Ruim' THEN 'Necessita intervencao'
        WHEN m.estado_saude = 'Regular' THEN 'Acompanhar'
        WHEN m.estado_saude = 'Saudavel' THEN 'Condicao adequada'
        ELSE 'Estado desconhecido'
    END AS recomendacao,

    IF(
        m.cobertura_sombra >= 50,
        'Sombra elevada',
        'Sombra reduzida'
    ) AS classificacao_sombra,

    IFNULL(
        m.observacoes,
        'Sem observacoes registradas'
    ) AS observacoes

FROM monitoramento AS m
ORDER BY m.arvore_id, m.data
LIMIT 10;
