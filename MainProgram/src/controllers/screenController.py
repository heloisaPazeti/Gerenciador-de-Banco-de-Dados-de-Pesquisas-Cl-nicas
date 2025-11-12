from MainProgram.src.screens import start
from MainProgram.src.screens import loginAndRegister as lr 
from MainProgram.src.screens import menu
from MainProgram.src.screens import menuOptions as mo
from MainProgram.src.screens import showResearch as sr

from MainProgram.src.functions import commonFunctions as cf
import time
import sys



def Iniciar():
    start.Iniciar()

def Cadastrar():
    lr.Cadastrar()

def Logar():
    lr.Logar()

def Menu():
    menu.Menu()

def MinhasPesquisas():
    mo.MinhasPesquisas()

def Buscar():
    mo.Buscar()

def AdicionarPesquisa():
    mo.AdicionarPesquisa()

def ListarPesquisas(lista):
    return sr.ListarPesquisas(lista)

def Esperar(tempo):
    time.sleep(tempo)

def Header(index):
    cf.Header(index)

def Sair():
    print("Saindo...")
    sys.exit()



        

