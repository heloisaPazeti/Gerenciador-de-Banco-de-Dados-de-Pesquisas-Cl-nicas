from MainProgram.src.controllers import screenController as sc

def ListarPesquisas(listaPesquisas):
    
    for i in range(len(listaPesquisas)):
        print(f"[{i+1}] - {listaPesquisas[i].titulo}")

    opt = input("\n Selecione para ver detalhes: ")
    if(opt == "0"):
        sc.Menu()
        return True
    
    index = int(opt)-1
    if(index in range(len(listaPesquisas))):
        result = listaPesquisas[index].MostrarPesquisa()
        if(result): 
            return True
    else:
        print("Parece que isso não é uma opção... Tente novamente...")
        sc.Esperar(1.5)
        return False
