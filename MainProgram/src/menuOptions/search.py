from MainProgram.src.functions import commonFunctions as cf
from MainProgram.src.screens import menu
from MainProgram.src.screens import showResearch as sr

def Buscar():

    cf.Header(5)

    print("Opções de Busca:")
    print("[1] - Titulo")
    print("[2] - Pesquisador")
    print("[3] - Universidade")
    print("[4] - Area")
    print("[5] - Data de Criação")
    print("[6] - Área")
    print("[7] - Agência de Fomento")

    print("-------------------------------")
    print("[0] - Voltar")
    print("-------------------------------")
    opt = int(input("Selecione uma opção: "))
    print("-------------------------------")

    if(opt == 0):
        menu.Menu()
    else:
        query = input("Escreva Busca: ")
        # Aqui vai ter que fazer checagens para saber se a busca é válida ou não
        # Depois fazer a busca
        # Levar resultados, provavelmente mais de um, para uma outra tela de seleção
        # Deixar lá para selecionar o detalhe de uma pesquisa, isso já tem feito dentro do objeto Pesquisa

        #result = sr.ListarPesquisas(listaPesquisas)
        #if(result):
            #Buscar()

    return True
