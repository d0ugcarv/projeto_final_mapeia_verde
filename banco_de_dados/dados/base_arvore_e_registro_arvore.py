
import random
import mysql.connector
from datetime import date, timedelta

# ==========================================
# CONFIGURAÇÕES
# ==========================================

SEMENTE = 42
QUANTIDADE_ARVORES = 3000

rng = random.Random(SEMENTE)

# Configure as credenciais do seu MySQL.
conexao = mysql.connector.connect(
    host="localhost",
    user="seu_usuario",
    password="sua_senha",
    database="mapeia_verde"
)

cursor = conexao.cursor()

# ==========================================
# DADOS FICTÍCIOS
# ==========================================

especies = [
    ("Licania tomentosa", "Oiti"),
    ("Handroanthus heptaphyllus", "Ipê-rosa"),
    ("Terminalia catappa", "Amendoeira"),
    ("Delonix regia", "Flamboyant"),
    ("Poincianella pluviosa", "Sibipiruna"),
    ("Tipuana tipu", "Tipuana"),
    ("Ficus benjamina", "Figueira-benjamim"),
    ("Pachira aquatica", "Munguba"),
    ("Inga vera", "Ingá"),
    ("Tabebuia roseoalba", "Ipê-branco")
]

condicoes = ["Boa", "Regular", "Ruim"]
pesos_condicoes = [0.60, 0.30, 0.10]

# ==========================================
# BUSCAR LEVANTAMENTOS EXISTENTES
# ==========================================

cursor.execute("""
    SELECT id
    FROM levantamento
    ORDER BY id
""")

levantamentos = [linha[0] for linha in cursor.fetchall()]

if not levantamentos:
    cursor.close()
    conexao.close()
    raise RuntimeError(
        "Nenhum levantamento encontrado no banco de dados."
    )

print(f"Levantamentos encontrados: {len(levantamentos)}")
print(f"Árvores a gerar: {QUANTIDADE_ARVORES}")

# ==========================================
# GERAR E INSERIR ÁRVORES
# ==========================================

data_base = date(2025, 1, 1)

try:
    for i in range(QUANTIDADE_ARVORES):

        # Escolher uma espécie
        especie, nome_popular = rng.choice(especies)

        # Coordenadas fictícias na região do Rio de Janeiro
        latitude = round(rng.uniform(-23.00, -22.75), 6)
        longitude = round(rng.uniform(-43.75, -43.00), 6)

        # Data de cadastro reproduzível
        data_cadastro = data_base + timedelta(
            days=rng.randint(0, 1023)
        )

        # Estado atual da árvore
        status = rng.choices(
            ["Ativa", "Inativa", "Removida"],
            weights=[0.90, 0.07, 0.03],
            k=1
        )[0]

        # Inserir árvore
        cursor.execute("""
            INSERT INTO arvore (
                especie,
                nome_popular,
                latitude,
                longitude,
                data_cadastro,
                status
            )
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (
            especie,
            nome_popular,
            latitude,
            longitude,
            data_cadastro,
            status
        ))

        arvore_id = cursor.lastrowid

        # Distribuir as árvores entre os levantamentos.
        # Cada levantamento recebe aproximadamente a mesma quantidade.
        levantamento_id = levantamentos[i % len(levantamentos)]

        # Gerar medidas fictícias
        altura = round(rng.uniform(2.0, 20.0), 2)
        diametro = round(rng.uniform(5.0, 100.0), 2)

        condicao = rng.choices(
            condicoes,
            weights=pesos_condicoes,
            k=1
        )[0]

        cobertura_sombra = round(
            rng.uniform(0.0, 100.0), 2
        )

        observacoes = "Dados fictícios gerados por Python"

        # Relacionar árvore ao levantamento
        cursor.execute("""
            INSERT INTO registro_arvore (
                levantamento_id,
                arvore_id,
                altura,
                diametro,
                condicao,
                cobertura_sombra,
                observacoes
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            levantamento_id,
            arvore_id,
            altura,
            diametro,
            condicao,
            cobertura_sombra,
            observacoes
        ))

        if (i + 1) % 500 == 0:
            print(f"{i + 1} árvores processadas...")

    # Confirmar todas as inserções
    conexao.commit()

    print("\nInserção concluída com sucesso!")
    print(f"Árvores inseridas: {QUANTIDADE_ARVORES}")
    print(
        "Registros de árvores inseridos:",
        QUANTIDADE_ARVORES
    )
    print("Semente utilizada:", SEMENTE)

except Exception as erro:
    conexao.rollback()
    print("Erro durante a inserção:", erro)
    print("As alterações desta execução foram desfeitas.")

finally:
    cursor.close()
    conexao.close()
