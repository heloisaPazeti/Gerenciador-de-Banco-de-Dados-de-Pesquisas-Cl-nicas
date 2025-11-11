from MainProgram.src.functions import commonFunctions as cf  

from MainProgram.src.menuOptions import researches as res
from MainProgram.src.menuOptions import search as sea
from MainProgram.src.menuOptions import addResearch as add
from MainProgram.src.menuOptions import exams as ex

import time
import sys
def Menu():

    result = True

    cf.Header(3)

    print("[1] Minhas Pesquisas")
    print("[2] Buscar")
    print("[3] Adicionar Pesquisa")
    print("[4] Amostras / Exames")
    print("[5] Deslogar")
    print("[6] Sair")

    opt = input("\nSelecione uma opção: ")

    if(opt == "1"):
        result = res.MinhasPesquisas()
    elif(opt == "2"):
        result = sea.Buscar()
    elif(opt == "3"):
        result = add.AdicionarPesquisa()
    elif(opt == "4"):
        print("4")
    elif(opt == "5"):
        return False
    elif(opt == "6"):
        cf.Sair()
    else: 
        print("Comando inexistente...")
        time.sleep(1)
        

    if(result):
        Menu()
