select CLIENTE, ESTADO from relacional.clientes
where status != 'Platinum' and sexo = 'F';

SELECT * FROM information_schema.tables WHERE table_schema = 'relacional.clientes';

SELECT * FROM information_schema.columns WHERE table_name = 'relacional.clientes';

SELECT * FROM information_schema.columns WHERE table_schema = 'relacional.clientes';

SELECT idproduto, idvenda, quantidade, valorunitario, valortotal, desconto
	FROM relacional.itensvenda 
	ORDER BY valortotal;

SELECT COUNT(valortotal) AS CONTAGEM, 
		MAX(valortotal) AS TOTAL, 
		(MAX(valortotal)/COUNT(valortotal)) AS MEDIA 
		FROM relacional.itensvenda;

SELECT idproduto, idvenda, quantidade, valorunitario, valortotal, desconto
	FROM relacional.itensvenda
	ORDER BY DESCONTO 
	DESC LIMIT 10;

SELECT idproduto, idvenda, quantidade, valorunitario, valortotal, desconto
	FROM relacional.itensvenda
	ORDER BY DESCONTO DESC LIMIT 10;

select cliente, status, estado from relacional.clientes
	where cliente like 'Alb%';
	
select cliente, status, estado from relacional.clientes
	where status in ('Gold', 'Platinum') limit 5;
	
select cliente, status, estado from relacional.clientes
	where status not in ('Gold', 'Platinum') limit 5;

select v.idvendedor,vd.nome as vendedor, v.idcliente, v.total, c.cliente 
	from relacional.vendas as v, relacional.clientes as c, relacional.vendedores as vd
	where total between 8000 and 10000
	order by total desc limit 10
	
	
select v.idvendedor,vd.NOME AS VENDEDOR, v.idcliente, c.cliente, v.total 
	from  relacional.clientes AS c,relacional.vendas AS v
	INNER join relacional.vendedores as vd on (vd.idvendedor = v.idvendedor)
	where v.idcliente = c.idcliente  --compara
	and total between 8000 and 10000 --filtra entre 8000 a 10000
	order by total desc limit 10     --ordena com limite
	
select * from relacional.vendedores

select produto, nome as vendedor, sum(ftv.valortotal) as total
	from dimensional.fatovendas as ftv
	inner join  dimensional.dimensaoproduto on (dimensional.dimensaoproduto.chaveproduto = ftv.chaveproduto)
	inner join  dimensional.dimensaovendedor on (dimensional.dimensaovendedor.chavevendedor = ftv.chavevendedor) --Compara duas colunas
	group by produto, nome
	having sum(ftv.valortotal) > 100000 -- filtra acima de 100 mil
	order by total desc
	