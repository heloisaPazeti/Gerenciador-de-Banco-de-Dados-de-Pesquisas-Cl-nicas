from MainProgram.src.screens import start
from MainProgram.src.screens import loginAndRegister as lr 
from MainProgram.src.screens import menu
from MainProgram.src.screens import menuOptions as mo

from MainProgram.src.functions import researchFunctions as rf
from MainProgram.src.functions import commonFunctions as cf
import time
import sys

# ---------------------------------------------------------------------------------
# - Diversas funcoes com intuito de cuidar do fluxo da aplicação
# - Futuramente deveria se tornar uma classe que já guarda a informação do IdPessoa
# ---------------------------------------------------------------------------------
def Iniciar():
    start.Iniciar()

def Cadastrar():
    lr.Cadastrar()

def Logar():
    lr.Logar()

def Menu(idPerson):
    menu.Menu(idPerson)

def MinhasPesquisas(idPerson):
    mo.MinhasPesquisas(idPerson)

def BuscarPorArea(idPerson):
    mo.BuscarPorArea(idPerson)

def AdicionarPesquisa(idPerson):
    Header(6)
    mo.AdicionarPesquisa(idPerson)

def ListarPesquisas(lista, idPerson):
    return rf.ListarPesquisas(lista, idPerson)

def LimparTela():
    cf.LimparTela()

def Esperar(tempo):
    time.sleep(tempo)

def Header(index):
    cf.Header(index)

def Sair():
    print("Saindo...")
    sys.exit()



        

