import commonFunctions as cf  
import time
import sys

from menuOptions import researches as res
from menuOptions import search as sea
from menuOptions import exams as ex

def Menu():

    result = True

    cf.Header(3)

    print("[1] Minhas Pesquisas")
    print("[2] Buscar")
    print("[3] Amostras / Exames")
    print("[4] Deslogar")
    print("[5] Sair")

    opt = input("\n Selecione uma opção: ")

    if(opt == "1"):
       result = res.MinhasPesquisas()
    elif(opt == "2"):
        print("1")
    elif(opt == "3"):
        print("1")
    elif(opt == "4"):
        return False
    elif(opt == "5"):
        cf.Sair()
    else: 
        print("Comando inexistente...")
        time.sleep(1)
        

    if(result):
        Menu()
