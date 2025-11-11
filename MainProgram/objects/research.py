from MainProgram.src.functions import commonFunctions as cf

class Pesquisa:
    def __init__(self, titulo, area, dtCriacao, universidade, agFomento, pesqResponsa, pesqs, descricao):

        self.titulo = titulo
        self.area = area
        self.dtCriacao = dtCriacao
        self.universidade = universidade
        self.agFomento = agFomento
        self.pesqResponsa = pesqResponsa
        self.pesqs = pesqs
        self.descricao = descricao

    def MostrarPesquisa(self):

        cf.LimparTela()

        print(f"Titulo: {self.titulo}")
        print(f"Area: {self.area}")
        print(f"Data de Criacao: {self.dtCriacao}")
        print(f"Universidade: {self.universidade}")
        print(f"Agência de Fomento: {self.agFomento}")
        print(f"Pesquisador Responsavel: {self.pesqResponsa}")
        print(f"Pesquisador(es): {self.pesqs}")
        print(f"Descricao: {self.descricao}")
        
        input("\n Pressione qualquer tecla para voltar...")
        return True 
