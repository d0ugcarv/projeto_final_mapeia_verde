import random
import mysql.connector
from datetime import date, timedelta

# ==========================================
# CONFIGURAÇÕES
# ==========================================

SEMENTE = 42
TOTAL_VISTORIAS = 100

rng = random.Random(SEMENTE)

# ==========================================
# CONEXÃO COM O MYSQL
# ==========================================

conexao = mysql.connector.connect(
    host="localhost",
    user="seu_usuario",
    password="sua_senha",
    database="mapeia_verde"
)

cursor = conexao.cursor()

try:
    # Buscar os projetos cadastrados
    cursor.execute("""
        SELECT id, nome
        FROM projeto
        ORDER BY id
    """)

    projetos = cursor.fetchall()

    if not projetos:
        raise ValueError(
            "Nenhum projeto encontrado na tabela projeto."
        )

    # ==========================================
    # DADOS PARA GERAÇÃO
    # ==========================================

    responsaveis = [
        "Ana Martins",
        "Bruno Ferreira",
        "Carla Souza",
        "Daniel Oliveira",
        "Eduarda Lima",
        "Felipe Costa",
        "Gabriela Alves",
        "Henrique Santos",
        "Isabela Rocha",
        "João Mendes"
    ]

    tipos_vistoria = [
        "Rotina",
        "Emergencial",
        "Preventiva"
    ]

    pesos_tipos = [60, 15, 25]

    data_inicial = date(2025, 1, 1)
    intervalo_dias = 600

    observacoes_modelo = {
        "Rotina": [
            "Avaliação periódica das condições da árvore.",
            "Verificação das condições gerais da arborização.",
            "Inspeção visual de copa, tronco e raízes."
        ],
        "Emergencial": [
            "Avaliação fictícia após ocorrência de clima severo.",
            "Verificação de possível risco à circulação de pedestres.",
            "Inspeção simulada após relato de dano à árvore."
        ],
        "Preventiva": [
            "Avaliação preventiva de estabilidade e saúde.",
            "Verificação de sinais de pragas e doenças.",
            "Análise preventiva da necessidade de manejo."
        ]
    }

    # ==========================================
    # GERAR AS 100 VISTORIAS
    # ==========================================

    sql = """
        INSERT INTO vistoria (
            projeto_id,
            data,
            responsavel,
            tipo,
            observacoes
        )
        VALUES (%s, %s, %s, %s, %s)
    """

    registros = []

    for i in range(TOTAL_VISTORIAS):
        projeto_id, nome_projeto = projetos[i % len(projetos)]

        tipo = rng.choices(
            tipos_vistoria,
            weights=pesos_tipos,
            k=1
        )[0]

        data_vistoria = data_inicial + timedelta(
            days=rng.randint(0, intervalo_dias)
        )

        responsavel = rng.choice(responsaveis)

        observacao = (
            f"{rng.choice(observacoes_modelo[tipo])} "
            f"Projeto: {nome_projeto}."
        )

        registros.append((
            projeto_id,
            data_vistoria,
            responsavel,
            tipo,
            observacao
        ))

    # Inserir em lote
    cursor.executemany(sql, registros)

    conexao.commit()

    print(f"{cursor.rowcount} vistorias inseridas.")
    print(f"Projetos disponíveis: {len(projetos)}")

except Exception as erro:
    conexao.rollback()
    print("Erro ao gerar vistorias:", erro)

finally:
    cursor.close()
    conexao.close()

