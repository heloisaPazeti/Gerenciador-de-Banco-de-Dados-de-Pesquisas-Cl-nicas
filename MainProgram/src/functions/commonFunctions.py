import os
import time

def LimparTela():
    
    if(os.name == 'nt'):
        os.system('cls') # windows 
    else:
        os.system('clear') # linux/mac

def Header(header):

    LimparTela()

    print("-------------------------------")
    
    if(header == 0):
        print("|         Bem-Vindo           |")
    elif(header == 1):
        print("|           Logar             |")
    elif(header == 2):
        print("|          Cadastro           |")
    elif(header == 3):
        print("|            Menu             |")
    elif(header == 4):
        print("|      Minhas Pesquisas       |")
    elif(header == 5):
        print("|           Buscar            |")
    elif(header == 6):
        print("|   Adicionar Nova Pesquisa   |")

    print("-------------------------------")
