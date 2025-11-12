from MainProgram.src.controllers import screenController as sc

def Iniciar ():
    
    result = False

    sc.Header(0)
    print("[1] Logar")
    print("[2] Cadastrar")
    print("[3] Sair")

    opt = input()

    if (opt == "1"):
        sc.Logar()
    elif (opt == "2"):
        sc.Cadastrar()
    elif (opt == "3"):
        sc.Sair()
    else:
        print("Comando não encontrado... Tente novamente.")
        sc.Iniciar()

