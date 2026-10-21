USE mapeia_verde;

INSERT INTO levantamento
    (projeto_id, `data`, responsavel, tipo, observacoes)
VALUES
    -- Projeto 1: Arborização do Centro
    (1, '2026-01-20', 'Ana Souza', 'Inicial',
     'Cadastro inicial das árvores do Centro'),
    (1, '2026-03-15', 'Carlos Lima', 'Atualização',
     'Atualização das árvores cadastradas'),

    -- Projeto 2: Corredores Verdes Urbanos
    (2, '2026-06-05', 'Mariana Alves', 'Inicial',
     'Mapeamento inicial dos corredores verdes'),
    (2, '2026-09-10', 'Pedro Costa', 'Atualização',
     'Revisão dos corredores mapeados'),

    -- Projeto 3: Praças Sustentáveis
    (3, '2026-06-15', 'Juliana Rocha', 'Inicial',
     'Cadastro das árvores das praças'),
    (3, '2026-08-20', 'Lucas Martins', 'Atualização',
     'Atualização dos dados das praças'),

    -- Projeto 4: Árvores da Tijuca
    (4, '2026-02-10', 'Fernanda Alves', 'Inicial',
     'Inventário arbóreo da Tijuca'),
    (4, '2026-04-15', 'Rafael Mendes', 'Atualização',
     'Revisão do inventário da Tijuca'),

    -- Projeto 5: Mapeamento de Sombra
    (5, '2026-05-05', 'Beatriz Lima', 'Inicial',
     'Medição inicial da cobertura de sombra'),
    (5, '2026-06-25', 'Gabriel Souza', 'Atualização',
     'Atualização das áreas sombreadas'),

    -- Projeto 6: Monitoramento de Parques
    (6, '2026-08-10', 'Camila Rocha', 'Inicial',
     'Cadastro inicial das árvores dos parques'),
    (6, '2026-10-05', 'Diego Martins', 'Atualização',
     'Revisão das árvores monitoradas'),

    -- Projeto 7: Inventário Arbóreo Metropolitano
    (7, '2026-03-25', 'Amanda Costa', 'Inicial',
     'Cadastro arbóreo metropolitano'),
    (7, '2026-06-20', 'Bruno Alves', 'Atualização',
     'Complementação dos dados geográficos'),

    -- Projeto 8: Árvores e Clima
    (8, '2026-09-10', 'Isabela Santos', 'Inicial',
     'Levantamento de vegetação e clima'),
    (8, '2026-11-15', 'Thiago Lima', 'Atualização',
     'Atualização dos indicadores ambientais'),

    -- Projeto 9: Monitoramento de Áreas Verdes
    (9, '2026-07-10', 'Larissa Mendes', 'Inicial',
     'Cadastro das áreas verdes'),
    (9, '2026-10-15', 'Felipe Rocha', 'Atualização',
     'Atualização das áreas monitoradas'),

    -- Projeto 10: Requalificação Verde
    (10, '2026-02-01', 'Marcos Souza', 'Inicial',
     'Diagnóstico inicial da arborização'),
    (10, '2026-05-20', 'Patricia Costa', 'Atualização',
     'Revisão do diagnóstico arbóreo'),

    -- Projeto 11: Árvores Históricas
    (11, '2025-02-10', 'Renata Alves', 'Inicial',
     'Cadastro de árvores históricas'),
    (11, '2025-05-15', 'André Martins', 'Atualização',
     'Revisão das árvores históricas'),

    -- Projeto 12: Jardins Urbanos
    (12, '2026-04-10', 'Sofia Lima', 'Inicial',
     'Mapeamento inicial dos jardins'),
    (12, '2026-07-15', 'Eduardo Rocha', 'Atualização',
     'Atualização dos jardins cadastrados'),

    -- Projeto 13: Saúde da Arborização
    (13, '2026-10-10', 'Bianca Souza', 'Inicial',
     'Cadastro de árvores para monitoramento'),
    (13, '2026-12-10', 'Gustavo Alves', 'Atualização',
     'Revisão das condições da arborização'),

    -- Projeto 14: Arborização de Niterói
    (14, '2026-01-15', 'Carolina Mendes', 'Inicial',
     'Cadastro das árvores de Niterói'),
    (14, '2026-04-20', 'Vinicius Costa', 'Atualização',
     'Atualização do inventário urbano'),

    -- Projeto 15: Sombra nas Escolas
    (15, '2026-07-10', 'Leticia Martins', 'Inicial',
     'Mapeamento de sombra nas escolas'),
    (15, '2026-10-01', 'Rodrigo Souza', 'Atualização',
     'Revisão das áreas escolares'),

    -- Projeto 16: Praças de Niterói
    (16, '2025-03-10', 'Daniela Rocha', 'Inicial',
     'Cadastro arbóreo das praças'),
    (16, '2025-08-15', 'Marcelo Lima', 'Atualização',
     'Atualização dos dados das praças'),

    -- Projeto 17: Monitoramento Florestal Urbano
    (17, '2026-05-20', 'Aline Costa', 'Inicial',
     'Cadastro da vegetação urbana'),
    (17, '2026-08-15', 'Leonardo Alves', 'Atualização',
     'Revisão da vegetação monitorada'),

    -- Projeto 18: Inventário de Espécies
    (18, '2025-06-10', 'Priscila Mendes', 'Inicial',
     'Identificação inicial das espécies'),
    (18, '2025-09-15', 'Henrique Rocha', 'Atualização',
     'Atualização do inventário de espécies'),

    -- Projeto 19: Cidade Verde
    (19, '2026-02-25', 'Vanessa Souza', 'Inicial',
     'Cadastro da cobertura vegetal'),
    (19, '2026-06-10', 'Ricardo Martins', 'Atualização',
     'Revisão da cobertura vegetal'),

    -- Projeto 20: Redução de Ilhas de Calor
    (20, '2026-09-15', 'Claudia Lima', 'Inicial',
     'Mapeamento de áreas com calor elevado'),
    (20, '2026-11-20', 'Samuel Costa', 'Atualização',
     'Atualização das áreas críticas'),

    -- Projeto 21: Paisagismo Sustentável
    (21, '2026-03-10', 'Monica Alves', 'Inicial',
     'Cadastro de árvores e jardins'),
    (21, '2026-06-15', 'Igor Souza', 'Atualização',
     'Revisão do inventário paisagístico'),

    -- Projeto 22: Corredores de Biodiversidade
    (22, '2026-09-10', 'Debora Rocha', 'Inicial',
     'Mapeamento de conexões verdes'),
    (22, '2026-12-01', 'Alexandre Lima', 'Atualização',
     'Atualização dos corredores verdes'),

    -- Projeto 23: Diagnóstico de Jardins
    (23, '2025-02-01', 'Tatiana Costa', 'Inicial',
     'Diagnóstico de vegetação ornamental'),
    (23, '2025-05-20', 'Roberto Mendes', 'Atualização',
     'Revisão dos jardins avaliados'),

    -- Projeto 24: Arborização de São Gonçalo
    (24, '2026-01-25', 'Elaine Martins', 'Inicial',
     'Cadastro das árvores urbanas'),
    (24, '2026-04-15', 'Fábio Rocha', 'Atualização',
     'Atualização do cadastro arbóreo'),

    -- Projeto 25: Monitoramento de Praças
    (25, '2026-07-10', 'Adriana Souza', 'Inicial',
     'Cadastro de árvores em praças'),
    (25, '2026-10-10', 'Marcelo Costa', 'Atualização',
     'Revisão das árvores das praças'),

    -- Projeto 26: Sombreamento Urbano
    (26, '2025-04-10', 'Luciana Alves', 'Inicial',
     'Medição inicial da cobertura de sombra'),

    -- Projeto 27: Inventário de Árvores Viárias
    (27, '2026-02-10', 'Roberta Lima', 'Inicial',
     'Cadastro de árvores em vias públicas'),

    -- Projeto 28: Diagnóstico de Áreas Críticas
    (28, '2026-04-10', 'Sergio Martins', 'Inicial',
     'Identificação de áreas com pouca sombra'),

    -- Projeto 29: Gestão de Árvores de Risco
    (29, '2026-02-10', 'Natalia Rocha', 'Inicial',
     'Cadastro inicial de árvores de risco'),

    -- Projeto 30: Plano de Expansão Verde
    (30, '2026-03-10', 'Caio Mendes', 'Inicial',
     'Levantamento de áreas para arborização');
