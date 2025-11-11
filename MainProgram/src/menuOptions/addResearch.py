from MainProgram.src.functions import commonFunctions as cf
from MainProgram.objects import research as res
from MainProgram.src.screens import menu
import time

def AdicionarPesquisa():

    result = True

    cf.Header(6)

    print("Adicione as seguintes informações:\n")
    titulo = input("Titulo: ")
    area = input("Área: ")
    dtCriacao = input("Data de Criação (dd/mm/yyyy): ")
    universidade = input("Universidade: ")
    agFomento = input("Agência de Fomento: ")
    pesqResponsa = input("Pesquisador Responsável: ")
    pesqs = input("Pesquisadores (separar por , ): ")
    desc = input("Descrição: ")

    pesquisa = res.Pesquisa(titulo, area, dtCriacao, universidade, agFomento, pesqResponsa, pesqs, desc)

    # result = Faz query de inserção
    if(result == False):
        print("Parece que algo deu errado... Tente Novamente mais tarde.")
        time.sleep(1)

    menu.Menu()
