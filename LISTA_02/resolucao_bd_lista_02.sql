/* 

Exercicio BD - 2:

*/

** Criar a Tabela duplicata (contas a receber) **

create table duplicata;

insert into duplicata
(nome, numero, valor, vencimento, banco)
values
('ABC PAPELARIA', '100100', '5000.00', '2017-01-20', 'ITAU'),
('LIVRARIA FERNANDES', '100110', '2500.00', '2017-01-22', 'ITAU'),
('LIVRARIA FERANDES', '100120', '1500.00', '2016-10-15', 'BRADESCO'),
('ABC PAPELARIA', '100130', '8000.00', '2016-10-15', 'SANTANDER'),
('LER E SABER', '200120', '10500.00', '2018-04-26', 'BANCO DO BRASIL'),
('LIVROS E CIA', '200125', '2000.00', '2018-04-26', 'BANCO DO BRASIL'),
('LER E SABER', '200130', '11000.00', '2018-09-26', 'ITAU'),
('PAPELARIA SILVA', '250350', '1500.00', '2018-01-26', 'BRADESCO'),
('LIVROS MM', '250360', '500.00', '2018-12-18', 'SANTANDER'),
('LIVROS MM', '250370', '3400.00', '2018-04-26', 'SANTANDER'),
('PAPELARIA SILVA', '250380', '3500.00', '2018-04-26', 'BANCO DO BRASIL'),
('LIVROS E CIA', '453360', '1500.00', '2018-05-15', 'ITAU'),
('LIVROS MM', '453365', '5400.00', '2018-06-15', 'BRADESCO'),
('PAPELARIA SILVA', '453370', '2350.00', '2017-12-27', 'ITAU'),
('LIVROS E CIA', '453380', '1550.00', '2017-12-27', 'BANCO DO BRASIL'),
('ABC PAPELARIA', '980130', '4000.00', '2016-12-11', 'ITAU'),
('LIVRARIA FERNANDES', '770710', '2500.00', '2016-11-15', 'SANTANDER'),
('ABC PAPELARIA', '985001', '3000.00', '2016-09-11', 'ITAU'),
('PAPEL E AFINS', '985002', '2500.00', '2016-03-12', 'SANTANDER'),
('LER E SABER', '888132', '2500.00', '2017-03-05', 'ITAU');


-- 1) Listar nome, vencimento e valor de cada duplicata da tabela

select nome, vencimento, valor
from duplicata;

-- 2) Apresentar o número das duplicatas depositadas no Banco Itaú.

select numero
from duplicata
where banco = 'ITAU';

-- 3) Apresentar o número de duplicatas depositadas no Banco Itaú.

select count(*)
from duplicata
where banco = 'ITAU';

-- 4) Quais são as duplicatas (número, vencimento, valor e nome) que vence no ano de 2017.

select nome, numero, vencimento, valor
from duplicata
where year(vencimento) = '2017';

select nome, numero, vencimento, valor
from duplicata
where vencimento between '2017-01-01' and '2017-12-31';

-- 5) Apresentar as duplicatas (número, vencimento, valor e nome) que não estão depositadas nos bancos Itaú e Santander.

select nome, numero, vencimento, valor
from duplicata
where banco != 'ITAU' and banco != 'SANTANDER';

select nome, numero, vencimento, valor
from duplicata
where banco <> 'ITAU'and banco <> 'SATANDER';

-- 6) Quando é o valor da dívida do cliente PAPELARIA SILVA, e quais são as duplicatas?

select sum(valor)
from duplicata
where nome = 'PAPELARIA SILVA';

select numero
from duplicata
where nome = 'PAPELARIA SILVA';

-- 7) Rertirar da tabela a duplicata 770710 do cliente LIVRARIA FERNANDES, por ter sido devidamente quitada. 

delete from duplicata
where numero = '770710';

-- 8) Apresentar uma listagem em ordem alfabética por nome do cliente de todos os campos da tabela. 

select nome, numero, valor, vencimento, banco
from duplicata
order by nome;

-- 9) Apresentar uma listagem em ordem da data de vencimento com o nome do cliente, banco, valor e vencimento.

select nome, banco, valor, vencimento
from duplicata
order by vencimento;

-- 10) As duplicatas do Banco do Brasil foram transferidas para o Santader. Proceder o ajuste dos registros. 

update duplicata
set banco = 'Santander'
where banco = 'Banco do Brasil';

-- 11) Quais são os clientes que possuem suas duplicatas depositadas no Banco Bradesco?

select nome, banco
from duplicata
where banco = 'Bradesco';

-- 12) Qual é a previsão de recebimento no período de 01/01/2016 até 31/12/2016. 

select sum(valor) as Previsao_Receb_2016
from duplicata
where year(vencimento) = '2016';

-- 13) Quanto a empresa tem para receber no período de 01/08/2016 até 30/08/2016?

select sum(valor) as Prev_Recec_Mes_08
from duplicata
where vencimento = '2016-08-01' and vencimento = '2016-08-31';

SELECT SUM(valor) AS SOMA_VALORES FROM duplicata
WHERE Vencimento >= '2016/08/01' AND Vencimento <= '2016/08/30';

SELECT SUM(Valor) AS SOMA_VALORES FROM duplicata
WHERE MONTH(Vencimento) = 08 AND YEAR(Vencimento) = 2016;

-- 14) NÃ0 FAZER 

-- 15) Acrescentar uma multa de 15% para todos os títulos que se encontram vencidos no período de 01/01/2016 até 31/12/2016.

-- 16) Acrescentar uma multa de 5% para todos os títulos vencidos entre 01/01/2016 até 31/12/2016. 

-- 17) Qual é a média aritmética dos valores das duplicatas do ano de 2016?

select avg(valor) as media_valores_2016
from duplicata
where vencimento >= '2016-01-01' and vencimento <= '2016-12-31';

SELECT CONCAT('R$ ', FORMAT(AVG(Valor), 2)) AS Média_Valores_2016 FROM duplicata
WHERE YEAR(Vencimento) = 2016;

-- 18) Exiba as duplicatas e nome dos respectivos clientes que possuem duplicatas com valor superior a 10.000,00 ?

select nome, numero, valor
from duplicata
where valor > 10000.00;

SELECT Nome, Numero, CONCAT('R$ ', FORMAT(Valor, 2)) AS Valor, DATE_FORMAT(Vencimento, '%d/%m/%Y') AS Vencimento, Banco
FROM duplicata
WHERE valor > 10000;

-- 19) Qual o valor das duplicatas lançadas para o banco Santander?

select sum(valor) as Saldo_Total_Santander
from duplicata
where banco = 'SANTANDER';

SELECT CONCAT('R$ ', FORMAT(SUM(valor), 2)) AS Valor_Total, UCASE(Banco) AS Banco FROM duplicata
WHERE Banco = 'santander'
GROUP BY Banco;

-- 20) Quais são os clientes que possuem suas duplicatas depositadas nos bancos Bradesco ou Itaú?

select nome, banco
from duplicata
where banco = 'BRADESCO' or banco = 'ITAU';






