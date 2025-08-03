/*

Exercicio BD – 1:

*/

-- 1) Criar um banco de dados chamado "vendas": 

create database vendas;

-- 2) Criar a tabela "Produto":

create table Produto(
codigo_produto integer primary key,
descricao_produto varchar(30),
preco_produto float);

describe Produto;

-- 3) Criar a tabela "Nota_Fiscal":

create table Nota_Fiscal(
numero_NF integer primary key,
data_NF date,
valor_NF float);


-- 4) Criar a tabela "Itens":

create table Itens(
produto_codigo_produto integer,
nota_fiscal_numero_NF integer,
num_item integer,
qtde_item integer);

-- 5) Alterar o campo Descricao_Produto da tabela Produto para o tipo Varchar(50):

alter table Produto
modify descricao_produto varchar(50);

-- 6) Alterar a tabela Nota_Fiscal, adicionando o campo ICMS, do tipo float depois do campo Numero_NF:

alter table Nota_fiscal
add column ICMS float 
after numero_NF;

-- 7) Alterar a tabela Produto, adicionando o campo Peso, do tipo float:

alter table Produto
add column Peso float;

-- 8) Fazer com que a chave primária da tabela Itens deixe de ser composta por codigo do produto mais numero da nota fiscal e passe a ser Num_Item:

alter table Itens
drop primary key;

desc Itens;

alter table Itens
add primary key (num_item);

-- 9) Apresentar a estrutura da tabela Produto:

describe Produto;

-- 10) Apresentar a estrutura da tabela Nota_Fiscal:

describe Nota_Fiscal;

-- 11) Alterar o nome do campo Valor_NF da tabela Nota_Fiscal para ValorTotal_NF: 

alter table Nota_Fiscal
change valor_NF ValorTotal_NF float;

alter table Nota_Fiscal
change  column valor_NF ValorTotal_NF float;

/* 
Usando “change” é necessário incluir ao final o tipo de dado da coluna. 
*/

alter table Nota_Fiscal
rename column valor_NF to ValorTotal_NF;

/* 
Usando “reaname to” não é necessário incluir o tipo de dado ao final. 
*/

-- 12) Remover o campo Data_NF da tabela Nota_Fiscal:

alter table Nota_Fiscal
drop column Data_Nf;

describe Nota_Fiscal;

-- 13) Remover a tabela Itens do modelo de dados: 

drop table Itens

-- 14) Alterar o nome da tabela Nota_Fiscal para Venda: 

alter table Nota_Fiscal
rename to Venda;

describe Venda;

rename table Nota_Fiscal
To Venda;





