from MainProgram.src.controllers import screenController as sc
from MainProgram.src.functions import researchFunctions as rf

# -----------------------------------------------------
# Classe: objeto de pesquisas que é central na aplicação
# -----------------------------------------------------
# - Recebe parâmetros importantes
# - Funcao MostrarPesquisa -> printa as informações
# -----------------------------------------------------
class Pesquisa:
    def __init__(self, idPesq, titulo, area, dtCriacao, descricao, universidade, agFomento, valor, dtEntrada, dtSaida):

        self.idPesq = idPesq
        self.titulo = titulo
        self.area = area
        self.dtCriacao = dtCriacao
        self.universidade = universidade
        self.agFomento = agFomento
        self.valor = valor
        self.descricao = descricao
        self.dtEntrada = dtEntrada
        self.dtSaida = dtSaida

    def MostrarPesquisa(self):

        sc.LimparTela()

        print(f"Titulo: {self.titulo}")
        print(f"Area: {self.area}")
        print(f"Data de Criacao: {self.dtCriacao}")
        print(f"Universidade: {self.universidade}")
        if self.agFomento != None:
            print(f"Agência de Fomento: {self.agFomento}")
            print(f"Valor: {self.valor}")
        if self.dtEntrada != None:
            print(f"Data de Entrada: {self.dtEntrada}")
            print(f"Data de Saida: {self.dtSaida}")
        print(f"Descricao: {self.descricao}")
        
        print("--------------------------------------------------")
        print("[0] Voltar")
        opt = input("Selecione uma opção: ")

        if(opt == "0"):
            sc.Menu(self.idPesq)
        else:
            print("Comando inexistente...")
            sc.Esperar(0.5)
            self.MostrarPesquisa()
