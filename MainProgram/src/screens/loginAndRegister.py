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


    if(coren==None and crm==None):
    # result = query de inserção
        '''DECLARE
            person_id NUMBER;
        BEGIN
            INSERT INTO PESSOA(CPF, NOME, UF,CIDADE,BAIRRO,RUA,NUMERO,TELEFONE1,TELEFONE2,DATA_NASC,SENHA)
            VALUES (cpf, nome, uf,cidade,bairro,rua,numero,telefone1,telefone2,data_nasc,senha)
            RETURNING PESSOA.ID INTO person_id;

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
        END;'''

    if(coren!=None and crm==None):
        '''DECLARE
            person_id NUMBER;
        BEGIN
            INSERT INTO PESSOA(CPF, NOME, UF,CIDADE,BAIRRO,RUA,NUMERO,TELEFONE1,TELEFONE2,DATA_NASC,SENHA)
            VALUES (cpf, nome, uf,cidade,bairro,rua,numero,telefone1,telefone2,data_nasc,senha)
            RETURNING PESSOA.ID INTO person_id;

            INSERT INTO ENFERMEIRO(ID, COREN)
            VALUES (person_id, coren);

            INSERT INTO MEDICO(ID, crm)
            VALUES (person_id,crm);

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
        END;'''
        
    if(coren==None and crm!=None):
        '''DECLARE
            person_id NUMBER;
        BEGIN
            INSERT INTO PESSOA(CPF, NOME, UF,CIDADE,BAIRRO,RUA,NUMERO,TELEFONE1,TELEFONE2,DATA_NASC,SENHA)
            VALUES (cpf, nome, uf,cidade,bairro,rua,numero,telefone1,telefone2,data_nasc,senha)
            RETURNING PESSOA.ID INTO person_id;

            INSERT INTO ENFERMEIRO(ID, COREN)
            VALUES (person_id, coren);

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
        END;'''

    if(coren!=None and crm!=None):
        '''DECLARE
            person_id NUMBER;
        BEGIN
            INSERT INTO PESSOA(CPF, NOME, UF,CIDADE,BAIRRO,RUA,NUMERO,TELEFONE1,TELEFONE2,DATA_NASC,SENHA)
            VALUES (cpf, nome, uf,cidade,bairro,rua,numero,telefone1,telefone2,data_nasc,senha)
            RETURNING PESSOA.ID INTO person_id;

            INSERT INTO ENFERMEIRO(ID, COREN)
            VALUES (person_id, coren);

            INSERT INTO MEDICO(ID, CRM)
            VALUES (person_id,crm);

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
        END;'''

    if(result):
        print("Cadastro realizado - logando...")
        sc.Esperar(1)
        sc.Logar()
    else:
        opt = input("Parece que algo deu errado... Tentar novamente? [s/n]: ")
        if (opt == "s"): 
            sc.Cadastrar()
        else: 
            sc.Sair()


def Logar():

    sc.Header(1)
    
    cpf = input("CPF: ")
    senha = input("Senha: ")

    # senhaBanco = query(WHERE CPF == cpf)
    ''' senhaBanco = SELECT PESSOA.SENHA FROM PESSOA WHERE PESSOA.CPF=cpf;'''

    if (senha == tc.Senha()):
        print("Credenciais aceitas!")
        sc.Esperar(0.5)
        sc.Menu()
    else:
        print("Parece que algo não está certo, tente novamente...")
        sc.Esperar(1.5)
        sc.Iniciar()
