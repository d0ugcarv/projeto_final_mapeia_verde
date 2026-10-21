import random
import mysql.connector
from datetime import date, timedelta

# ==========================================
# CONFIGURAÇÕES
# ==========================================

SEMENTE = 42
TOTAL_MONITORAMENTOS = 5000

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
    # Buscar os IDs das árvores existentes
    cursor.execute("""
        SELECT id
        FROM arvore
        ORDER BY id
    """)

    arvores = [linha[0] for linha in cursor.fetchall()]

    if not arvores:
        raise ValueError(
            "Nenhuma árvore encontrada na tabela arvore."
        )

    # ==========================================
    # DADOS PARA GERAÇÃO
    # ==========================================

    estados_saude = [
        "Saudável",
        "Regular",
        "Ruim",
        "Crítico"
    ]

    pesos_saude = [55, 25, 15, 5]

    data_inicial = date(2025, 1, 1)
    intervalo_dias = 1000

    # Medições-base por árvore para manter
    # coerência entre seus monitoramentos.
    medidas_base = {}

    for arvore_id in arvores:
        medidas_base[arvore_id] = {
            "altura": rng.uniform(2.0, 20.0),
            "diametro": rng.uniform(5.0, 100.0),
            "sombra": rng.uniform(10.0, 90.0)
        }

    # ==========================================
    # GERAR OS 5.000 MONITORAMENTOS
    # ==========================================

    sql = """
        INSERT INTO monitoramento (
            arvore_id,
            data,
            estado_saude,
            altura,
            diametro,
            cobertura_sombra,
            observacoes
        )
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """

    registros = []

    for i in range(TOTAL_MONITORAMENTOS):
        # Distribui os registros entre as árvores.
        arvore_id = arvores[i % len(arvores)]

        base = medidas_base[arvore_id]

        # Datas fictícias distribuídas ao longo do período.
        data_monitoramento = data_inicial + timedelta(
            days=rng.randint(0, intervalo_dias)
        )

        # Pequenas variações em relação às medidas-base.
        altura = max(
            0.0,
            base["altura"] + rng.uniform(-0.3, 0.5)
        )

        diametro = max(
            0.0,
            base["diametro"] + rng.uniform(-1.0, 2.0)
        )

        cobertura_sombra = max(
            0.0,
            min(
                100.0,
                base["sombra"] + rng.uniform(-10.0, 10.0)
            )
        )

        estado_saude = rng.choices(
            estados_saude,
            weights=pesos_saude,
            k=1
        )[0]

        observacoes = (
            f"Monitoramento fictício #{i + 1}; "
            f"árvore {arvore_id}"
        )

        registros.append((
            arvore_id,
            data_monitoramento,
            estado_saude,
            round(altura, 2),
            round(diametro, 2),
            round(cobertura_sombra, 2),
            observacoes
        ))

    # Inserir todos os registros em lote.
    cursor.executemany(sql, registros)

    # Confirmar a transação.
    conexao.commit()

    print(f"{cursor.rowcount} monitoramentos inseridos.")
    print(f"Árvores disponíveis: {len(arvores)}")

except Exception as erro:
    conexao.rollback()
    print("Erro ao gerar monitoramentos:", erro)

finally:
    cursor.close()
    conexao.close()

