USE mapeia_verde;

INSERT INTO contrato
    (cliente_cnpj, data_inicio, data_fim, valor, tipo, status)
VALUES
    -- 1. Prefeitura do Rio
    ('12345678000195', '2026-01-10', '2026-12-31',
     85000.00, 'Recorrente', 'Ativo'),

    ('12345678000195', '2026-06-01', '2026-11-30',
     22000.00, 'Pontual', 'Ativo'),

    -- 2. Verde Urbano Ltda
    ('23456789000106', '2026-02-01', '2026-07-31',
     18500.00, 'Pontual', 'Inativo'),

    ('23456789000106', '2026-08-01', NULL,
     27000.00, 'Monitoramento', 'Ativo'),

    -- 3. Eco Consultoria
    ('34567890000117', '2026-03-15', NULL,
     32000.00, 'Monitoramento', 'Ativo'),

    ('34567890000117', '2026-07-01', '2027-06-30',
     41000.00, 'Recorrente', 'Ativo'),

    -- 4. Instituto Arvoredo
    ('45678901000128', '2026-01-20', '2026-10-20',
     24000.00, 'Recorrente', 'Ativo'),

    ('45678901000128', '2025-02-01', '2025-08-01',
     15000.00, 'Pontual', 'Inativo'),

    -- 5. Jardins Sustentáveis
    ('56789012000139', '2026-04-01', '2026-09-30',
     12500.00, 'Pontual', 'Inativo'),

    ('56789012000139', '2026-10-01', NULL,
     30000.00, 'Monitoramento', 'Ativo'),

    -- 6. Prefeitura de Niterói
    ('67890123000140', '2026-01-05', '2026-12-31',
     67000.00, 'Recorrente', 'Ativo'),

    ('67890123000140', '2025-03-01', '2025-12-31',
     48000.00, 'Recorrente', 'Inativo'),

    -- 7. Floresta Consultoria
    ('78901234000151', '2026-05-10', NULL,
     28000.00, 'Monitoramento', 'Ativo'),

    ('78901234000151', '2025-06-01', '2025-11-30',
     17500.00, 'Pontual', 'Inativo'),

    -- 8. Instituto Cidade Verde
    ('89012345000162', '2026-02-15', '2026-08-15',
     19500.00, 'Pontual', 'Inativo'),

    ('89012345000162', '2026-09-01', NULL,
     26000.00, 'Monitoramento', 'Ativo'),

    -- 9. Paisagem Viva Ltda
    ('90123456000173', '2026-03-01', '2027-02-28',
     36000.00, 'Recorrente', 'Ativo'),

    ('90123456000173', '2025-01-15', '2025-07-15',
     21000.00, 'Pontual', 'Inativo'),

    -- 10. Prefeitura de São Gonçalo
    ('01234567000184', '2026-01-15', NULL,
     54000.00, 'Monitoramento', 'Ativo'),

    ('01234567000184', '2025-04-01', '2025-12-31',
     39000.00, 'Recorrente', 'Inativo');
