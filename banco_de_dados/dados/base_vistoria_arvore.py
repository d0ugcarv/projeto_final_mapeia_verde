
import random
import mysql.connector

# ==========================================
# CONFIGURAÇÕES
# ==========================================

SEMENTE = 42
TOTAL_REGISTROS = 3000

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
    # Buscar as vistorias existentes
    cursor.execute("""
        SELECT id
        FROM vistoria
        ORDER BY id
    """)
    vistorias = [linha[0] for linha in cursor.fetchall()]

    # Buscar as árvores existentes
    cursor.execute("""
        SELECT id
        FROM arvore
        ORDER BY id
    """)
    arvores = [linha[0] for linha in cursor.fetchall()]

    if not vistorias:
        raise ValueError("Nenhuma vistoria encontrada.")

    if not arvores:
        raise ValueError("Nenhuma árvore encontrada.")

    # ==========================================
    # OPÇÕES DE DADOS
    # ==========================================

    estados_saude = [
        "Saudável",
        "Regular",
        "Ruim",
        "Crítico"
    ]
    pesos_saude = [55, 25, 15, 5]

    riscos = ["Baixo", "Médio", "Alto"]
    pesos_risco = [60, 30, 10]

    necessidades_manejo = [
        "Nenhuma",
        "Poda",
        "Tratamento",
        "Remoção"
    ]
    pesos_manejo = [50, 25, 15, 10]

    # ==========================================
    # GERAR COMBINAÇÕES ÚNICAS
    # ==========================================

    # A chave primária é (vistoria_id, arvore_id).
    combinacoes_possiveis = len(vistorias) * len(arvores)

    if combinacoes_possiveis < TOTAL_REGISTROS:
        raise ValueError(
            f"Existem apenas {combinacoes_possiveis} combinações "
            "possíveis de vistoria e árvore. "
            "Não é possível gerar 3000 combinações únicas."
        )

    # Carregar combinações já cadastradas para evitar duplicatas.
    cursor.execute("""
        SELECT vistoria_id, arvore_id
        FROM vistoria_arvore
    """)
    existentes = set(cursor.fetchall())

    # Gerar todas as combinações disponíveis que ainda não existem.
    disponiveis = [
        (vistoria_id, arvore_id)
        for vistoria_id in vistorias
        for arvore_id in arvores
        if (vistoria_id, arvore_id) not in existentes
    ]

    if len(disponiveis) < TOTAL_REGISTROS:
        raise ValueError(
            f"Há apenas {len(disponiveis)} combinações novas disponíveis."
        )

    rng.shuffle(disponiveis)
    combinacoes = disponiveis[:TOTAL_REGISTROS]

    # ==========================================
    # MONTAR OS REGISTROS
    # ==========================================

    sql = """
        INSERT INTO vistoria_arvore (
            vistoria_id,
            arvore_id,
            estado_saude,
            risco,
            necessidade_manejo,
            observacoes
        )
        VALUES (%s, %s, %s, %s, %s, %s)
    """

    registros = []

    for i, (vistoria_id, arvore_id) in enumerate(combinacoes, start=1):
        estado = rng.choices(
            estados_saude,
            weights=pesos_saude,
            k=1
        )[0]

        risco = rng.choices(
            riscos,
            weights=pesos_risco,
            k=1
        )[0]

        manejo = rng.choices(
            necessidades_manejo,
            weights=pesos_manejo,
            k=1
        )[0]

        observacoes = (
            f"Registro fictício #{i}; "
            f"vistoria {vistoria_id}; árvore {arvore_id}."
        )

        registros.append((
            vistoria_id,
            arvore_id,
            estado,
            risco,
            manejo,
            observacoes
        ))

    # ==========================================
    # INSERIR NO BANCO
    # ==========================================

    cursor.executemany(sql, registros)
    conexao.commit()

    print(f"{cursor.rowcount} registros inseridos em vistoria_arvore.")
    print(f"Vistorias disponíveis: {len(vistorias)}")
    print(f"Árvores disponíveis: {len(arvores)}")

except Exception as erro:
    conexao.rollback()
    print("Erro ao gerar registros:", erro)

finally:
    cursor.close()
    conexao.close()
