def MinhasPesquisas():
    
    # Pesquisar na tabela todas as pesquisas que estão relacioandas a Pessoa
    # Eu imagino que vai voltar uns objetos - que tem que criar - numa lista
    # E a ideia seria a printar tudo em order:
        # [1] - Titulo 1
        # [2] - Titulo 2
        # ...
        # [index n] - Titulo n
    # E a pessoa poder escolher uma dessas pra ver detalhes
    # Ai abre uma outra tela com os detalhes da pesquisa
   
    print("[0] Voltar")
    opt = input("\n Selecione uma opcao: ")


    if(opt == "0"):
        return True

def DetalhesPesquisa(pesquisa):

    # Aqui vai ser uma telinha pra descrever a pesquisa
    # Header
    # Todos os detalhes da pesquisa

    # Titulo
    # Area
    # Dt. Criação
    # Descrição
    # Universidade
    # Pesquisador Responsa
    # Pesquisadores 

    opt = input("\n Pressione qualquer tecla para sair...")
    return True


