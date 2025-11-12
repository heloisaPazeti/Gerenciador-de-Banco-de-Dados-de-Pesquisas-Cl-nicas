from MainProgram.src.controllers import screenController as sc
from MainProgram.objects import research as res

from MainProgram.src.functions import testCredentials as tc

# -----------------------------------------------------
# LISTA PESQUISAS DA PESSOA LOGADA
# -----------------------------------------------------
def MinhasPesquisas():
    
    sc.Header(4)
    listaPesquisas = tc.DummyPesquisas()

    print("[0] Voltar")
    print("-------------------------------")

    result = sc.ListarPesquisas(listaPesquisas)

    if(result):
        sc.MinhasPesquisas()

# -----------------------------------------------------
# TELA DE OPÇÕES DE BUSCA
# -----------------------------------------------------
def Buscar():

    sc.Header(5)

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
        sc.Menu()
    else:
        query = input("Escreva Busca: ")
        # Aqui vai ter que fazer checagens para saber se a busca é válida ou não
        # Depois fazer a busca
        #result = sr.ListarPesquisas(listaPesquisas)
        #if(result):
            #Buscar()
        sc.Menu()

# -----------------------------------------------------
# TELA PARA ADICIONAR PESQUISA 
# -----------------------------------------------------
def AdicionarPesquisa():

    result = True

    sc.Header(6)

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
        sc.Esperar(1)

    sc.Menu()
