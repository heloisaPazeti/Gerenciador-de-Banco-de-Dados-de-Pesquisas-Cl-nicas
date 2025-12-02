-- 1. Exibir quantidade de dados de amostras que uma pesquisa ainda nao devolveu
SELECT
    P.data_criacao,           -- Data de criação da pesquisa
    P.titulo,                 -- Título da pesquisa
    P.area,                   -- Área da pesquisa
    COUNT(*) AS qtd_n_devolvida  -- Quantidade de dados ainda não devolvidos
FROM PESQUISA P
JOIN EXECUCAO E 
      ON E.data_criacao = P.data_criacao  -- Junta a execução à pesquisa com base na data
     AND E.titulo        = P.titulo      -- Junta pelo título da pesquisa
     AND E.area          = P.area        -- Junta pela área da pesquisa
JOIN DISPONIBILIZACAO D 
      ON D.id_exec = E.id               -- Relaciona cada execução à sua disponibilização de amostras
WHERE (D.data_devol IS NULL OR CURRENT_DATE < D.data_devol)  -- Filtra apenas amostras ainda não devolvidas
GROUP BY 
    P.data_criacao, 
    P.titulo,
    P.area                                 
ORDER BY qtd_n_devolvida DESC;             -- Ordena do maior número de não devolvidas

-- 2. Retornar as 5 pesquisas que mais utilizaram amostras
SELECT 
    P.*,                     -- Seleciona todas as colunas da pesquisa
    COUNT(A.id) AS total_amostras  -- Conta quantas amostras foram utilizadas em cada pesquisa
FROM PESQUISA P
JOIN EXECUCAO E 
      ON E.titulo        = P.titulo
     AND E.area          = P.area
     AND E.data_criacao  = P.data_criacao
JOIN DISPONIBILIZACAO D 
      ON D.id_exec = E.id
JOIN DADOS_AMOSTRA DD 
      ON DD.id = D.id_dados
JOIN AMOSTRA A 
      ON A.id = DD.id_amostra
GROUP BY 
    P.data_criacao,
    P.titulo,
    P.area,
    P.descricao                 -- Agrupa por todas as colunas relevantes da pesquisa
ORDER BY 
    total_amostras DESC         -- Ordena do maior para o menor número de amostras
LIMIT 5;                        -- Retorna apenas as 5 pesquisas que mais usaram amostras

-- 3. Estatísticas de amostras por mês e UF
SELECT
	TO_CHAR(A.data_coleta, 'mm') AS mes,  -- Converte a data de coleta para mês
    TO_CHAR(A.data_coleta, 'YYYY') AS ano, -- Converte a data de coleta para ano
    P.uf                             AS uf_pacientes,  -- Estado do paciente
    COUNT(*)                         AS tipos_amostras_distintas, -- Total de registros de amostra
    COUNT(DISTINCT A.id_pac)         AS pacientes_distintos,      -- Número de pacientes únicos
    AVG(A.qtde)                       AS media_qtde,             -- Média de quantidade por amostra
    MIN(A.qtde)                       AS min_qtde,               -- Quantidade mínima de amostra
    MAX(A.qtde)                       AS max_qtde                -- Quantidade máxima de amostra
FROM AMOSTRA A
JOIN PESSOA P 
    ON A.id_pac = P.id                 -- Junta cada amostra ao paciente correspondente
GROUP BY 
    TO_CHAR(A.data_coleta, 'YYYY'),    -- Agrupa por ano
    TO_CHAR(A.data_coleta, 'mm'),      -- Agrupa por mês
    P.uf                               -- Agrupa por estado
ORDER BY 
    mes, ano, uf_pacientes;           -- Ordena por mês, ano e estado

-- 4. Pesquisas com financiamento acima da média
WITH media_valores AS (
    SELECT AVG(valor) AS valor_medio    -- Calcula a média de todos os financiamentos
    FROM FINANCIA
)
SELECT 
    P.data_criacao,
    P.titulo,
    P.area,
    F.valor AS valor_financiamento_pesquisa,  -- Valor do financiamento de cada pesquisa
    F.cnpj as ag_fomento                      -- Agência de fomento que financiou
FROM PESQUISA P
JOIN FINANCIA F
    ON F.titulo = P.titulo 
   AND F.area = P.area 
   AND F.data_criacao = P.data_criacao
CROSS JOIN media_valores M                    -- Disponibiliza o valor médio em cada linha
WHERE F.valor > M.valor_medio                 -- Seleciona apenas financiamentos acima da média
ORDER BY P.data_criacao, P.titulo, F.valor DESC;

-- 5.pesquisas relacionadas a um tal estabelecimento que tem pacientes relacionados a todos os estados.
SELECT 
    P.*
FROM PESQUISA P
JOIN EXECUCAO E 
      ON E.titulo        = P.titulo
     AND E.area          = P.area
     AND E.data_criacao  = P.data_criacao
JOIN DISPONIBILIZACAO D 
      ON D.id_exec = E.id
JOIN DADOS_AMOSTRA DA 
      ON DA.id = D.id_dados
JOIN AMOSTRA A 
      ON A.id = DA.id_amostra
JOIN PACIENTE Pa 
      ON Pa.id = A.id_pac               -- Junta amostras aos pacientes
JOIN PESSOA Pe 
      ON Pe.id = Pa.id                  -- Obtém dados do paciente (incluindo UF)
JOIN estab_saude ES 
      ON ES.id = DA.id_estab            -- Junta com estabelecimento externo
GROUP BY 
    P.data_criacao,
    P.titulo,
    P.area,
    P.descricao
HAVING 
    COUNT(DISTINCT Pe.uf) = 27;          -- Mantém apenas pesquisas com dados de 27 estados

-- 6. Universidades vinculadas a todas as agências de fomento
SELECT 
    U.*
FROM UNIVERSIDADE U
JOIN EXECUCAO E 
      ON U.cnpj = E.cnpj                  -- Relaciona universidades às execuções
JOIN FINANCIA F 
      ON F.titulo       = E.titulo
     AND F.area         = E.area
     AND F.data_criacao = E.data_criacao
JOIN AG_FOMENTO A 
      ON A.cnpj = F.cnpj                 -- Junta aos financiamentos das agências
GROUP BY 
    U.cnpj, 
    U.nome
HAVING 
    COUNT(DISTINCT F.cnpj) = (           -- Mantém apenas universidades que receberam financiamento de todas as agências
        SELECT COUNT(DISTINCT cnpj) 
        FROM AG_FOMENTO
    );

------------------------------------
--        SELECT APLICAÇÃO		  --
------------------------------------

-- Selecionar pesquisas:

SELECT PE.data_ingresso, PE.data_saida, E.TITULO, E.AREA, E.DATA_CRIACAO, P.descricao, U.NOME AS Universidade, A.NOME AS AgenciaFomento, F.VALOR AS ValorFinanciado
FROM Pesq_Exec PE 
JOIN Execucao E
    ON pe.ID_Exec = e.ID
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
WHERE pe.ID_Pesq = 24; --:ID_PESQ

-- Selecionar por Area:

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
WHERE E.AREA = 'CARDIOLOGIA'; --:AREA
