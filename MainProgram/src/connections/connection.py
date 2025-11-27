from dotenv import load_dotenv
import os
import psycopg2

# ----------------------------------------------------------
# FUNCAO: Retornar conexão e cursor
# ----------------------------------------------------------
# - Cria conexão
# - Cria cursor
# - Retorna ambos
# ----------------------------------------------------------

load_dotenv()

def GetConnectionAndCursor():
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    return conn, conn.cursor()
