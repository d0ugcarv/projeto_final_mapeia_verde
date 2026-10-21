USE mapeia_verde;

INSERT INTO projeto
    (contrato_id, nome, data_inicio, data_fim, descricao, area)
VALUES
    -- Contrato 1: Prefeitura do Rio
    (1, 'Arborização do Centro',
     '2026-01-15', '2026-05-30',
     'Mapeamento de árvores e áreas sombreadas',
     'Centro, Rio de Janeiro'),

    (1, 'Corredores Verdes Urbanos',
     '2026-06-01', '2026-12-15',
     'Identificação de corredores de vegetação',
     'Zona Norte, Rio de Janeiro'),

    -- Contrato 2: Prefeitura do Rio
    (2, 'Praças Sustentáveis',
     '2026-06-10', '2026-11-20',
     'Inventário arbóreo de praças públicas',
     'Zona Sul, Rio de Janeiro'),

    -- Contrato 3: Verde Urbano Ltda
    (3, 'Árvores da Tijuca',
     '2026-02-05', '2026-04-30',
     'Levantamento de árvores em vias urbanas',
     'Tijuca, Rio de Janeiro'),

    (3, 'Mapeamento de Sombra',
     '2026-05-01', '2026-07-20',
     'Análise de cobertura de sombra urbana',
     'Maracanã, Rio de Janeiro'),

    -- Contrato 4: Verde Urbano Ltda
    (4, 'Monitoramento de Parques',
     '2026-08-05', '2026-12-15',
     'Acompanhamento da saúde das árvores',
     'Barra da Tijuca, Rio de Janeiro'),

    -- Contrato 5: Eco Consultoria
    (5, 'Inventário Arbóreo Metropolitano',
     '2026-03-20', '2026-08-30',
     'Cadastro geográfico de árvores urbanas',
     'Região Metropolitana do Rio'),

    (5, 'Árvores e Clima',
     '2026-09-01', '2027-02-28',
     'Avaliação da vegetação e do calor urbano',
     'Rio de Janeiro'),

    -- Contrato 6: Eco Consultoria
    (6, 'Monitoramento de Áreas Verdes',
     '2026-07-05', '2026-12-20',
     'Monitoramento periódico da vegetação',
     'Niterói, RJ'),

    -- Contrato 7: Instituto Arvoredo
    (7, 'Requalificação Verde',
     '2026-01-25', '2026-06-30',
     'Diagnóstico da arborização local',
     'Flamengo, Rio de Janeiro'),

    -- Contrato 8: Instituto Arvoredo
    (8, 'Árvores Históricas',
     '2025-02-05', '2025-07-25',
     'Inventário de árvores antigas',
     'Centro, Rio de Janeiro'),

    -- Contrato 9: Jardins Sustentáveis
    (9, 'Jardins Urbanos',
     '2026-04-05', '2026-08-25',
     'Mapeamento de árvores em jardins',
     'Barra da Tijuca, Rio de Janeiro'),

    -- Contrato 10: Jardins Sustentáveis
    (10, 'Saúde da Arborização',
     '2026-10-05', '2027-03-30',
     'Monitoramento da saúde vegetal',
     'Recreio, Rio de Janeiro'),

    -- Contrato 11: Prefeitura de Niterói
    (11, 'Arborização de Niterói',
     '2026-01-10', '2026-06-30',
     'Cadastro de árvores em vias públicas',
     'Centro, Niterói'),

    (11, 'Sombra nas Escolas',
     '2026-07-01', '2026-12-20',
     'Avaliação de sombra em áreas escolares',
     'Niterói, RJ'),

    -- Contrato 12: Prefeitura de Niterói
    (12, 'Praças de Niterói',
     '2025-03-05', '2025-11-30',
     'Diagnóstico arbóreo de praças',
     'Icaraí, Niterói'),

    -- Contrato 13: Floresta Consultoria
    (13, 'Monitoramento Florestal Urbano',
     '2026-05-15', '2026-10-30',
     'Acompanhamento de árvores urbanas',
     'São Gonçalo, RJ'),

    -- Contrato 14: Floresta Consultoria
    (14, 'Inventário de Espécies',
     '2025-06-05', '2025-11-20',
     'Identificação de espécies arbóreas',
     'Niterói, RJ'),

    -- Contrato 15: Instituto Cidade Verde
    (15, 'Cidade Verde',
     '2026-02-20', '2026-07-30',
     'Mapeamento da cobertura vegetal',
     'Méier, Rio de Janeiro'),

    -- Contrato 16: Instituto Cidade Verde
    (16, 'Redução de Ilhas de Calor',
     '2026-09-05', '2027-02-28',
     'Análise de sombra e vegetação urbana',
     'Zona Norte, Rio de Janeiro'),

    -- Contrato 17: Paisagem Viva Ltda
    (17, 'Paisagismo Sustentável',
     '2026-03-05', '2026-08-30',
     'Levantamento de árvores e jardins',
     'Recreio, Rio de Janeiro'),

    (17, 'Corredores de Biodiversidade',
     '2026-09-01', '2027-02-20',
     'Mapeamento de conexões verdes',
     'Barra da Tijuca, Rio de Janeiro'),

    -- Contrato 18: Paisagem Viva Ltda
    (18, 'Diagnóstico de Jardins',
     '2025-01-20', '2025-07-10',
     'Avaliação de vegetação ornamental',
     'Jacarepaguá, Rio de Janeiro'),

    -- Contrato 19: Prefeitura de São Gonçalo
    (19, 'Arborização de São Gonçalo',
     '2026-01-20', '2026-06-30',
     'Cadastro de árvores em vias públicas',
     'Centro, São Gonçalo'),

    (19, 'Monitoramento de Praças',
     '2026-07-01', '2026-12-15',
     'Acompanhamento de árvores em praças',
     'São Gonçalo, RJ'),

    -- Contrato 20: Prefeitura de São Gonçalo
    (20, 'Sombreamento Urbano',
     '2025-04-05', '2025-11-30',
     'Estudo da cobertura de sombra',
     'Alcântara, São Gonçalo'),

    -- Projetos adicionais
    (1, 'Inventário de Árvores Viárias',
     '2026-02-01', '2026-04-30',
     'Registro de árvores em ruas e avenidas',
     'Copacabana, Rio de Janeiro'),

    (5, 'Diagnóstico de Áreas Críticas',
     '2026-04-01', '2026-07-31',
     'Identificação de áreas com pouca sombra',
     'Duque de Caxias, RJ'),

    (11, 'Gestão de Árvores de Risco',
     '2026-02-01', '2026-05-31',
     'Identificação de árvores com risco potencial',
     'São Francisco, Niterói'),

    (19, 'Plano de Expansão Verde',
     '2026-03-01', '2026-09-30',
     'Planejamento de novas áreas arborizadas',
     'São Gonçalo, RJ');
