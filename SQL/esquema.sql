---------------------------------------------------------------------------
-- Tabela Pessoa 
---------------------------------------------------------------------------
-- ID -> para manter os dados sensíveis das pessoas seguros - LGPD.
-- CPF -> tem 14 espaços, pois checa-se se está no formato xxx.xxx.xxx-xx
-- UF -> espera-se apenas a sigla do estado, como mostrado na constraint
-- Senha -> quaisquer caraceteres.
-- Telefones -> checamos se são diferentes um do outro.
--------------------------------------------------------------------------
CREATE TABLE PESSOA (
    ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    CPF CHAR(14) NOT NULL,
    NOME VARCHAR(100) NOT NULL,
    UF CHAR(2),
    CIDADE VARCHAR(50),
    BAIRRO VARCHAR(50),
    RUA VARCHAR(50),
    NUMERO INTEGER,
    TELEFONE1 VARCHAR(12) NOT NULL,
    TELEFONE2 VARCHAR(12),
    DATA_NASC DATE NOT NULL,
    SENHA VARCHAR(50),

    CONSTRAINT PK_PESSOA PRIMARY KEY (ID),
    CONSTRAINT SK_PESSOA UNIQUE(CPF),
    CONSTRAINT CHECK_UF_PESSOA CHECK(UF IN ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO')),
    constraint CHECK_CPF CHECK (CPF ~ '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$'),
	constraint CHECK_TELEFONE_PESSOA check (TELEFONE1 != TELEFONE2)
);

--------------------------------------------------------------------------
-- Tabela Funcoes
--------------------------------------------------------------------------
-- ID -> id de uma pessoa ligada a sua função
-- Funcao -> uma pessoa pode ter mais de uma função.
--------------------------------------------------------------------------
create table FUNCOES (
	ID INTEGER not null,
	FUNCAO VARCHAR(20) not NULL,
	
	constraint PK_FUNCOES primary key (ID, FUNCAO),
	constraint FK_FUNCOES foreign key (ID) references PESSOA (ID) on delete CASCADE,
	constraint CHECK_FUNCAO check (FUNCAO in ('PESQUISADOR', 'ENFERMEIRO', 'MEDICO', 'PACIENTE'))
);

--------------------------------------------------------------------------
-- Tabela Enfermeiro
-----------------------------------------------------------------------
-- ID -> se relaciona a uma pessoa
-- COREN -> segue o formato UF XXXXXXXXX
-----------------------------------------------------------------------
CREATE TABLE ENFERMEIRO (
    ID INTEGER NOT NULL,
    COREN CHAR(12) NOT NULL,

    CONSTRAINT PK_ENFERMEIRO PRIMARY KEY (ID),
    CONSTRAINT FK_ENFERMEIRO FOREIGN KEY (ID) REFERENCES PESSOA(ID)  ON DELETE CASCADE,
    CONSTRAINT SK_ENFERMEIRO UNIQUE (COREN),
    CONSTRAINT CHECK_COREN CHECK(REGEXP_LIKE(COREN, '^(?:AC|AL|AP|AM|BA|CE|DF|ES|GO|MA|MT|MS|MG|PA|PB|PR|PE|PI|RJ|RN|RS|RO|RR|SC|SP|SE|TO) \d{9}$'))
);


-----------------------------------------------------------------------
-- Tabela Paciente
-----------------------------------------------------------------------
-- ID -> se relaciona a uma pessoa
-----------------------------------------------------------------------
CREATE TABLE PACIENTE (
    ID INTEGER NOT NULL,

    CONSTRAINT PK_PACIENTE PRIMARY KEY (ID),
    CONSTRAINT FK_PACIENTE FOREIGN KEY (ID) REFERENCES PESSOA(ID)  ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Doenca
-----------------------------------------------------------------------
-- ID -> referencia um paciente
-- Doenca -> nome ou descrição do que o paciente tem.
-----------------------------------------------------------------------
create table DOENCA (
	ID INTEGER not null,
	DOENCA VARCHAR(50),
	CONSTRAINT PK_DOENCA PRIMARY KEY (ID, DOENCA),
    CONSTRAINT FK_DOENCA FOREIGN KEY (ID) REFERENCES PACIENTE(ID)  ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Medico
-----------------------------------------------------------------------
-- ID -> se relaciona a uma pessoa 
-- CRM -> segue o formato XXXXX UF
-----------------------------------------------------------------------
CREATE TABLE MEDICO (
    ID INTEGER NOT NULL,
    CRM CHAR(12) NOT NULL,

    CONSTRAINT PK_MEDICO PRIMARY KEY (ID),
    CONSTRAINT FK_MEDICO FOREIGN KEY (ID) REFERENCES PESSOA(ID)  ON DELETE CASCADE,
    CONSTRAINT SK_MEDICO UNIQUE (CRM),
    CONSTRAINT CHECK_CRM CHECK(REGEXP_LIKE(CRM, '^\d{1,6} (?:AC|AL|AP|AM|BA|CE|DF|ES|GO|MA|MT|MS|MG|PA|PB|PR|PE|PI|RJ|RN|RS|RO|RR|SC|SP|SE|TO)$'))
);

-----------------------------------------------------------------------
-- Tabela Pesquisador
-----------------------------------------------------------------------
-- ID -> se relaciona a uma pessoa
-- Funcao -> existem duas opções: pesquisador responsavel ou
--           ou comum
-----------------------------------------------------------------------
CREATE TABLE PESQUISADOR (
    ID INTEGER NOT NULL,
    FUNCAO VARCHAR(24),

    CONSTRAINT PK_PESQUISADOR PRIMARY KEY (ID),
    CONSTRAINT FK_PESQUISADOR FOREIGN KEY (ID) REFERENCES PESSOA(ID)  ON DELETE cascade,
    CONSTRAINT CHECK_FUNCAO_PESQUISADOR check(FUNCAO in ('PESQUISADOR_COMUM', 'PESQUISADOR_RESPONSAVEL')) 
);

-----------------------------------------------------------------------
-- Tabela Pesquisador Responsável
-----------------------------------------------------------------------
-- ID -> se relaciona a um pesquisador
-----------------------------------------------------------------------
CREATE TABLE PESQUISADOR_RESPONSAVEL (
    ID INTEGER NOT NULL,

    CONSTRAINT PK_PESQUISADOR_RESPONSAVEL PRIMARY KEY (ID),
    CONSTRAINT FK_PESQUISADOR_RESPONSAVEL FOREIGN KEY (ID) REFERENCES PESSOA(ID)  ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Pesquisador Comum
-----------------------------------------------------------------------
-- ID -> se relaciona a um pesquisador
-----------------------------------------------------------------------
CREATE TABLE PESQUISADOR_COMUM (
    ID INTEGER NOT NULL,

    CONSTRAINT PK_PESQUISADOR_COMUM PRIMARY KEY (ID),
    CONSTRAINT FK_PESQUISADOR_COMUM FOREIGN KEY (ID) REFERENCES PESSOA(ID)  ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Estabelecimento de Saude
-----------------------------------------------------------------------
-- ID -> auto gerado para os tipos de estabelecimentos -> LGPD.
-- CNES -> segue o formato de 7 dígitos numéricos
-- Telefones -> verifica-se se são diferentes
-- Funcao -> pode ser um hospital/clinica ou um laboratorio externo.
-----------------------------------------------------------------------
CREATE TABLE ESTAB_SAUDE (
    ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    CNES CHAR(7) NOT NULL,
    NOME VARCHAR(50),
    UF CHAR(2),
    CIDADE VARCHAR(50),
    BAIRRO VARCHAR(50),
    RUA VARCHAR(50),
    NUMERO INTEGER,
    TELEFONE1 VARCHAR(11) NOT NULL,
    TELEFONE2 VARCHAR(11),
    FUNCAO VARCHAR(40),

    CONSTRAINT PK_ESTAB_SAUDE PRIMARY KEY (ID),
    CONSTRAINT SK_ESTAB_SAUDE UNIQUE (CNES),
    CONSTRAINT CHECK_CNES CHECK(REGEXP_LIKE(CNES, '^\d{7}$')),
    CONSTRAINT CHECK_UF_ESTAB_SAUDE CHECK(UF IN ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO')),
	CONSTRAINT CHECK_FUNCAO_ESTBSAUDE check (FUNCAO in ('HOSPITAL/CLINICA', 'LAB_EXT')),
	constraint CHECK_TELEFONE_ESTAB_SAUDE check (TELEFONE1 != TELEFONE2)
);

-----------------------------------------------------------------------
-- Tabela Hospital / Clinica
-----------------------------------------------------------------------
-- ID -> especifico de um estabelecimento de saude
-----------------------------------------------------------------------
CREATE TABLE HOSPITAL_CLINICA (
    ID INTEGER NOT NULL,

    CONSTRAINT PK_HOSPITAL_CLINICA PRIMARY KEY (ID),
    CONSTRAINT FK_HOSPITAL_CLINICA FOREIGN KEY (ID) REFERENCES ESTAB_SAUDE(ID)  ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Laboratorio Externo
-----------------------------------------------------------------------
-- ID -> especifico de um estabelecimento de saude 
-----------------------------------------------------------------------
CREATE TABLE LAB_EXT (
    ID INTEGER NOT NULL,

    CONSTRAINT PK_LAB_EXT PRIMARY KEY (ID),
    CONSTRAINT FK_LAB_EXT FOREIGN KEY (ID) REFERENCES ESTAB_SAUDE(ID)  ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Solicitar dados
-----------------------------------------------------------------------
-- ID -> id de um hospital ou clinica especifica
-- ID_PESQ -> id de um pesquisador responsável
-- Situacao -> a situação do pedido pode ser aprovado, pendente 
--             ou reprovado
-----------------------------------------------------------------------
CREATE TABLE SOLICITA_DADOS (
    ID_HOSP INTEGER NOT NULL,
    ID_PESQ INTEGER NOT NULL,
    SITUACAO VARCHAR(30) NOT NULL,
    DESCRICAO VARCHAR(100) NOT NULL,

    CONSTRAINT PK_SOLICITA_DADOS PRIMARY KEY (ID_HOSP, ID_PESQ),
    CONSTRAINT FK1_SOLICITA_DADOS FOREIGN KEY (ID_HOSP) REFERENCES HOSPITAL_CLINICA(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_SOLICITA_DADOS FOREIGN KEY (ID_PESQ) REFERENCES PESQUISADOR_RESPONSAVEL(ID) ON DELETE cascade,
    constraint CHECK_SITUACAO CHECK(SITUACAO in ('APROVADO', 'PENDENTE', 'REPROVADO'))
);

-----------------------------------------------------------------------
-- Tabela Medico e Hospital
-----------------------------------------------------------------------
-- ID_MED -> id do medico que atua no hospital ou clinica
-- ID_HOSP -> id do hospital / clinica em que o medico trabalha
-----------------------------------------------------------------------
CREATE TABLE MED_HOSP (
    ID_MED INTEGER NOT NULL,
    ID_HOSP INTEGER NOT NULL,

    CONSTRAINT PK_MED_HOSP PRIMARY KEY (ID_MED, ID_HOSP),
    CONSTRAINT FK1_MED_HOSP FOREIGN KEY (ID_MED) REFERENCES MEDICO(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_MED_HOSP FOREIGN KEY (ID_HOSP) REFERENCES HOSPITAL_CLINICA(ID) ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Universidade
-----------------------------------------------------------------------
-- CNPJ -> segue o formato XXXXXXXX/XXXX-XX
-- UF -> checa se é a sigla de um estado real
-----------------------------------------------------------------------
CREATE TABLE UNIVERSIDADE (
    CNPJ CHAR(16) NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    CAMPUS VARCHAR(50),
    UF CHAR(2),
    CIDADE VARCHAR(50),
    BAIRRO VARCHAR(50),
    NUMERO INTEGER,

    CONSTRAINT PK_UNIVERSIDADE PRIMARY KEY (CNPJ),
    CONSTRAINT CHECK_CNPJ_UNIVERSIDADE CHECK(REGEXP_LIKE(CNPJ, '^\d{8}\/\d{4}-\d{2}$')),
    CONSTRAINT CHECK_UF_UNIVERSIDADE CHECK(UF IN ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'))
);

-----------------------------------------------------------------------
-- Tabela Pesquisa
-----------------------------------------------------------------------
-- É checado se a data de criação da pesquisa é menor ou igual que
-- a data atual

-- Area -> area de desenvolvimento da pesquisa, ex: (ciências, exatas, ...)
-- Descricao -> breve descricao da pesquisa
-----------------------------------------------------------------------
CREATE TABLE PESQUISA (
    DATA_CRIACAO DATE NOT NULL,
    TITULO VARCHAR(100) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
    DESCRICAO VARCHAR(200) NOT NULL,

    CONSTRAINT PK_PESQUISA PRIMARY KEY (DATA_CRIACAO, TITULO, AREA),
    CONSTRAINT CHECK_DATA_CRIACAO CHECK (DATA_CRIACAO <= CURRENT_DATE)
);

-----------------------------------------------------------------------
-- Tabela Execucao
-----------------------------------------------------------------------
-- ID -> id auto gerado para uma execucao -> facilitar referenciação
-- Data_Criacao, titulo, area -> vem de pesquisa
-- CNPJ -> vem de universidade
-- É certificado que a data de inicio < data de conclusao
-----------------------------------------------------------------------
CREATE TABLE EXECUCAO (
    ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    DATA_CRIACAO DATE NOT NULL,
    TITULO VARCHAR(100) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
    CNPJ CHAR(16) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    DATA_CONCLUSAO DATE,

    CONSTRAINT PK_EXECUCAO PRIMARY KEY (ID),
    CONSTRAINT SK_EXECUCAO UNIQUE (DATA_CRIACAO, TITULO, AREA, CNPJ, DATA_INICIO),
    CONSTRAINT FK1_EXECUCAO FOREIGN KEY (DATA_CRIACAO, TITULO, AREA) REFERENCES PESQUISA(DATA_CRIACAO, TITULO, AREA) ON DELETE CASCADE,
    CONSTRAINT FK2_EXECUCAO FOREIGN KEY (CNPJ) REFERENCES UNIVERSIDADE(CNPJ) ON DELETE CASCADE,
    CONSTRAINT CHECK_DATA_EXECUCAO CHECK(DATA_INICIO-DATA_CONCLUSAO<0)
);

-----------------------------------------------------------------------
-- Tabela Pesquisa Execucao
-----------------------------------------------------------------------
-- ID_PESQ -> id do pesquisador comum relacionada a pesquisa
-- ID_EXEC -> id da execucao relacionada
-- Certifica que a data de ingresso do pesquisador < data de conclusao
-----------------------------------------------------------------------
CREATE TABLE PESQ_EXEC (
    ID_PESQ INTEGER NOT NULL,
    ID_EXEC INTEGER NOT NULL,
    DATA_INGRESSO DATE NOT NULL,
    DATA_SAIDA DATE,

    CONSTRAINT PK_PESQ_EXEC PRIMARY KEY (ID_PESQ, ID_EXEC),
    CONSTRAINT FK1_PESQ_EXEC FOREIGN KEY (ID_PESQ) REFERENCES PESQUISADOR(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_PESQ_EXEC FOREIGN KEY (ID_EXEC) REFERENCES EXECUCAO(ID) ON DELETE CASCADE,
    CONSTRAINT CHECK_DATA_PESQ_EXEC CHECK(DATA_INGRESSO-DATA_SAIDA<0)
);

-----------------------------------------------------------------------
-- Tabela Agencia de Fomento
-----------------------------------------------------------------------
-- CNPJ -> segue o formato XXXXXXXX/XXXX-XX
-- Abrangencia -> pode ter os valores nacional, regional ou internacional
-- Publica -> valor 'boleano' de sim (S) ou não (N)
-----------------------------------------------------------------------
CREATE TABLE AG_FOMENTO (
    CNPJ CHAR(16) NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    ABRANGENCIA VARCHAR(20),
    PUBLICA CHAR(1),

    CONSTRAINT PK_AG_FOMENTO PRIMARY KEY (CNPJ),
    CONSTRAINT CHECK_CNPJ_AG_FOMENTO CHECK(REGEXP_LIKE(CNPJ, '^\d{8}\/\d{4}-\d{2}$')),
    CONSTRAINT CHECK_PUBLICA CHECK(UPPER(PUBLICA) IN ('S', 'N')),
    constraint CHECK_ABRANGENCIA check (ABRANGENCIA in ('NACIONAL', 'REGIONAL', 'INTERNACIONAL'))
);

-----------------------------------------------------------------------
-- Tabela Financia
-----------------------------------------------------------------------
-- CNPJ -> identificador da agencia de fomento
-- Data_Criacao, titulo, area -> são chaves primárias de pesquisa
-- Valor -> número decimal referente ao dinheiro do financiamento
-----------------------------------------------------------------------
CREATE TABLE FINANCIA (
    CNPJ CHAR(16) NOT NULL,
    DATA_CRIACAO DATE NOT NULL,
    TITULO VARCHAR(100) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
    VALOR DECIMAL NOT NULL,

    CONSTRAINT PK_FINANCIA PRIMARY KEY (CNPJ, DATA_CRIACAO, TITULO, AREA),
    CONSTRAINT FK_FINANCIA FOREIGN KEY (DATA_CRIACAO, TITULO, AREA) REFERENCES PESQUISA(DATA_CRIACAO, TITULO, AREA) ON DELETE cascade,
	constraint FK_FINANCIA_AGFOMENTO foreign key (CNPJ) references AG_FOMENTO (CNPJ)
);

-----------------------------------------------------------------------
-- Tabela Medico Execucao
-----------------------------------------------------------------------
-- ID_MED -> id do medico que auxilia na execucao
-- ID_EXEC -> id da execucao relacionada
-----------------------------------------------------------------------
CREATE TABLE MED_EXEC (
    ID_MED INTEGER NOT NULL,
    ID_EXEC INTEGER NOT NULL,

    CONSTRAINT PK_MED_EXEC PRIMARY KEY (ID_MED, ID_EXEC),
    CONSTRAINT FK1_MED_EXEC FOREIGN KEY (ID_MED) REFERENCES MEDICO(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_MED_EXEC FOREIGN KEY (ID_EXEC) REFERENCES EXECUCAO(ID) ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Tipo de Coleta
-----------------------------------------------------------------------
-- Categoria: alguns exemplos são, sangue, saliva, urina, etc...
-- Periculosidade: perigo que paciente passa por ter sido feita a coleta
-----------------------------------------------------------------------
CREATE TABLE TIPO_COLETA (
    CATEGORIA VARCHAR(30) NOT NULL,
    PERICULOSIDADE CHAR(5),

    CONSTRAINT PK_TIPO_COLETA PRIMARY KEY (CATEGORIA),
    CONSTRAINT CHECK_PERICULOSIDADE_COLETA CHECK(UPPER(PERICULOSIDADE) IN ('ALTA', 'MEDIA', 'BAIXA'))
);

-----------------------------------------------------------------------
-- Tabela Amostra
-----------------------------------------------------------------------
-- ID -> integer autogerado -> facilitar referenciação
-- Categoria -> alguns exemplos esperados são sangue, saliva, ...
-- ID_PAC -> id do paciente do qual vem a amostra
-- Estado -> pode ser conservado, alterado, ruim
-- ID_Enfermeiro -> identificador do enfermeiro que coletou amostra
-----------------------------------------------------------------------
CREATE TABLE AMOSTRA (
    ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    DATA_COLETA DATE NOT NULL,
    ID_PAC INTEGER NOT NULL,
    VALIDADE DATE,
    INFO VARCHAR(100),
    ESTADO VARCHAR(10),
    QTDE INTEGER,
    ID_ENF INTEGER NOT NULL,

    CONSTRAINT PK_AMOSTRA PRIMARY KEY (ID),
    CONSTRAINT SK_AMOSTRA UNIQUE (CATEGORIA, DATA_COLETA, ID_PAC),
    CONSTRAINT FK1_AMOSTRA FOREIGN KEY (CATEGORIA) REFERENCES TIPO_COLETA(CATEGORIA) ON DELETE CASCADE,
    CONSTRAINT FK2_AMOSTRA FOREIGN KEY (ID_PAC) REFERENCES PACIENTE(ID) ON DELETE CASCADE,
    CONSTRAINT FK3_AMOSTRA FOREIGN KEY (ID_ENF) REFERENCES ENFERMEIRO(ID) ON DELETE SET null,
    constraint CHECK_DATA_VALIDADE check (VALIDADE <= CURRENT_DATE),
    constraint CHECK_ESTADO CHECK (UPPER(ESTADO) IN ('CONSERVADO', 'ALTERADO', 'RUIM'))
);

-----------------------------------------------------------------------
-- Tabela de Dados das amostras
-----------------------------------------------------------------------
-- ID -> id autogerado para cada dado -> facilitar referenciação
-- ID_ESTAB -> identificador do estabelecimento ao qual pertence a amostra
-- ID_AMOSTRA -> id da amostra
-- Dados -> quaisquers informações sobre a situação da amostra,
--          de onde vem, etc
-----------------------------------------------------------------------
CREATE TABLE DADOS_AMOSTRA (
    ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    ID_ESTAB INTEGER NOT NULL,
    DATA_PROC DATE NOT NULL,
    ID_AMOSTRA INTEGER NOT NULL,
    DADOS VARCHAR(100) NOT NULL,

    CONSTRAINT PK_DADOS_AMOSTRA PRIMARY KEY (ID),
    CONSTRAINT SK_DADOS_AMOSTRA UNIQUE (ID_ESTAB, DATA_PROC, ID_AMOSTRA, DADOS),
    CONSTRAINT FK1_DADOS_AMOSTRA FOREIGN KEY (ID_ESTAB) REFERENCES ESTAB_SAUDE(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_DADOS_AMOSTRA FOREIGN KEY (ID_AMOSTRA) REFERENCES AMOSTRA(ID) ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Disponibilização
-----------------------------------------------------------------------
-- ID_EXEC -> idenfiticador da execucao relacionada
-- ID_DADOS -> identificados dos dados de uma amostra
-- Certifica-se que a data de entrega < data de devolução
-----------------------------------------------------------------------
CREATE TABLE DISPONIBILIZACAO (
    ID_EXEC INTEGER NOT NULL,
    ID_DADOS INTEGER NOT NULL,
    DATA_ENTREGA DATE NOT NULL,
    DATA_DEVOL DATE ,

    CONSTRAINT PK_DISPONIBILIZACAO PRIMARY KEY (ID_EXEC, ID_DADOS, DATA_ENTREGA),
    CONSTRAINT FK1_DISPONIBILIZACAO FOREIGN KEY (ID_DADOS) REFERENCES DADOS_AMOSTRA(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_DISPONIBILIZACAO FOREIGN KEY (ID_EXEC) REFERENCES EXECUCAO(ID) ON DELETE CASCADE,
    CONSTRAINT CHECK_DATA_DISPONIBILIZACAO CHECK(DATA_ENTREGA-DATA_DEVOL<0)
);

-----------------------------------------------------------------------
-- Tabela Execucao Disponibiliza Amostra
-----------------------------------------------------------------------
-- ID_Amostra -> identificador da amostra disponibilizada
-- ID_EXEC -> identificador da execucao correspondente
-- Confere-se se a data de entrega < data de devolução
-----------------------------------------------------------------------
CREATE TABLE EXEC_DISP_AMOSTRA (
    ID_AMOSTRA INTEGER NOT NULL,
    ID_EXEC INTEGER NOT NULL,
    DATA_ENTREGA DATE NOT NULL,
    DATA_DEVOL DATE,

    CONSTRAINT PK_EXEC_DISP_AMOSTRA PRIMARY KEY(ID_AMOSTRA, ID_EXEC, DATA_ENTREGA),
    CONSTRAINT FK1_EXEC_DISP_AMOSTRA FOREIGN KEY (ID_AMOSTRA) REFERENCES AMOSTRA(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_EXEC_DISP_AMOSTRA FOREIGN KEY (ID_EXEC) REFERENCES EXECUCAO(ID) ON DELETE CASCADE,
    CONSTRAINT CHECK_DATA_EXEC_DISP_AMOSTRA CHECK(DATA_ENTREGA-DATA_DEVOL<0)
);

-----------------------------------------------------------------------
-- Tabela Tipo Exame
-----------------------------------------------------------------------
-- Categoria -> alguns exemplos são: hemograma, pcr, etc...
-- Periculosidade -> pode ser alta, baixa ou media
-----------------------------------------------------------------------
CREATE TABLE TIPO_EXAME (
    CATEGORIA VARCHAR(30) NOT NULL,
    PERICULOSIDADE CHAR(5),

    CONSTRAINT PK_TIPO_EXAME PRIMARY KEY (CATEGORIA),
    CONSTRAINT CHECK_PERICULOSIDADE_EXAME CHECK(UPPER(PERICULOSIDADE) IN ('ALTA', 'MEDIA', 'BAIXA'))
);

-----------------------------------------------------------------------
-- Tabela Exame
-----------------------------------------------------------------------
-- ID -> identificador autogerado -> facilita referenciação
-- Categoria -> vem de Tipo Exame
-- ID_Paciente -> id do paciente em quem foi feito o exame
-- ID_MED -> id do medico que fez o exame
-- Resultado -> do resultado espera-se algo como 'normal', 'negativo', ...
-----------------------------------------------------------------------
CREATE TABLE EXAME (
    ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    DATA_PROC DATE NOT NULL,
    ID_PAC INTEGER NOT NULL,
    RESULTADO VARCHAR(30),
    ID_MED INTEGER NOT NULL,

    CONSTRAINT PK_EXAME PRIMARY KEY (ID),
    CONSTRAINT SK_EXAME UNIQUE(CATEGORIA, DATA_PROC, ID_PAC),
    CONSTRAINT FK1_EXAME FOREIGN KEY (CATEGORIA) REFERENCES TIPO_EXAME(CATEGORIA) ON DELETE CASCADE,
    CONSTRAINT FK2_EXAME FOREIGN KEY (ID_PAC) REFERENCES PACIENTE(ID) ON DELETE CASCADE,
    CONSTRAINT FK3_EXAME FOREIGN KEY (ID_MED) REFERENCES MEDICO(ID) ON DELETE CASCADE
);

-----------------------------------------------------------------------
-- Tabela Execucao Disponibiliza Exame
-----------------------------------------------------------------------
-- ID_EXAME -> identificador do exame
-- ID_EXEC  -> identificador da execucao
-- Checa-se se a data de entrega < data de devolucao
-----------------------------------------------------------------------
CREATE TABLE EXEC_DISP_EXAME (
    ID_EXAME INTEGER NOT NULL,
    ID_EXEC INTEGER NOT NULL,
    DATA_ENTREGA DATE NOT NULL,
    DATA_DEVOL DATE ,

    CONSTRAINT PK_EXEC_DISP_EXAME PRIMARY KEY (ID_EXAME, ID_EXEC, DATA_ENTREGA),
    CONSTRAINT FK1_EXEC_DISP_EXAME FOREIGN KEY (ID_EXAME) REFERENCES EXAME(ID) ON DELETE CASCADE,
    CONSTRAINT FK2_EXEC_DISP_EXAME FOREIGN KEY (ID_EXEC) REFERENCES EXECUCAO(ID) ON DELETE CASCADE,
    CONSTRAINT CHECK_DATA_EXEC_DISP_EXAME CHECK(DATA_ENTREGA-DATA_DEVOL<0)
);

commit
