from MainProgram.src.controllers import screenController as sc
import time

def Menu():

    result = True

    sc.Header(3)

    print("[1] Minhas Pesquisas")
    print("[2] Buscar")
    print("[3] Adicionar Pesquisa")
    print("[4] Alterar Pesquisa")
    print("[5] Deletar Pesquisa")
    print("[6] Deslogar")
    print("[7] Sair")

    opt = input("\nSelecione uma opção: ")

    if(opt == "1"):
        sc.MinhasPesquisas()
    elif(opt == "2"):
        sc.Buscar()
    elif(opt == "3"):
        sc.AdicionarPesquisa()
    elif(opt == "4"):
        print("4")
    elif(opt == "5"):
        print("5")
    elif(opt == "6"):
        sc.Iniciar()
    elif(opt == "7"):
        sc.Sair()
    else: 
        print("Comando inexistente...")
        time.sleep(1)
        sc.Menu()
