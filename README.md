# Gerenciador de Pesquisas Clínicas
Gerenciador de Banco de Dados de Pesquisas Clínicas - SCC0640 - Base de Dados

## Sobre

Trabalho para matéria de banco de dados de um sistema de saúde sobre pesquisas clínicas. 

## Contém

### Ferramentas Utilizadas

- Python -> desenvolvimento do programa
- PostegreSQL -> SGBD escolhido, utilizado localmente
- Dbeaver -> ferramenta de gerenciamento de base de dados

### Relatório

Relatório de todo o desenvolvimento do sistema. Dentro poderá ser encontrado:
- Idealização do programa e das funções.
- MER
- Modelo Relacional
- Projeto em SQL + Python

### Main Program

Programa utilizável com as seguintes pastas:
```
./
├── MainProgram/
│   ├── __init__.py
│   ├── main.py
│   ├── objects/
│   │   ├── __init__.py
│   │   └── research.py
│   ├── sql/
│   │   ├── create_tables.sql
│   │   ├── inserts.sql
│   │   └── selects.sql
│   └── src/
│       ├── __init__.py
│       ├── connections/
│       │   ├── __init__.py
│       │   └── connection.py
│       ├── controllers/
│       │   ├── __init__.py
│       │   └── screenController.py
│       ├── functions/
│       │   ├── __init__.py
│       │   ├── commonFunctions.py
│       │   └── researchFunctions.py
│       └── screens/
│           ├── __init__.py
│           ├── loginAndRegister.py
│           ├── menu.py
│           ├── menuOptions.py
│           └── start.py
├── TrabalhoBD.pdf
└── README.md
```
## Rodando o Programa

### Windows
Após clonar o repositório, dentro de um terminal, vá até a pasta clonada Trabalho-BD e rode o comando python3 -m MainProgram.main. Isso fará o programa se iniciar.

### Arch Linux

Possivelmente será necessário o uso de um ambiente virtual devido aos pacotes python. Nesse caso, para inicializar o programa é necessário, novamente, estar dentro de TrabalhoBD, porém utilizar o python desse ambiente, utilizando os comandos:

``` bash
    python -m venv venv
    source venv/bin/activate
    pip install psycopg2-binary
    ~/venv/bin/python -m MainProgram.main
```
