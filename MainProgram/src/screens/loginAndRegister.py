
from MainProgram.src.controllers import screenController as sc

# APENAS PARA TESTE
from MainProgram.src.functions import testCredentials as tc

def Cadastrar():
    
    result = True
    sc.Header(2)

    cpf = input("CPF: ")
    name = input("Nome: ")
    uf = input("UF: ")
    cidade = input("Cidade: ")
    bairro = input("Bairro: ")
    rua = input("Rua: ")
    nro = input("Numero: ")
    telefone1 = input("Telefone Principal: ")
    telefone2 = input("Telefone Secundario (opcional): ")
    dtNasc = input("Data de Nascimento (dd/mm/yyyy): ")
    coren = input("COREN (opcional, digite 'nulo' para deixar vazio): ")
    crm = input("CRM (opcional, digite 'nulo' para deixar vazio): ")

    if(crm=='nulo'):
        crm=None
    if(coren=='nulo'):
        coren=None

    senha = input("Senha: ")
    senha2 = input("Insira a senha novamente: ")

    while (senha != senha2):
        print("Parece que algo não deu certo...")
        senha2 = input("Insira a senha novamente: ")

    sql_query = None

    # O dicionário base já possui os dados comuns
    parametros = {
        'cpf_bind': cpf,
        'nome_bind': name,
        'uf_bind': uf,
        'cidade_bind': cidade,
        'bairro_bind': bairro,
        'rua_bind': rua,
        'numero_bind': nro,
        'telefone1_bind': telefone1,
        'telefone2_bind': telefone2,
        'data_nasc_bind': dtNasc,
        'senha_bind': senha
    }


    if coren is None and crm is None:
        sql_query = """
            BEGIN
                INSERT INTO PESSOA(CPF, NOME, UF, CIDADE, BAIRRO, RUA, NUMERO, TELEFONE1, TELEFONE2, DATA_NASC, SENHA)
                VALUES (:cpf_bind, :nome_bind, :uf_bind, :cidade_bind, :bairro_bind, :rua_bind, :numero_bind, :telefone1_bind, :telefone2_bind, TO_DATE(:data_nasc_bind, 'YYYY-MM-DD'), :senha_bind);
                COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE;
            END;
        """
        
    elif coren is not None and crm is None:
        parametros['coren_bind'] = coren
        
        sql_query = """
            BEGIN
                INSERT INTO PESSOA(CPF, NOME, UF, CIDADE, BAIRRO, RUA, NUMERO, TELEFONE1, TELEFONE2, DATA_NASC, SENHA)
                VALUES (:cpf_bind, :nome_bind, :uf_bind, :cidade_bind, :bairro_bind, :rua_bind, :numero_bind, :telefone1_bind, :telefone2_bind, TO_DATE(:data_nasc_bind, 'YYYY-MM-DD'), :senha_bind)
                RETURNING ID INTO :person_id_out; -- Use um bind de saída se quiser o ID de volta no Python

                INSERT INTO ENFERMEIRO(ID, COREN)
                VALUES (:person_id_out, :coren_bind);

                COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE;
            END;
        """
            
    elif coren is None and crm is not None:
        parametros['crm_bind'] = crm

        sql_query = """
            BEGIN
                INSERT INTO PESSOA(CPF, NOME, UF, CIDADE, BAIRRO, RUA, NUMERO, TELEFONE1, TELEFONE2, DATA_NASC, SENHA)
                VALUES (:cpf_bind, :nome_bind, :uf_bind, :cidade_bind, :bairro_bind, :rua_bind, :numero_bind, :telefone1_bind, :telefone2_bind, TO_DATE(:data_nasc_bind, 'YYYY-MM-DD'), :senha_bind)
                RETURNING ID INTO :person_id_out;

                INSERT INTO MEDICO(ID, CRM)
                VALUES (:person_id_out, :crm_bind);

                COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE;
            END;
        """

    elif coren is not None and crm is not None:
        parametros['coren_bind'] = coren
        parametros['crm_bind'] = crm
        
        sql_query = """
            BEGIN
                INSERT INTO PESSOA(CPF, NOME, UF, CIDADE, BAIRRO, RUA, NUMERO, TELEFONE1, TELEFONE2, DATA_NASC, SENHA)
                VALUES (:cpf_bind, :nome_bind, :uf_bind, :cidade_bind, :bairro_bind, :rua_bind, :numero_bind, :telefone1_bind, :telefone2_bind, TO_DATE(:data_nasc_bind, 'YYYY-MM-DD'), :senha_bind)
                RETURNING ID INTO :person_id_out;

                INSERT INTO ENFERMEIRO(ID, COREN)
                VALUES (:person_id_out, :coren_bind);

                INSERT INTO MEDICO(ID, CRM)
                VALUES (:person_id_out, :crm_bind);

                COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE;
            END;
        """

    try:
        cursor.execute(sql_query, parametros)
        connection.commit()
        print("Cadastro realizado - logando...")
        sc.Esperar(1)
        sc.Logar()
        
    except oracledb.Error as error:
        connection.rollback() # Garante o rollback se o bloco PL/SQL não o fez
        opt = input("Parece que algo deu errado... Tentar novamente? [s/n]: ")
        if (opt == "s"): 
            sc.Cadastrar()
        else: 
            sc.Sair()



def Logar():

    sc.Header(1)
    
    cpf = input("CPF: ")
    senha = input("Senha: ")

    try:
        sql_query = "SELECT SENHA FROM PESSOA WHERE CPF = :cpf_bind"
        
        cursor.execute(sql_query, [cpf])

        resultado = cursor.fetchone()

        if resultado:
            if(senha == resultado[0]):
                print("Credenciais aceitas!")
                sc.Esperar(0.5)
                sc.Menu()
        else:
            print("Parece que algo não está certo, tente novamente...")
            sc.Esperar(1.5)
            sc.Iniciar()

    except oracledb.Error as error:
        print("Parece que algo não está certo, tente novamente...")
        sc.Esperar(1.5)
        sc.Iniciar()
