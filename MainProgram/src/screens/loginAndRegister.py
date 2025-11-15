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
    coren = input("COREN (opcional): ")
    crm = input("CRM (opcional): ")

    senha = input("Senha: ")
    senha2 = input("Insira a senha novamente: ")

    while (senha != senha2):
        print("Parece que algo não deu certo...")
        senha2 = input("Insira a senha novamente: ")

    #TODO#
    #id=random number???

    # result = query de inserção
    # result = 'INSERT INTO PESSOA(ID, CPF, NOME, UF,CIDADE,BAIRRO,RUA,NUMERO,TELEFONE1,TELEFONE2,DATA_NASC,SENHA) VALUES (id, cpf, nome, uf,cidade,bairro,rua,numero,telefone1,telefone2,data_nasc,senha);'

    #if(coren!=None):
    #    result = 'INSERT INTO ENFERMEIRO(id,COREN) VALUES(id,coren);'

    #if(crm!=None):
    #    result = 'INSERT INTO MEDICO(ID,CRM) VALUES(id,crm);'

    if(result):
        #result = 'COMMIT;'
        print("Cadastro realizado - logando...")
        sc.Esperar(1)
        sc.Logar()
    else:
        #result = 'ROLLBACK;'
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
    # senhaBanco = SELECT PESSOA.SENHA FROM PESSOA WHERE PESSOA.CPF='1234567890';

    if (senha == tc.Senha()):
        print("Credenciais aceitas!")
        sc.Esperar(0.5)
        sc.Menu()
    else:
        print("Parece que algo não está certo, tente novamente...")
        sc.Esperar(1.5)
        sc.Iniciar()
