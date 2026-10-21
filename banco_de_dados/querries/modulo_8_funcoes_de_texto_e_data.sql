-- Analise de contratos e projetos
USE mapeia_verde;

SELECT
    c.id AS contrato_id,

    -- CONCAT(): concatenar o nome do cliente e o tipo de contrato
    CONCAT(
        cl.nome,
        ' - ',
        c.tipo
    ) AS identificacao_contrato,

    -- MID(): extrair parte do nome do cliente
    MID(cl.nome, 1, 10) AS inicio_nome_cliente,

    -- INSTR(): localizar a posicao de uma palavra no nome
    INSTR(cl.nome, 'Verde') AS posicao_palavra_verde,

    -- REPLACE(): substituir parte do texto
    REPLACE(
        cl.nome,
        'Prefeitura',
        'Municipio'
    ) AS nome_modificado,

    c.data_inicio,
    c.data_fim,

    -- DATEDIFF(): calcular a duracao do contrato em dias
    DATEDIFF(
        COALESCE(c.data_fim, CURDATE()),
        c.data_inicio
    ) AS duracao_dias,

    -- DATE_ADD(): calcular uma data 30 dias apos o inicio
    DATE_ADD(
        c.data_inicio,
        INTERVAL 30 DAY
    ) AS data_revisao,

    -- Calcular a data prevista para revisao anual
    DATE_ADD(
        c.data_inicio,
        INTERVAL 1 YEAR
    ) AS revisao_anual

FROM contrato AS c
INNER JOIN cliente AS cl
    ON cl.cnpj = c.cliente_cnpj
ORDER BY c.data_inicio;
