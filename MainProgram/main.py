import commonFunctions as cf
import registerEnter as re

def main() :

    Iniciar()

def Iniciar ():
    
    result = False

    cf.Header(0)
    print("[1] Logar")
    print("[2] Cadastrar")
    print("[3] Sair")

    opt = input()

    if (opt == "1"):
        result = re.Logar()
        if(result == False):
            Iniciar()
    elif (opt == "2"):
        result = re.Cadastrar()
        if(result ==  False):
            Iniciar()
    elif (opt == "3"):
        cf.Sair()
    else:
        print("Comando não encontrado... Tente novamente.")
        Iniciar()

main()
