import sys
import os
import time

def Sair() :
    print("saindo....")
    sys.exit()

def Header(header):

    # clear = lambda: os.system('cls') # windows 
    clear = lambda: os.system('clear') # linux
    clear()

    print("-------------------------------")
    
    if(header == 0):
        print("|         Bem-Vindo           |")
    elif(header == 1):
        print("|           Logar             |")
    elif(header == 2):
        print("|          Cadastro           |")
    elif(header == 3):
        print("|            Menu             |")
    print("-------------------------------")
