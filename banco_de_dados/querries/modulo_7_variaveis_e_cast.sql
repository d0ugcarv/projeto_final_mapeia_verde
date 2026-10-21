-- Analise de contratos e arborizacao
USE mapeia_verde;


SET @valor_minimo = 50000.00;
SET @ano_referencia = 2025;
SET @percentual_sombra = 50;


SELECT
    c.id AS contrato_id,
    cl.nome AS cliente,
    c.tipo AS tipo_contrato,

    -- CAST: converter o valor para texto
    CAST(c.valor AS CHAR) AS valor_contrato,

    -- CAST: converter uma data para texto
    CAST(c.data_inicio AS CHAR) AS inicio_contrato,

    -- Usar variavel para classificar o contrato
    CASE
        WHEN c.valor >= @valor_minimo
            THEN 'Contrato de alto valor'
        ELSE 'Contrato de valor padrao'
    END AS classificacao,

    -- Comparar o ano com a variavel definida
    IF(
        YEAR(c.data_inicio) = @ano_referencia,
        'Iniciado em 2025',
        'Iniciado em outro ano'
    ) AS periodo

FROM contrato AS c
INNER JOIN cliente AS cl
    ON cl.cnpj = c.cliente_cnpj
ORDER BY c.valor DESC;
