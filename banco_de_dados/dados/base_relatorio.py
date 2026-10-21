
import random
import mysql.connector
from datetime import date, timedelta

# ==========================================
# CONFIGURAÇÕES
# ==========================================

SEMENTE = 42
TOTAL_RELATORIOS = 100

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
    # Buscar projetos existentes
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

    tipos_relatorio = [
        "Inventário Arbóreo",
        "Diagnóstico Ambiental",
        "Relatório de Vistoria",
        "Monitoramento da Arborização",
        "Mapeamento de Sombreamento"
    ]

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

    data_inicial = date(2025, 1, 1)
    intervalo_dias = 600

    # ==========================================
    # GERAR OS 100 RELATÓRIOS
    # ==========================================

    sql = """
        INSERT INTO relatorio (
            projeto_id,
            tipo,
            data_emissao,
            arquivo,
            responsavel
        )
        VALUES (%s, %s, %s, %s, %s)
    """

    registros = []

    for i in range(TOTAL_RELATORIOS):
        # Distribuir os relatórios entre os projetos
        projeto_id, nome_projeto = projetos[i % len(projetos)]

        tipo = rng.choice(tipos_relatorio)

        data_emissao = data_inicial + timedelta(
            days=rng.randint(0, intervalo_dias)
        )

        responsavel = rng.choice(responsaveis)

        # Caminho fictício para o arquivo PDF
        arquivo = (
            f"relatorios/projeto_{projeto_id}/"
            f"relatorio_{i + 1:03d}.pdf"
        )

        registros.append((
            projeto_id,
            tipo,
            data_emissao,
            arquivo,
            responsavel
        ))

    # ==========================================
    # INSERIR NO BANCO DE DADOS
    # ==========================================

    cursor.executemany(sql, registros)
    conexao.commit()

    print(f"{cursor.rowcount} relatórios inseridos.")
    print(f"Projetos disponíveis: {len(projetos)}")

except Exception as erro:
    conexao.rollback()
    print("Erro ao gerar relatórios:", erro)

finally:
    cursor.close()
    conexao.close()
