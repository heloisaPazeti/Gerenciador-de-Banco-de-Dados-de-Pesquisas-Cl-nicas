-- 1. SELECIONAR PARA UMA PESQUISA ESPECIFICA TODAS AS AMOSTRAS QUE AINDA NÃO FORAM DEVOLVIDAS
select A.* from PESQUISA P join EXECUCAO E on (E.titulo = P.titulo and E.area = P.area and E.data_criacao = P.data_criacao)
						   join DISPONIBILIZACAO D on E.id = D.id_exec
						   join DADOS_AMOSTRA DD on DD.id = D.id_dados
						   join AMOSTRA A on DD.id_amostra = A.id
where NOW()<D.data_devol AND P.titulo = {titulo} and P.area={area} AND P.data_criacao={data};

-- 2. RETORNAR AS 5 PESQUISAS QUE MAIS UTILIZARAM AMOSTRAS
select P.*, count(A.id) as total_amostras from PESQUISA P join EXECUCAO E on (E.titulo = P.titulo and E.area = P.area and E.data_criacao = P.data_criacao)
						   join DISPONIBILIZACAO D on E.id = D.id_exec
						   join DADOS_AMOSTRA DD on DD.id = D.id_dados
						   join AMOSTRA A on DD.id_amostra = A.id
group by P.data_criacao, P.tituLO, P.area , P.descricao
order by total_amostras desc limit 5;

-- 3. REUNIR TODAS AS AMOSTRAS DE TODOS OS PACIENTES NASCIDOS NUM MÊS ESPECIFICO
select A.* from AMOSTRA A join pessoa P on A.id_pac = P.id where EXTRACT(MONTH FROM p.data_nasc) = {mes};

-- 4. REUNIR TODAS AS EXECUÇÕES QUE RECEBE ACIMA DE UM VALOR ESPECÍFICO DA AG. DE FOMENTO
select E.*, COUNT(EX.ID) as total_exames from EXECUCAO E join PESQUISA P on (P.titulo = E.titulo and P.area = E.area and P.data_criacao = E.data_criacao)
						   join FINANCIA F on (P.titulo = F.titulo and P.area = F.area and P.data_criacao = F.data_criacao)
where F.valor > 2000;

-- 5. REUNIR TODAS AS PESQUISAS RELACIONADAS A UM TAL LABORATORIO QUE TEM PACIENTES RELACIONADOS A TODOS OS ESTADOS
select P.* from PESQUISA P join EXECUCAO E on (E.titulo = P.titulo and E.area = P.area and E.data_criacao = P.data_criacao)
						   join DISPONIBILIZACAO D on D.id_exec = E.id
						   join DADOS_AMOSTRA DA on DA.ID = D.id_dados
						   join AMOSTRA A on A.ID=DA.id_amostra
						   join PACIENTE Pa on A.id_pac = Pa.id
						   join Pessoa Pe on Pa.id=Pe.id,
						   join LAB_EXT LE on LE.ID = DA.id_estab
group by P.data_criacao, P.titulo, P.area, P.descricao having count(distinct Pe.uf)=27;
-- 6. DIVISÃO: RETORNAR TODAS AS UNIVERSIDADES QUE TEM VÍNCULO - PELA PESQUISA - COM TODAS AS AGÊNCIAS DE FOMENTO.
select U.* from UNIVERSIDADE U join EXECUCAO E on U.cnpj = E.cnpj
							   join FINANCIA F on (E.titulo = F.titulo and E.area = F.area and E.data_criacao = F.data_criacao)
							   join AG_FOMENTO A on A.CNPJ=F.CNPJ
group by U.CNPJ, U.NOME having COUNT(distinct F.CNPJ) = (select count(distinct cnpj) from ag_fomento);
