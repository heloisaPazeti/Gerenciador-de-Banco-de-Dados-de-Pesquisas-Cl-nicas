from MainProgram.src.controllers import screenController as sc
import time

# ----------------------------------------------------------
# FUNCAO: Introduzir Menu Principal
# ----------------------------------------------------------
# - Abre opção de menu
# - Leva para outras telas
# ----------------------------------------------------------
def Menu(idPerson):

    result = True

    sc.Header(3)

    print("[1] Minhas Pesquisas")
    print("[2] Buscar Pesquisas Por Área")
    print("[3] Adicionar Pesquisa")
    print("[4] Requisitar Exame / Amostra")
    print("[5] Deslogar")
    print("[6] Sair")

    opt = input("\nSelecione uma opção: ")

    if(opt == "1"):
        result = sc.MinhasPesquisas(idPerson)
        if (result == False):
            sc.Menu(idPerson)
    elif(opt == "2"):
        sc.BuscarPorArea(idPerson)
    elif(opt == "3"):
        sc.AdicionarPesquisa(idPerson)
    elif(opt == "4"):
        print("Esta opção ainda está em desenvolvimento...")
        sc.Esperar(1.5)
        sc.Menu(idPerson)
    elif(opt == "5"):
        sc.Iniciar()
    elif(opt == "6"):
        sc.Sair()
    else: 
        print("Comando inexistente...")
        time.sleep(1)
        sc.Menu(idPerson)
