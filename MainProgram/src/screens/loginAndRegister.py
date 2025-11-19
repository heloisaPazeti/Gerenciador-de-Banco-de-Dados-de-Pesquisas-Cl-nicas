from MainProgram.src.connections import connection as con
from MainProgram.src.controllers import screenController as sc
import psycopg2
# APENAS PARA TESTE
from MainProgram.src.functions import testCredentials as tc


def Cadastrar():
    result = True
    sc.Header(2)

    cpf = input("CPF: ").strip()
    name = input("Nome: ")
    uf = input("UF: ").strip()
    cidade = input("Cidade: ")
    bairro = input("Bairro: ")
    rua = input("Rua: ")
    nro = input("Numero: ")
    telefone1 = input("Telefone Principal: ")
    telefone2 = input("Telefone Secundario (opcional): ") or None
    dtNasc = input("Data de Nascimento (dd/mm/yyyy): ").strip()
    coren = input("COREN (opcional): ") or None
    crm = input("CRM (opcional): ") or None

    senha = input("Senha: ")
    senha2 = input("Insira a senha novamente: ")

    while senha != senha2:
        print("As senhas não coincidem. Tente novamente.")
        senha2 = input("Insira a senha novamente: ")

    # Parâmetros base
    parametros = {
        "cpf_bind": cpf,
        "nome_bind": name,
        "uf_bind": uf,
        "cidade_bind": cidade,
        "bairro_bind": bairro,
        "rua_bind": rua,
        "numero_bind": nro,
        "telefone1_bind": telefone1,
        "telefone2_bind": telefone2,
        "data_nasc_bind": dtNasc,
        "senha_bind": senha,
    }

    connection = con.GetConnection() 
    cursor = connection.cursor()
    #person_id_out = cursor.var(int)
    #parametros["person_id_out"] = person_id_out

    try:
        sql = """
                INSERT INTO PESSOA (CPF, NOME, UF, CIDADE, BAIRRO, RUA, NUMERO, TELEFONE1, TELEFONE2, DATA_NASC, SENHA)
                VALUES (
                    %(cpf_bind)s, %(nome_bind)s, %(uf_bind)s, %(cidade_bind)s, %(bairro_bind)s, %(rua_bind)s, %(numero_bind)s, 
                    %(telefone1_bind)s, %(telefone2_bind)s, TO_DATE(%(data_nasc_bind)s, 'DD/MM/YYYY'), %(senha_bind)s)
                RETURNING ID;

        """ 
        cursor.execute(sql, parametros)
        person_id = cursor.fetchone()[0]
        connection.commit()
        
        print("Cadastro de Pessoa realizado com sucesso!")


        if coren:
        
            cursor.execute("""
                INSERT INTO ENFERMEIRO (ID, COREN)
                VALUES (%s, %s)
            """, (person_id, coren))
            connection.commit()
            print("Cadastro de Enfermeiro feito com sucesso!")


        if crm:
        
            cursor.execute("""
                INSERT INTO MEDICO (ID, CRM)
                VALUES (%s, %s)
            """, (person_id, crm))
            connection.commit()
            print("Cadastro de Medico feito com sucesso!")


        cursor.close()
        sc.Esperar(1)
        sc.Logar()

    except psycopg2.Error as error:
        connection.rollback()
        print("Erro:", error)

        opt = input("Deseja tentar novamente? [s/n]: ").lower()
        if opt == "s":
            sc.Cadastrar()
        else:
            sc.Sair()


def Logar():

    sc.Header(1)

    cpf = input("CPF: ").strip()
    senha = input("Senha: ").strip()

    try:
        cursor = connection.cursor()

        sql_query = """
            SELECT SENHA 
            FROM PESSOA 
            WHERE CPF = :cpf_bind
        """

        cursor.execute(sql_query, {"cpf_bind": cpf})
        resultado = cursor.fetchone()

        cursor.close()

        if not resultado:
            print("CPF não encontrado. Tente novamente...")
            sc.Esperar(1.5)
            return sc.Iniciar()

        senha_bd = resultado[0]

        # Comparar
        if senha == senha_bd:
            print("Credenciais aceitas!")
            sc.Esperar(0.5)
            return sc.Menu()

        else:
            print("Senha incorreta. Tente novamente...")
            sc.Esperar(1.5)
            return sc.Iniciar()

    except oracledb.Error as error:
        print("Erro no login, tente novamente...")
        sc.Esperar(1.5)
        return sc.Iniciar()
