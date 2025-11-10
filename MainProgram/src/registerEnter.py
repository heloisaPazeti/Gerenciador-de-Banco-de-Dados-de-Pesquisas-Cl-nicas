import commonFunctions as cf
import time
import menu

# APENAS PARA TESTE
import testCredentials as tc

def Cadastrar():
    
    result = True

    cf.Header(2)

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

    # FAZER PARADA NO BANCO E VER SE DEU CERTO

    #if(deu certo):
        # print("Cadastro realizado - logando...")
        # result = Logar()
    #else:
        # opt = input("Parece que algo deu errado... Tentar novamente? [s/n]: ")
        # if (opt == "s"): 
            # result = Cadastrar()
        # else: cf.Sair()


    result = Logar()
    return result

def Logar():

    cf.Header(1)
    
    cpf = input("CPF: ")
    senha = input("Senha: ")

    # TESTE SEM BD
    if (cpf == tc.CPF() and senha == tc.Senha()):
        print("Credenciais aceitas!")
        time.sleep(1)
        result = menu.Menu()
        return result
    else:
        print("Parece que algo não está certo, tente novamente...")
        time.sleep(1.5)
        return False
