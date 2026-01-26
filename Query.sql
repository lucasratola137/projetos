



#agregação média apenas para validação
SELECT 
  a.cluster,
  avg(a.renda_anual) as media_renda,
  avg(a.pontuacao_gasto) as media_gasto
FROM projetocluster.clientes_segmentados a
GROUP BY a.cluster;

#query utilizada como fonte de dado para conexão com o Looker Studio
SELECT 
a.*, 
CASE
WHEN a.cluster = 2 THEN 'Ouro'
WHEN a.cluster = 1 THEN 'Prata'
WHEN a.cluster = 0 THEN 'Bronze'
ELSE 'not found'
END AS tipo_cliente
FROM projetocluster.clientes_segmentados a
ORDER BY a.idCliente ASC;
