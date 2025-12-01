from MainProgram.src.controllers import screenController as sc
from MainProgram.objects import research as res
from MainProgram.src.connections import connection as con
from MainProgram.src.functions import errors
from datetime import datetime
import psycopg2

# -----------------------------------------------------
# LISTA PESQUISAS DA PESSOA LOGADA
# -----------------------------------------------------
# - Faz um SELECT para trazer diversas informações
# - Transforma em uma lista do objeto Pesquisa
# - Passa essa lista para uma função que printa essas pesquisas
# -----------------------------------------------------
def MinhasPesquisas(idPerson):
    
    sc.Header(4)

    try:
        
        connection, cursor = con.GetConnectionAndCursor()

        cursor.execute("""

            SELECT PE.data_ingresso, PE.data_saida, E.TITULO, E.AREA, E.DATA_CRIACAO, P.descricao, U.NOME AS Universidade, A.NOME AS AgenciaFomento, F.VALOR AS ValorFinanciado
            FROM Pesq_Exec PE 
            JOIN Execucao E
                ON pe.ID_Exec = e.ID
            JOIN Universidade u 
                ON e.CNPJ = u.CNPJ
            JOIN pesquisa p 
            	ON E.titulo = P.titulo 
            	and E.area  = P.area 
            	and E.data_criacao = P.data_criacao 
            LEFT JOIN Financia f 
                ON E.titulo  	  = f.Titulo
                AND E.AREA 		  = f.Area
                AND E.data_criacao = f.data_criacao 
            LEFT JOIN Ag_Fomento a
                ON f.CNPJ = a.CNPJ
            WHERE pe.ID_Pesq = %s;
        """, [idPerson])

        result = cursor.fetchall()
        cursor.close()

        pesquisas = [
            res.Pesquisa(
                idPesq = idPerson,
                titulo=row[2],
                area=row[3],
                dtCriacao=row[4],
                descricao=row[5],
                universidade=row[6],
                agFomento=row[7],
                valor=row[8],
                dtEntrada=row[0],
                dtSaida=row[1]
            )

            for row in result
        ]

        sc.ListarPesquisas(pesquisas, idPerson)

    except psycopg2.Error as error:
        connection.rollback()
        print("Erro:", error)

        input("Parece que algo deu errado... Pressione qualquer tecla para sair... ")
        sc.Menu(idPerson)
   
# -----------------------------------------------------
# TELA PARA BUSCAR POR AREA
# -----------------------------------------------------
# - Pega a entrada do usuario da area
# - Faz um select das informações relevantes
# - Monta uma lista de pesquisas com os resultados
    # - Lista todas as pesquisas
# -----------------------------------------------------
def BuscarPorArea(idPerson):

    sc.Header(5)
    area = input("Area: ").upper()

    try:
        connection, cursor = con.GetConnectionAndCursor()
        cursor.execute("""
            SELECT E.TITULO, E.AREA, E.DATA_CRIACAO, P.descricao, U.NOME AS Universidade, A.NOME AS AgenciaFomento, F.VALOR AS ValorFinanciado
FROM EXECUCAO E
JOIN Universidade u 
                ON e.CNPJ = u.CNPJ
            join pesquisa p 
            	on E.titulo = P.titulo 
            	and E.area  = P.area 
            	and E.data_criacao = P.data_criacao 
            left JOIN Financia f 
                on E.titulo  	  = f.Titulo
                AND E.AREA 		  = f.Area
                AND E.data_criacao = f.data_criacao 
            left JOIN Ag_Fomento a
                ON f.CNPJ = a.CNPJ
            WHERE E.AREA = %s;
        """, [area])

        result = cursor.fetchall()
        cursor.close()

        pesquisas = [
            res.Pesquisa(
                idPesq = idPerson,
                titulo=row[0],
                area=row[1],
                dtCriacao=row[2],
                descricao=row[3],
                universidade=row[4],
                agFomento=row[5],
                valor=row[6],
                dtEntrada=None,
                dtSaida=None
            )

            for row in result
        ]

        sc.ListarPesquisas(pesquisas, idPerson)

    except psycopg2.Error as error:
        connection.rollback()
        print("Erro:", error)
        input("Parece que algo deu errado... Pressione qualquer tecla para sair... ")
        sc.Menu(idPerson)
   
# -----------------------------------------------------
# TELA PARA ADICIONAR PESQUISA 
# -----------------------------------------------------
# - Recolhe todos os dados de uma pesquisa
# - Adiciona esses dados com um INSERT
# -----------------------------------------------------
def AdicionarPesquisa(idPerson):

    sc.Header(6)
    
    print("Adicione as seguintes informações:\n")
    print("-------------------------------")

    try:
        
        connection, cursor = con.GetConnectionAndCursor() 

        titulo = input("Titulo: ").upper()
        area = input("Área: ").upper()
        dtCriacao = input("Data de Criação (dd/mm/yyyy): ").strip()
        _dtCriacao = datetime.strptime(dtCriacao, "%d/%m/%Y")
        desc = input("Descrição: ").upper()

        cursor.execute("""
            INSERT INTO PESQUISA (DATA_CRIACAO, TITULO, AREA, DESCRICAO)
            VALUES (TO_DATE(%s, 'DD/MM/YYYY'), %s, %s, %s)
        """, [dtCriacao, titulo, area, desc])

        print("-------------------------------")

        universidade = input("CNPJ da Universidade: ") or None

        if(universidade == None):
            print("ERRO: você não pode deixar o campo universidade vazio...")
            input("Pressione qualquer tecla para voltar")
            sc.Menu(idPerson)

        dtInicio = input("Data de Inicio da Execução (dd/mm/yyyy): ")

        if (datetime.strptime(dtCriacao, "%d/%m/%Y") > datetime.strptime(dtInicio, "%d/%m/%Y")):
            raise errors.DateError("A data de inicio da execução não deve ser antes da data de criação da pesquisa...")

        dtConclusao = input("Data de Conclusão da Execução (dd/mm/yyyy): ")
        cursor.execute("""
            INSERT INTO EXECUCAO (DATA_CRIACAO, TITULO, AREA, CNPJ, DATA_INICIO, DATA_CONCLUSAO) 
            VALUES (TO_DATE(%s, 'DD/MM/YYYY'), %s, %s, %s, TO_DATE(%s, 'DD/MM/YYYY'), TO_DATE(%s, 'DD/MM/YYYY'))
            RETURNING ID;
        """, [dtCriacao, titulo, area, universidade, dtInicio, dtConclusao])
        idExec = cursor.fetchone()[0]

    
        print("-------------------------------")

        qtdePesq = int(input("Quantos pesquisadores irão participar: "))

        while(qtdePesq != 0):
            idPesq = input("ID pesquisador: ")
            dtIngresso = input ("Data de Inicio do pesquisador (dd/mm/yyyy): ")

            if (datetime.strptime(dtIngresso, "%d/%m/%Y") < datetime.strptime(dtInicio, "%d/%m/%Y")):
                raise errors.DateError("A data de ingresso de um pesquisador deve ser depois da data de inicio da pesquisa...")

            dtSaida = input("Data de Conclusao do pesquisador (dd/mm/yyyy): ")


            if (datetime.strptime(dtSaida, "%d/%m/%Y") > datetime.strptime(dtConclusao, "%d/%m/%Y")):
                raise errors.DateError("A data de saida do pesquisador deve ser antes do que a data de conclusao da pesquisa...")

            cursor.execute("""
                INSERT INTO PESQ_EXEC (ID_PESQ, ID_EXEC, DATA_INGRESSO, DATA_SAIDA)
                VALUES (%s, %s, TO_DATE(%s, 'DD/MM/YYYY'), TO_DATE(%s, 'DD/MM/YYYY'));
            """, [idPesq, idExec, dtIngresso, dtSaida])

            qtdePesq = qtdePesq - 1

        print("-------------------------------")
    
        financiamento = input("Será financiado? [s/n]: ")
        if financiamento == "s":
            agFomento = input("CNPJ da Ag. de Fomento: ")
            valor = input("Valor do Financiamento: ")

            cursor.execute("""
                INSERT INTO FINANCIA (CNPJ, DATA_CRIACAO, TITULO, AREA, VALOR)
                VALUES (%s, TO_DATE(%s, 'DD/MM/YYYY'), %s, %s, %s);
            """, [agFomento, dtCriacao, titulo, area, valor])
        
        connection.commit()
        cursor.close()
        print("Todos os valores foram adicionados ao banco de dados...")
        sc.Esperar(1.5)
        sc.Menu(idPerson)

    except psycopg2.Error as error:
        connection.rollback()
        print("Erro:", error)
        input("Parece que algo deu errado... Pressione qualquer tecla para sair... ")
        sc.Menu(idPerson)

    except errors.DateError as e:
        connection.rollback()
        print("Erro: ", e)
        input("Pressione qualquer tecla para voltar... ")
        sc.Menu(idPerson)
   

