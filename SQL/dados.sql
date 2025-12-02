-----------------------------------------------------------------------
--- INSERTS NA TABELA PESSOA
-----------------------------------------------------------------------
INSERT INTO pessoa (cpf, nome, uf, cidade, bairro, rua, numero, telefone1, telefone2, data_nasc, senha) VALUES
('123.456.789-01', 'Ana Silva', 'SP', 'São Paulo', 'Centro', 'Rua A', '100', '11987654321', NULL, '1990-05-12', 'senha123'),
('234.567.890-12', 'Bruno Santos', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Rua B', '200', '21998765432', '21912345678', '1988-11-03', 'abc123'),
('345.678.901-23', 'Carla Ferreira', 'MG', 'Belo Horizonte', 'Savassi', 'Rua C', '150', '31987651234', NULL, '1995-02-20', 'pass001'),
('456.789.012-34', 'Daniel Oliveira', 'RS', 'Porto Alegre', 'Moinhos', 'Rua D', '300', '51992341234', NULL, '1983-07-18', 'senha321'),
('567.890.123-45', 'Eduarda Costa', 'SC', 'Florianópolis', 'Trindade', 'Rua E', '50', '48991234567', '48999887766', '1999-10-10', 'minhasenha'),
('678.901.234-56', 'Felipe Rocha', 'PR', 'Curitiba', 'Centro', 'Rua F', '90', '41988776655', NULL, '1992-03-08', 'teste123'),
('789.012.345-67', 'Gabriela Lima', 'BA', 'Salvador', 'Barra', 'Rua G', '77', '71987654321', NULL, '1987-01-14', 'senha456'),
('890.123.456-78', 'Henrique Castro', 'PE', 'Recife', 'Boa Viagem', 'Rua H', '300', '81991234567', '81991112222', '1994-06-25', 'pass777'),
('901.234.567-89', 'Isabela Souza', 'CE', 'Fortaleza', 'Meireles', 'Rua I', '122', '85992341234', NULL, '1990-08-30', 'key123'),
('012.345.678-90', 'João Mendes', 'PA', 'Belém', 'Nazaré', 'Rua J', '210', '91999887766', NULL, '1985-12-05', 'senhaabc'),
('111.222.333-44', 'Karen Pereira', 'GO', 'Goiânia', 'Setor Oeste', 'Rua K', '88', '62998776655', NULL, '1993-09-15', 'teste789'),
('222.333.444-55', 'Leonardo Braga', 'MT', 'Cuiabá', 'Centro Sul', 'Rua L', '65', '65991234567', NULL, '1988-04-02', 'login123'),
('333.444.555-66', 'Mariana Duarte', 'MS', 'Campo Grande', 'Vilas Boas', 'Rua M', '132', '67992341234', '67999887766', '1997-07-22', 'senha987'),
('444.555.666-77', 'Nicolas Silva', 'PI', 'Teresina', 'Horto', 'Rua N', '41', '86988776655', NULL, '1991-11-11', 'abc456'),
('555.666.777-88', 'Olivia Martins', 'MA', 'São Luís', 'Renascença', 'Rua O', '300', '98991234567', NULL, '1996-03-19', 'pass222'),
('666.777.888-99', 'Paulo Teixeira', 'TO', 'Palmas', 'Plano Diretor', 'Rua P', '500', '63992347654', NULL, '1984-08-01', 'senha000'),
('777.888.999-00', 'Queila Andrade', 'AL', 'Maceió', 'Ponta Verde', 'Rua Q', '55', '82988776655', NULL, '1998-01-17', 'qwerty'),
('888.999.000-11', 'Rafael Barbosa', 'RO', 'Porto Velho', 'Embratel', 'Rua R', '17', '69991234567', NULL, '1989-05-29', 'abcabc'),
('999.000.111-22', 'Sara Nogueira', 'RR', 'Boa Vista', 'Centro', 'Rua S', '12', '95988771234', '95991112222', '1995-10-08', 'senha880'),
('132.233.445-56', 'Thiago Farias', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('142.233.445-56', 'Benzel Farias', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('152.233.445-56', 'Thiago Kraig', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('162.233.445-56', 'Karmen Farias', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('172.233.445-56', 'Julius Farias', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('182.233.445-56', 'Thiago Santa', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('192.233.445-56', 'Felicia Farias', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555'),
('102.233.445-56', 'Thiago Nunes', 'AC', 'Rio Branco', 'Bosque', 'Rua T', '78', '68992347654', NULL, '1993-02-14', 'pass555');

-- pacientes pro teste 5
INSERT INTO PESSOA (cpf, nome, uf, cidade, bairro, rua, numero, telefone1, telefone2, data_nasc, senha) VALUES
('013.111.222-33', 'Alessandro Moura', 'AC', 'Rio Branco', 'Floresta', 'Rua Alfa', '101', '68994561234', NULL, '1991-04-11', 'senha101'),
('024.222.333-44', 'Beatriz Correia', 'AL', 'Maceió', 'Jatiúca', 'Rua Beta', '202', '82993457812', NULL, '1996-09-27', 'beta202'),
('035.333.444-55', 'Caio Antunes', 'AP', 'Macapá', 'Centro', 'Rua Gama', '303', '96991234567', NULL, '1989-06-18', 'gama303'),
('046.444.555-66', 'Diana Monteiro', 'AM', 'Manaus', 'Adrianópolis', 'Rua Delta', '404', '92995551234', '92992223344', '1994-12-02', 'delta404'),
('057.555.666-77', 'Eduardo Pires', 'BA', 'Salvador', 'Pituba', 'Rua Sigma', '505', '71992349876', NULL, '1990-01-09', 'sigma505'),
('068.666.777-88', 'Fernanda Soares', 'CE', 'Fortaleza', 'Aldeota', 'Rua Omega', '606', '85997654321', NULL, '1993-07-21', 'omega606'),
('079.777.888-99', 'Gustavo Almeida', 'DF', 'Brasília', 'Asa Norte', 'Rua Setor', '707', '61993456789', NULL, '1988-05-30', 'senha707'),
('081.888.999-00', 'Helena Castro', 'ES', 'Vitória', 'Praia do Canto', 'Rua Horizonte', '808', '27991235678', NULL, '1995-03-14', 'hori808'),
('092.999.000-11', 'Igor Menezes', 'GO', 'Goiânia', 'Marista', 'Rua Leste', '909', '62997654321', NULL, '1992-10-08', 'leste909'),
('103.000.111-22', 'Jéssica Loureiro', 'MA', 'São Luís', 'Calhau', 'Rua Atlântico', '111', '98994553322', '98993334455', '1997-09-17', 'atl111'),
('114.111.222-33', 'Kleber Tavares', 'MT', 'Cuiabá', 'Jardim Itália', 'Rua Norte', '222', '65994551234', NULL, '1986-04-25', 'norte222'),
('125.222.333-44', 'Larissa Paiva', 'MS', 'Campo Grande', 'Centro', 'Rua Sul', '333', '67993456781', NULL, '1998-08-06', 'sul333'),
('136.333.444-55', 'Marcelo Régis', 'MG', 'Belo Horizonte', 'Lourdes', 'Rua Central', '444', '31995677889', NULL, '1987-12-23', 'cent444'),
('147.444.555-66', 'Natália Furtado', 'PA', 'Belém', 'Umarizal', 'Rua Pará', '555', '91998761234', NULL, '1994-02-19', 'para555'),
('158.555.666-77', 'Otávio Lemos', 'PB', 'João Pessoa', 'Tambaú', 'Rua Mar', '666', '83992347890', NULL, '1992-11-04', 'mar666'),
('169.666.777-88', 'Patrícia Duarte', 'PR', 'Curitiba', 'Água Verde', 'Rua Paraná', '777', '41997654321', '41991112233', '1991-06-28', 'pr777'),
('170.777.888-99', 'Rafael Cabral', 'PE', 'Recife', 'Boa Vista', 'Rua Recife', '888', '81993457890', NULL, '1989-05-10', 'rec888'),
('181.888.999-00', 'Sabrina Torres', 'PI', 'Teresina', 'Ilhotas', 'Rua Sol', '999', '86997881234', NULL, '1996-03-30', 'sol999'),
('192.999.000-11', 'Thiago Queiroz', 'RJ', 'Rio de Janeiro', 'Tijuca', 'Rua Rio', '121', '21995566778', NULL, '1985-01-12', 'rio121'),
('203.000.111-22', 'Ursula Menezes', 'RN', 'Natal', 'Ponta Negra', 'Rua Marfim', '232', '84992345678', NULL, '1993-07-09', 'marf232'),
('214.111.222-33', 'Vitor Amaral', 'RO', 'Porto Velho', 'Cohab', 'Rua Norte 2', '343', '69996785544', NULL, '1990-09-03', 'nor2343'),
('225.222.333-44', 'Wesley Pontes', 'RR', 'Boa Vista', 'Caçari', 'Rua Roraima', '454', '95992346789', NULL, '1995-05-26', 'rr454'),
('236.333.444-55', 'Xênia Matos', 'RS', 'Porto Alegre', 'Petrópolis', 'Rua Sul 2', '565', '51996781234', NULL, '1987-08-21', 'sul2565'),
('247.444.555-66', 'Yago Nascimento', 'SC', 'Florianópolis', 'Centro', 'Rua Ilha', '676', '48991236789', NULL, '1999-12-14', 'ilha676'),
('258.555.666-77', 'Zilda Campos', 'SE', 'Aracaju', 'Siqueira Campos', 'Rua Areia', '787', '79997771234', NULL, '1994-10-22', 'are787'),
('269.666.777-88', 'Arthur Silveira', 'SP', 'São Paulo', 'Moema', 'Rua Tupã', '898', '11993456780', NULL, '1988-02-08', 'tupa898'),
('270.777.888-99', 'Bianca Lacerda', 'TO', 'Palmas', 'Centro', 'Rua Tocantins', '909', '63997654322', NULL, '1992-06-11', 'toc909');


-----------------------------------------------------------------------
-- INSERTS NA TABELA FUNCOES
-----------------------------------------------------------------------
INSERT INTO funcoes (id, funcao) VALUES
(1, 'ENFERMEIRO'), (4, 'ENFERMEIRO'), (5, 'ENFERMEIRO'), (6, 'ENFERMEIRO'), (7, 'ENFERMEIRO'),
(8, 'MEDICO'), (9, 'MEDICO'), (10, 'MEDICO'), (11, 'MEDICO'), (12, 'MEDICO'), (13, 'MEDICO'), (14, 'MEDICO'),
(15, 'PACIENTE'), (16, 'PACIENTE'), (17, 'PACIENTE'), (18, 'PACIENTE'), (19, 'PACIENTE'), (20, 'PACIENTE'),
(21, 'PESQUISADOR'), (22, 'PESQUISADOR'), (23, 'PESQUISADOR'), (24, 'PESQUISADOR'), (25, 'PESQUISADOR'), (26, 'PESQUISADOR'), (27, 'PESQUISADOR');

-----------------------------------------------------------------------
-- INSERTS NA TABELA MEDICO
-----------------------------------------------------------------------
INSERT INTO medico (id, crm) VALUES
(8,  '12345 SP'),
(9,  '54321 RJ'),
(10, '11223 MG'),
(11, '99887 BA'),
(12, '111111 RS'),
(13, '22222 SC'),
(14, '7 PR');

-----------------------------------------------------------------------
-- INSERTS NA TABELA ENFERMEIRO
-----------------------------------------------------------------------
INSERT INTO enfermeiro (id, coren) VALUES
(1, 'SP 123456789'),
(4, 'BA 444555666'),
(5, 'RS 777888999'),
(6, 'SC 000111222'),
(7, 'PR 333444555');

-----------------------------------------------------------------------
-- INSERTS NA TABELA PESQUISADOR
-----------------------------------------------------------------------
INSERT INTO pesquisador (id, funcao) VALUES
(21, 'PESQUISADOR_RESPONSAVEL'),
(22, 'PESQUISADOR_RESPONSAVEL'),
(23, 'PESQUISADOR_RESPONSAVEL'),
(24, 'PESQUISADOR_COMUM'),
(25, 'PESQUISADOR_COMUM'),
(26, 'PESQUISADOR_COMUM'),
(27, 'PESQUISADOR_COMUM');

-----------------------------------------------------------------------
-- INSERTS NA TABELA PESQUISADOR COMUM
-----------------------------------------------------------------------
INSERT INTO pesquisador_comum (id) VALUES
(24),
(25),
(26),
(27);

-----------------------------------------------------------------------
-- INSERTS NA TABELA PESQUISADOR RESPONSAVEL
-----------------------------------------------------------------------
INSERT INTO pesquisador_responsavel (id) VALUES
(21),
(22),
(23);

-----------------------------------------------------------------------
-- INSERTS NA TABELA PACIENTES
-----------------------------------------------------------------------
INSERT INTO paciente (id) VALUES
(15),
(16),
(17),
(18),
(19),
(20);

INSERT INTO paciente (id) VALUES
(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),	--pacientes do teste 5
(46),(47),(48),(49),(50),(51),(52),(53),(54);

-----------------------------------------------------------------------
-- INSERTAS NA TABELA DOENCAS
-----------------------------------------------------------------------
INSERT INTO doenca (id, doenca) VALUES
(15, 'Hipertensão'),
(15, 'Diabetes Tipo 2'),
(16, 'Asma'),
(17, 'Enxaqueca Crônica'),
(18, 'Artrite Reumatoide'),
(19, 'Distúrbio do Sono'),
(20, 'Alergia a Poeira');

-----------------------------------------------------------------------
-- INSERTS NA TABELA UNIVERSIDADES
-----------------------------------------------------------------------
INSERT INTO universidade (cnpj, nome, campus, uf, cidade, bairro, numero) VALUES
('12345678/0001-90', 'Universidade Aurora', 'Campus Central', 'SP', 'São Paulo', 'Vila Mariana', '1200'),
('23456789/0001-01', 'Instituto Tecnológico do Horizonte', 'Campus Leste', 'MG', 'Belo Horizonte', 'Savassi', '450'),
('34567890/0001-12', 'Universidade Vale Verde', 'Campus Norte', 'RS', 'Porto Alegre', 'Centro Histórico', '0089'),
('45678901/0001-23', 'Centro Acadêmico Solaris', 'Campus Alfa', 'RJ', 'Rio de Janeiro', 'Botafogo', '0702'),
('56789012/0001-34', 'Universidade do Litoral', 'Campus Praia', 'SC', 'Florianópolis', 'Trindade', '0301'),
('67890123/0001-45', 'Instituto Nacional de Pesquisas Aplicadas', 'Campus Tecnológico', 'PR', 'Curitiba', 'Batel', '0155'),
('78901234/0001-56', 'Universidade Monte Azul', 'Campus Serra', 'BA', 'Salvador', 'Barra', '0210'),
('89012345/0001-67', 'Faculdade Horizonte Aberto', 'Campus Delta', 'PE', 'Recife', 'Boa Viagem', '0980');

-----------------------------------------------------------------------
-- INSERTS NA TABELA AG DE FOMENTO
-----------------------------------------------------------------------
INSERT INTO ag_fomento (cnpj, nome, abrangencia, publica) VALUES
('11223344/0001-00', 'Fundação Nacional de Pesquisa', 'NACIONAL', 'S'),
('22334455/0001-11', 'Agência de Inovação do Sul', 'REGIONAL', 'S'),
('33445566/0001-22', 'Instituto Privado de Fomento Científico', 'NACIONAL', 'N'),
('44556677/0001-33', 'Fundo de Desenvolvimento Tecnológico', 'REGIONAL', 'S'),
('55667788/0001-44', 'Agência Horizonte de Fomento', 'NACIONAL', 'N'),
('66778899/0001-55', 'Instituto Internacional de Pesquisa', 'INTERNACIONAL', 'N'),
('77889900/0001-66', 'Agência Brasil de Apoio Científico', 'INTERNACIONAL', 'S'),
('88990011/0001-77', 'Centro de Fomento à Inovação', 'REGIONAL', 'S'),
('11111111/0001-01', 'CNPq', 'NACIONAL', 'S'),
('22222222/0001-02', 'CAPES', 'NACIONAL', 'S'),
('33333333/0001-03', 'FAPESP', 'NACIONAL', 'S');

-----------------------------------------------------------------------
-- INSERTS NA TABELA EST_SAUDE
-----------------------------------------------------------------------
INSERT INTO estab_saude (cnes, nome, uf, cidade, bairro, rua, numero, telefone1, telefone2, funcao) VALUES
('0000001', 'Hospital Santa Luzia', 'SP', 'São Paulo', 'Vila Mariana', 'Rua das Acácias','120', '55119990000', '55119990002', 'HOSPITAL/CLINICA'),
('0000002', 'Clínica Esperança', 'RJ', 'Rio de Janeiro', 'Botafogo', 'Av. Atlântica','702', '55219990000', NULL, 'HOSPITAL/CLINICA'),
('0000003', 'Hospital do Coração','MG', 'Belo Horizonte', 'Savassi', 'R. da Bahia','450', '55199900004', '55319990005', 'HOSPITAL/CLINICA'),
('0000004', 'LabEx - Laboratório Ext','SP', 'São Paulo', 'Centro', 'R. Direita','10',  '55119990006', NULL,'LAB_EXT'),
('0000005', 'LabEx - Laboratório Sensacional','RJ', 'Rio de Janeiro', 'Centro', 'R. Direita','10',  '55119990006', NULL,'LAB_EXT');
-----------------------------------------------------------------------
-- INSERTS NA TABELA HOSPITAL/CLINICA
-----------------------------------------------------------------------
INSERT INTO hospital_clinica (id) VALUES (1), (2), (3);

-----------------------------------------------------------------------
-- INSERTS NA TABELA LAB_EXT
-----------------------------------------------------------------------
INSERT INTO lab_ext (id) VALUES (4), (5);

-----------------------------------------------------------------------
-- INSERTS NA TABELA MED-HOSP
-----------------------------------------------------------------------
INSERT INTO med_hosp (id_med, id_hosp) VALUES
(8, 1),
(9, 1),
(10, 2),
(11, 2),
(12, 3),
(13, 3),
(14, 1);

-----------------------------------------------------------------------
-- INSERTS NA TABELA SOLICITA DADOS
-----------------------------------------------------------------------
INSERT INTO solicita_dados (id_hosp, id_pesq, situacao, descricao) VALUES
(1, 21, 'PENDENTE',  'Solicitação de amostras de sangue para estudo X'),
(2, 22, 'APROVADO',  'Solicitação de exames para pesquisa sobre Zika'),
(3, 23, 'REPROVADO',  'Pedido de dados demográficos - falta documentação');

----------------------------------------------------------------------
-- INSERTS NA TABELA PESQUISA
-----------------------------------------------------------------------
INSERT INTO pesquisa (data_criacao, titulo, area, descricao) VALUES
('2024-03-01', 'ESTUDO BIOMARCADORES COVID', 'INFECTOLOGIA', 'AVALIAR BIOMARCADORES ASSOCIADOS À GRAVIDADE DA COVID-19'),
('2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA', 'INTERVENÇÃO COMUNITÁRIA PARA CONTROLE PRESSÓRICO');


INSERT INTO pesquisa (data_criacao, titulo, area, descricao) VALUES
('2025-06-15', 'PROJETO MENTAL', 'NEUROLOGIA', 'NEUROCIENCIA É LEGAL');
-----------------------------------------------------------------------
-- INSERTS NA TABELA EXECUCAO
-----------------------------------------------------------------------
INSERT INTO execucao (data_criacao, titulo, area, cnpj, data_inicio, data_conclusao) VALUES
('2024-03-01', 'ESTUDO BIOMARCADORES COVID', 'INFECTOLOGIA', '12345678/0001-90', '2024-04-01', '2024-12-31'),
('2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA', '23456789/0001-01', '2024-07-01', '2025-06-30');
-----------------------------------------------------------------------
-- INSERTS NA TABELA PESQ_EXEC
INSERT INTO pesq_exec (id_pesq, id_exec, data_ingresso, data_saida) VALUES
(24, 1, '2024-04-01', NULL),
(25, 1, '2024-05-01', '2024-10-01'),
(26, 2, '2024-07-01', NULL),
(27, 2, '2024-08-01', '2025-01-15');

-----------------------------------------------------------------------
-- INSERTS NA TABELA FINANCIA
-----------------------------------------------------------------------
INSERT INTO financia (cnpj, data_criacao, titulo, area, valor) VALUES
('33333333/0001-03', '2024-03-01', 'ESTUDO BIOMARCADORES COVID', 'INFECTOLOGIA', 150000.00),
('11111111/0001-01', '2024-03-01', 'ESTUDO BIOMARCADORES COVID', 'INFECTOLOGIA', 5000.00),
('11111111/0001-01', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('22222222/0001-02', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('33333333/0001-03', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('11223344/0001-00', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('22334455/0001-11', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('33445566/0001-22', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('44556677/0001-33', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('66778899/0001-55', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('55667788/0001-44', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('88990011/0001-77', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00),
('77889900/0001-66', '2024-06-15', 'PROJETO HIPERTENSÃO COMUNITÁRIA', 'CARDIOLOGIA',  80000.00);





-----------------------------------------------------------------------
-- INSERTS NA TABELA MED_EXEC
-----------------------------------------------------------------------
INSERT INTO med_exec (id_med, id_exec) VALUES
(8, 1),
(9, 1),
(12, 2),
(13, 2);

-- INSERTS NA TABELA TIPO DE COLETA
INSERT INTO tipo_coleta (categoria, periculosidade) VALUES
('Sangue', 'ALTA'),
('Saliva', 'BAIXA');

-- INSERTS NA  TABELA AMOSTRA
INSERT INTO amostra (categoria, data_coleta, id_pac, validade, info, estado, qtde, id_enf) VALUES
('Sangue', '2024-05-10', 15, '2024-05-20', 'Amostra rotulada A', 'CONSERVADO', 1, 1),
('Sangue', '2024-05-10', 16, '2024-05-20', 'Amostra rotulada A', 'CONSERVADO', 1, 1),
('Sangue', '2024-05-10', 17, '2024-05-20', 'Amostra rotulada A', 'CONSERVADO', 1, 1),
('Saliva', '2025-05-10', 15, '2025-05-20', 'Amostra rotulada AB', 'CONSERVADO', 1, 1),
('Sangue', '2024-06-01', 16, '2024-06-11', 'Amostra rotulada B', 'CONSERVADO', 2, 1),
('Saliva', '2024-06-01', 16, '2024-06-11', 'Amostra rotulada BA', 'CONSERVADO', 10, 1),
('Saliva','2024-07-12', 17, '2024-07-22', 'Amostra rotulada C', 'ALTERADO', 1, 1),
('Saliva','2024-06-12', 17, '2024-06-22', 'Amostra rotulada CA', 'ALTERADO', 12, 1),
('Sangue','2024-06-12', 17, '2024-06-22', 'Amostra rotulada CA', 'ALTERADO', 5, 1);

INSERT INTO amostra (categoria, data_coleta, id_pac, validade, info, estado, qtde, id_enf) VALUES
('Sangue', '2024-01-05', 28, '2024-01-15', 'Amostra rotulada A', 'CONSERVADO', 1, 1),
('Saliva', '2024-01-10', 29, '2024-01-20', 'Amostra rotulada B', 'CONSERVADO', 2, 1),
('Sangue', '2024-02-12', 30, '2024-02-22', 'Amostra rotulada C', 'ALTERADO', 3, 1),
('Saliva', '2024-03-03', 31, '2024-03-13', 'Amostra rotulada D', 'CONSERVADO', 1, 1),
('Sangue', '2024-03-15', 32, '2024-03-25', 'Amostra rotulada E', 'CONSERVADO', 4, 1),
('Saliva', '2024-04-01', 33, '2024-04-11', 'Amostra rotulada F', 'ALTERADO', 2, 1),
('Sangue', '2024-04-12', 34, '2024-04-22', 'Amostra rotulada G', 'CONSERVADO', 5, 1),
('Saliva', '2024-05-05', 35, '2024-05-15', 'Amostra rotulada H', 'CONSERVADO', 3, 1),
('Sangue', '2024-05-20', 36, '2024-05-30', 'Amostra rotulada I', 'ALTERADO', 2, 1),
('Saliva', '2024-06-01', 37, '2024-06-11', 'Amostra rotulada J', 'CONSERVADO', 1, 1),
('Sangue', '2024-06-12', 38, '2024-06-22', 'Amostra rotulada K', 'CONSERVADO', 4, 1),
('Saliva', '2024-07-01', 39, '2024-07-11', 'Amostra rotulada L', 'ALTERADO', 6, 1),
('Sangue', '2024-07-15', 40, '2024-07-25', 'Amostra rotulada M', 'CONSERVADO', 1, 1),
('Saliva', '2024-08-05', 41, '2024-08-15', 'Amostra rotulada N', 'CONSERVADO', 3, 1),
('Sangue', '2024-08-20', 42, '2024-08-30', 'Amostra rotulada O', 'ALTERADO', 2, 1),
('Saliva', '2024-09-01', 43, '2024-09-11', 'Amostra rotulada P', 'CONSERVADO', 5, 1),
('Sangue', '2024-09-12', 44, '2024-09-22', 'Amostra rotulada Q', 'CONSERVADO', 3, 1),
('Saliva', '2024-10-03', 45, '2024-10-13', 'Amostra rotulada R', 'ALTERADO', 4, 1),
('Sangue', '2024-10-15', 46, '2024-10-25', 'Amostra rotulada S', 'CONSERVADO', 2, 1),
('Saliva', '2024-11-01', 47, '2024-11-11', 'Amostra rotulada T', 'CONSERVADO', 1, 1),
('Sangue', '2024-11-12', 48, '2024-11-22', 'Amostra rotulada U', 'ALTERADO', 6, 1),
('Saliva', '2024-12-01', 49, '2024-12-11', 'Amostra rotulada V', 'CONSERVADO', 2, 1),
('Sangue', '2024-12-05', 50, '2024-12-15', 'Amostra rotulada W', 'CONSERVADO', 3, 1),
('Saliva', '2024-12-12', 51, '2024-12-22', 'Amostra rotulada X', 'ALTERADO', 4, 1),
('Sangue', '2024-12-15', 52, '2024-12-25', 'Amostra rotulada Y', 'CONSERVADO', 1, 1),
('Saliva', '2024-12-18', 53, '2024-12-28', 'Amostra rotulada Z', 'CONSERVADO', 5, 1),
('Sangue', '2024-12-20', 54, '2024-12-30', 'Amostra rotulada AA', 'ALTERADO', 2, 1);




-- INSERTS NA TABELA DADOS_AMOSTRAS
INSERT INTO dados_amostra (id_estab, data_proc, id_amostra, dados) VALUES
(1, '2024-05-11', 1, 'Resultado preliminar A'),
(1, '2024-05-11', 2, 'Resultado preliminar B'),
(1, '2024-05-11', 3, 'Resultado preliminar C'),
(1, '2025-05-11', 4, 'Resultado preliminar D'),
(1, '2024-06-02', 5, 'Resultado preliminar E'),
(1, '2024-07-12', 6, 'Resultado preliminar F'),
(1, '2024-07-13', 7, 'Resultado preliminar G'),
(1, '2024-06-13', 8, 'Resultado preliminar H'),
(2, '2024-06-13', 9, 'Resultado preliminar I');


INSERT INTO dados_amostra (id_estab, data_proc, id_amostra, dados) values -- dados do teste 5 - lab 2
(2, '2024-01-05', 10, 'Resultado preliminar A'),
(2, '2024-01-10', 11, 'Resultado preliminar B'),
(2, '2024-02-12', 12, 'Resultado preliminar C'),
(2, '2024-03-03', 13, 'Resultado preliminar D'),
(2, '2024-03-15', 14, 'Resultado preliminar E'),
(2, '2024-04-01', 15, 'Resultado preliminar F'),
(2, '2024-04-12', 16, 'Resultado preliminar G'),
(2, '2024-05-05', 17, 'Resultado preliminar H'),
(2, '2024-05-20', 18, 'Resultado preliminar I'),
(2, '2024-06-01', 19, 'Resultado preliminar J'),
(2, '2024-06-12', 20, 'Resultado preliminar K'),
(2, '2024-07-01', 21, 'Resultado preliminar L'),
(2, '2024-07-15', 22, 'Resultado preliminar M'),
(2, '2024-08-05', 23, 'Resultado preliminar N'),
(2, '2024-08-20', 24, 'Resultado preliminar O'),
(2, '2024-09-01', 25, 'Resultado preliminar P'),
(2, '2024-09-12', 26, 'Resultado preliminar Q'),
(2, '2024-10-03', 27, 'Resultado preliminar R'),
(2, '2024-10-15', 28, 'Resultado preliminar S'),
(2, '2024-11-01', 29, 'Resultado preliminar T'),
(2, '2024-11-12', 30, 'Resultado preliminar U'),
(2, '2024-12-01', 31, 'Resultado preliminar V'),
(2, '2024-12-05', 32, 'Resultado preliminar W'),
(2, '2024-12-12', 33, 'Resultado preliminar X'),
(2, '2024-12-15', 34, 'Resultado preliminar Y'),
(2, '2024-12-18', 35, 'Resultado preliminar Z'),
(2, '2024-12-20', 36, 'Resultado preliminar AA');


-- INSERTS NA TABELA DISPONIBILIZACAO
INSERT INTO disponibilizacao (id_exec, id_dados, data_entrega, data_devol) VALUES
(1, 1, '2024-05-12', '2024-06-12'),
(1, 2, '2024-06-05', '2024-07-05'),
(1, 1, '2025-05-12', '2027-06-12'),
(1, 2, '2025-06-05', '2027-07-05');

INSERT INTO disponibilizacao (id_exec, id_dados, data_entrega, data_devol) VALUES
(1, 10, '2024-05-12', '2024-06-12'),
(1, 11, '2024-06-05', '2024-07-05'),
(1, 12, '2025-05-12', '2027-06-12'),
(1, 13, '2025-06-05', '2027-07-05'),
(1, 14, '2024-05-12', '2024-06-12'),
(1, 15, '2024-06-05', '2024-07-05'),
(1, 16, '2025-05-12', '2027-06-12'),
(1, 17, '2025-06-05', '2027-07-05'),
(1, 18, '2024-05-12', '2024-06-12'),
(1, 19, '2024-06-05', '2024-07-05'),
(1, 20, '2025-05-12', '2027-06-12'),
(1, 21, '2025-06-05', '2027-07-05'),
(1, 22, '2024-05-12', '2024-06-12'),
(1, 23, '2024-06-05', '2024-07-05'),
(1, 24, '2025-05-12', '2027-06-12'),
(1, 25, '2025-06-05', '2027-07-05'),
(1, 26, '2024-05-12', '2024-06-12'),
(1, 27, '2024-06-05', '2024-07-05'),
(1, 28, '2025-05-12', '2027-06-12'),
(1, 29, '2025-06-05', '2027-07-05'),
(1, 30, '2024-05-12', '2024-06-12'),
(1, 31, '2024-06-05', '2024-07-05'),
(1, 32, '2025-05-12', '2027-06-12'),
(1, 33, '2025-06-05', '2027-07-05'),
(1, 34, '2024-05-12', '2024-06-12'),
(1, 35, '2024-06-05', '2024-07-05'),
(1, 36, '2025-05-12', '2027-06-12');

INSERT INTO disponibilizacao (id_exec, id_dados, data_entrega, data_devol) VALUES
(2, 33, '2025-06-05', '2027-07-05'),
(2, 34, '2024-05-12', '2024-06-12'),
(2, 35, '2024-06-05', '2024-07-05'),
(2, 36, '2025-05-12', '2027-06-12');




-- INSERTS NA TABELA TIPO_EXAME
INSERT INTO tipo_exame (categoria, periculosidade) VALUES
('Hemograma', 'BAIXA'),
('PCR','ALTA');

-- INSERTS NA TABELA EXAME
INSERT INTO exame (categoria, data_proc, id_pac, resultado, id_med) VALUES
('Hemograma', '2024-05-11', 15, 'Normal', 8),
('PCR',      '2024-05-11', 15, 'Negativo', 9);

-- INSERTS NA TABELA EXEC_DISP_EXAME
INSERT INTO exec_disp_exame (id_exame, id_exec, data_entrega, data_devol) VALUES
(1, 1, '2024-05-12', '2024-06-12'),
(2, 1, '2024-05-13', '2024-06-13');

INSERT INTO exec_disp_amostra (id_amostra, id_exec, data_entrega, data_devol) VALUES
(1, 1, '2024-05-12', '2024-06-12'),
(2, 1, '2024-06-12', '2024-07-12');

SELECT version()
