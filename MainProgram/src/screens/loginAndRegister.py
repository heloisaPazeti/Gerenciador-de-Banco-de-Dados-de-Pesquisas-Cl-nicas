from MainProgram.src.connections import connection as con
from MainProgram.src.controllers import screenController as sc
import psycopg2

# ----------------------------------------------------------
# FUNCAO: Cadastrar Pessoa
# ----------------------------------------------------------
# - Pega dados de cadastro
# - Compara senhas
# - Monta parâmetros bases
# - Abre conexão e cursor
# - Faz insert na tabela pessoa
# - Faz insert na tabela enfermeiro (se for preciso)
# - Faz insert na tabela medico (se for preciso)
# - Utiliza try e except para pegar erros e printa erros
# - Não retorna nada
# - Fluxos: tela de login, tela de menu ou sai da aplicação
# ----------------------------------------------------------
def Cadastrar():
    result = True
    sc.Header(2)

    cpf = input("CPF (coloque no formato xxx.xxx.xxx-xx): ").strip()
    name = input("Nome: ")
    uf = input("UF: ").strip()
    cidade = input("Cidade: ")
    bairro = input("Bairro: ")
    rua = input("Rua: ")
    nro = input("Numero: ")
    telefone1 = input("Telefone Principal (apenas numeros): ")
    telefone2 = input("Telefone Secundario (opcional): ") or None
    dtNasc = input("Data de Nascimento (dd/mm/yyyy): ").strip()
    coren = input("COREN (opcional): ") or None
    crm = input("CRM (opcional): ") or None

    print("Quais papéis você terá no sistema?")
    pesquisadorR = input("Pesquisador Responsavel [s/n]: ")
    if pesquisadorR == "n":
        pesquisadorC = input("Pesquisador Comum [s/n]: ")
    paciente = input("Paciente [s/n]: ")

    senha = input("Senha: ")
    senha2 = input("Insira a senha novamente: ")

    while senha != senha2:
        print("As senhas não coincidem. Tente novamente.")
        senha2 = input("Insira a senha novamente: ")

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

    try:

        connection, cursor = con.GetConnectionAndCursor() 
        sql = """
                INSERT INTO PESSOA (CPF, NOME, UF, CIDADE, BAIRRO, RUA, NUMERO, TELEFONE1, TELEFONE2, DATA_NASC, SENHA)
                VALUES (
                    %(cpf_bind)s, %(nome_bind)s, %(uf_bind)s, %(cidade_bind)s, %(bairro_bind)s, %(rua_bind)s, %(numero_bind)s, 
                    %(telefone1_bind)s, %(telefone2_bind)s, TO_DATE(%(data_nasc_bind)s, 'DD/MM/YYYY'), %(senha_bind)s)
                RETURNING ID;

        """ 
        cursor.execute(sql, parametros)
        person_id = cursor.fetchone()[0]
        #connection.commit()
        
        print("Cadastro de Pessoa realizado com sucesso!")


        if coren:
        
            cursor.execute("""
                INSERT INTO ENFERMEIRO (ID, COREN)
                VALUES (%s, %s)
            """, [person_id, coren])

            cursor.execute("""
                INSERT INTO FUNCOES (ID, FUNCAO)
                VALUES (%s, %s)
            """, [person_id, 'ENFERMEIRO'])

            #connection.commit()
            print("Cadastro de Enfermeiro feito com sucesso!")

        if crm:
        
            cursor.execute("""
                INSERT INTO MEDICO (ID, CRM)
                VALUES (%s, %s)
            """, [person_id, crm])

            cursor.execute("""
                INSERT INTO FUNCOES (ID, FUNCAO)
                VALUES (%s, %s)
            """, [person_id, 'MEDICO'])

            #connection.commit()
            print("Cadastro de Medico feito com sucesso!")

        if pesquisadorR == "s":

            cursor.execute("""
                INSERT INTO FUNCOES (ID, FUNCAO)
                VALUES (%s, %s)
            """, [person_id, 'PESQUISADOR'])

            cursor.execute("""
                INSERT INTO PESQUISADOR (ID, FUNCAO)
                VALUES (%s, %s)
            """, [person_id, 'PESQUISADOR_RESPONSAVEL'])

            cursor.execute("""
                INSERT INTO PESQUISADOR_RESPONSAVEL (ID)
                VALUES (%s)
            """, [person_id])

            #connection.commit()
            print("Cadastro de Pesquisador Comum feito com sucessor!")

        if pesquisadorC == "s":

            cursor.execute("""
                INSERT INTO FUNCOES (ID, FUNCAO)
                VALUES (%s, %s)
            """, [person_id, 'PESQUISADOR'])
            


            cursor.execute("""
                INSERT INTO PESQUISADOR (ID, FUNCAO)
                VALUES (%s, %s)
            """, [person_id, 'PESQUISADOR_COMUM'])

            cursor.execute("""
                INSERT INTO PESQUISADOR_COMUM (ID)
                VALUES (%s)
            """, [person_id])

            #connection.commit()
            print("Cadastro de Pesquisador Comum feito com sucessor!")

        if paciente == "s":

            cursor.execute("""
                INSERT INTO FUNCOES (ID, FUNCAO)
                VALUES (%s, %s)
            """, {person_id, 'PACIENTE'})

            cursor.execute("""
                INSERT INTO PACIENTE (ID)
                VALUES (%s)
            """, {person_id})


        connection.commit()
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

# ----------------------------------------------------------
# FUNCAO: Logar
# ----------------------------------------------------------
# - Pega as informações ID e SENHA
# - Faz conexão e cursor
# - Seleciona senha ligada a ID e confere
# - Executa comando e coleta resultado
# - Erro 1: ID não localizado -> voltar para menu inicial
# - Erro 2: senha não está correta para ID -> Tentar novamente
# - Except -> erro com o banco -> menu inicial
# ----------------------------------------------------------
def Logar():

    sc.Header(1)

    id = input("ID: ").strip()
    senha = input("Senha: ").strip()
   
    try:

        connection, cursor = con.GetConnectionAndCursor() 

        sql_query = """
            SELECT SENHA 
            FROM PESSOA 
            WHERE ID = %(id)s;
        """

        cursor.execute(sql_query, {"id": id})
        resultado = cursor.fetchone()
        cursor.close()

        if not resultado:
            print("ID não encontrado. Tente novamente...")
            sc.Esperar(1.5)
            return sc.Iniciar()

        senha_bd = resultado[0]

        if senha == senha_bd:
            print("Credenciais aceitas!")
            sc.Esperar(0.5)
            return sc.Menu()

        else:
            print("Senha incorreta. Tente novamente...")
            sc.Esperar(1.5)
            return sc.Iniciar()

    except psycopg2.Error as error:

        print("Erro no login, tente novamente...")
        print("Detalhes técnicos:", error)
        sc.Esperar(1.5)
        return sc.Iniciar()
