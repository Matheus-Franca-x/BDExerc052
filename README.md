# BDExerc052
---
## links:
### [exercicio 7](#exercício-7)

### [exercicio 8](#exercício-8)

### [exercicio 9](#exercício-9)

### [exercicio 10](#exercício-10)

### [exercicio 11](#exercício-11)

### [exercicio 12](#exercício-12)
---

## Exercício 7:

### Clientes:
RG(PK)	|CPF	|Nome	|Logradouro	|Numero
-|-|-|-|-
29531844	|34519878040	|Luiz André	|R. Astorga	|500
13514996x	|84984285630	|Maria Luiza	|R. Piauí	|174
121985541	|23354997310	|Ana Barbara	|Av. Jaceguai	|1141
23987746x	|43587669920	|Marcos Alberto	|R. Quinze	|22

### Pedido:
Nota Fiscal(PK)	|Valor	|Data	|RG_Cliente(FK)
-|-|-|-
1001	|754	|2018-04-01	|121985541
1002	|350	|2018-04-02	|121985541
1003	|30	|2018-04-02	|29531844
1004	|1500	|2018-04-03	|13514996x

### Mercadoria:
Código(PK)	|Descrição	|Preço	|Qtd	|Cod_Fornecedor(FK)
-|-|-|-|-
10	|Mouse	|24	|30	|1
11	|Teclado	|50	|20	|1
12	|Cx. De Som	|30	|8	|2
13	|Monitor 17	|350	|4	|3
14	|Notebook	|1500	|7	|4

### Fornecedor:
Código(PK)	|Nome	|Logradouro	|Numero	|Pais	|Area	|Telefone	|CNPJ	|Cidade	|Transporte	|Moeda
-|-|-|-|-|-|-|-|-|-|-
1	|Clone	|Av. Nações Unidas	|12000	|BR	|55	|1141487000	|NULL	|São Paulo	|NULL	|R$
2	|Logitech	|28th Street	|100	|USA	|1	|2127695100	|NULL	|NULL	|Avião	|US$
3	|LG	|Rod. Castello Branco	|NULL	|BR	|55	|800664400	|4159978100001	|Sorocaba	|NULL	|R$
4	|PcChips	|Ponte da Amizade	|NULL	|PY	|595	|NULL	|NULL	|NULL	|Navio	|US$

1) Pede-se: (Quando o endereço concatenado não tiver número, colocar só o logradouro e o país, quando tiver colocar, também o número)
2) Nota: (CPF deve vir sempre mascarado no formato XXX.XXX.XXX-XX e RG Sempre com um traçao antes do último dígito (Algo como XXXXXXXX-X), mas alguns tem 8 e outros 9 dígitos)

## Consultar:
- 10% de desconto no pedido 1003
- 5% de desconto em pedidos com valor maior de R$700,00
- E atualizar aumento de 20% no valor de marcadorias com estoque menor de 10
- Data e valor dos pedidos do Luiz
- CPF, Nome e endereço concatenado do cliente de nota 1004
- País e meio de transporte da Cx. De som
- Nome e Quantidade em estoque dos produtos fornecidos pela Clone
- Endereço concatenado e telefone dos fornecedores do monitor. (Telefone brasileiro (XX)XXXX-XXXX ou XXXX-XXXXXX (Se for 0800), Telefone Americano (XXX)XXX-XXXX)
- Tipo de moeda que se compra o notebook
- Considerando que hoje é 03/02/2019, há quantos dias foram feitos os pedidos e, criar uma coluna que escreva Pedido antigo para pedidos feitos há mais de 6 meses e pedido recente para os outros
- Nome e Quantos pedidos foram feitos por cada cliente
- RG,CPF,Nome e Endereço dos cliente cadastrados que Não Fizeram pedidos


## Exercício 8:

### Cliente:
Codigo(PK)	|Nome	|Endereço	|Telefone	|Telefone Comercial
-|-|-|-|-
1	|Luis Paulo	|R. Xv de Novembro, 100	|45657878	
2	|Maria Fernanda	|R. Anhaia, 1098	|27289098	|40040090
3	|Ana Claudia	|Av. Voluntários da Pátria, 876	|21346548	
4	|Marcos Henrique	|R. Pantojo, 76	|51425890	|30394540
5	|Emerson Souza	|R. Pedro Álvares Cabral, 97	|44236545	|39389900
6	|Ricardo Santos	|Trav. Hum, 10	|98789878	

### Mercadoria:
Código(PK)	|Nome	|Corredor(FK)	|Tipo(FK)	|Valor
-|-|-|-|-
1001	|Pão de Forma	|101	|10001	|3.5
1002	|Presunto	|101	|10002	|2.0
1003	|Cream Cracker	|103	|10003	|4.5
1004	|Água Sanitária	|104	|10004	|6.5
1005	|Maçã	|105	|10005	|0.9
1006	|Palha de Aço	|106	|10006	|1.3
1007	|Lasanha	|107	|10007	|9.7

### Corredores:
Código(PK)	|Tipo(FK)	|Nome
-|-|-
101	|10001	|Padaria
102	|10002	|Calçados
103	|10003	|Biscoitos
104	|10004	|Limpeza
105		
106		
107	|10007	|Congelados

### Tipos de Mercadoria:
Código(PK)	|Nome
-|-
10001	|Pães
10002	|Frios
10003	|Bolacha
10004	|Clorados
10005	|Frutas
10006	|Esponjas
10007	|Massas
10008	|Molhos

### Compra:
Nota Fiscal(PK)	|Código Cliente(FK)	|Valor
-|-|-
1234	|2	|200
2345	|4	|156
3456	|6	|354
4567	|3	|19

## Consultar:
- Valor da Compra de Luis Paulo
- Valor da Compra de Marcos Henrique
- Endereço e telefone do comprador de Nota Fiscal = 4567
- Valor da mercadoria cadastrada do tipo " Pães"
- Nome do corredor onde está a Lasanha
- Nome do corredor onde estão os clorados

## Exercício 9:

### Estoque:
Código(PK)	|Nome(ÚNICO)	|Quantidade	|Valor(Valor > 0)	|Cód. Editora(FK)	|Cód. Autor(FK)
-|-|-|-|-|-
10001	|Sistemas Operacionais Modernos 	|4	|108.00	|1	|101
10002	|A Arte da Política	|2	|55.00	|2	|102
10003	|Calculo A	|12	|79.00	|3	|103
10004	|Fundamentos de Física I	|26	|68.00	|4	|104
10005	|Geometria Analítica	|1	|95.00	|3	|105
10006	|Gramática Reflexiva	|10	|49.00	|5	|106
10007	|Fundamentos de Física III	|1	|78.00	|4	|104
10008	|Calculo B	|3	|95.00	|3	|103

### Editora:
Código(PK)	|Nome	|site
-|-|-
1	|Pearson	|www.pearson.com.br
2	|Civilização Brasileira	
3	|Makron Books	|www.mbooks.com.br
4	|LTC	|www.ltceditora.com.br
5	|Atual	|www.atualeditora.com.br
6	|Moderna	|www.moderna.com.br

### Autor:
Código(PK)	|Nome	|Breve Biografia
-|-|-
101	|Andrew Tannenbaun	|Desenvolvedor do Minix
102	|Fernando Henrique Cardoso	|Ex-Presidente do Brasil
103	|Diva Marília Flemming	|Professora adjunta da UFSC
104	|David Halliday	|Ph.D. da University of Pittsburgh
105	|Alfredo Steinbruch	|Professor de Matemática da UFRS e da PUCRS
106	|Willian Roberto Cereja	|Doutorado em Lingüística Aplicada e Estudos da Linguagem
107	|William Stallings	|Doutorado em Ciências da Computacão pelo MIT
108	|Carlos Morimoto	|Criador do Kurumin Linux

### Compra:
Código(PK)|	Cod. Livro(PK)(FK)	|Qtd Comprada(Qtd > 0)	|Valor(Valor > 0)	|Data Compra(PK)
-|-|-|-|-
15051	|10003	|2	|158.00	|2020-07-04
15051	|10008	|1	|95.00	|2020-07-04
15051	|10004	|1	|68.00	|2020-07-04
15051	|10007	|1	|78.00	|2020-07-04
15052	|10006	|1	|49.00	|2020-07-05
15052	|10002	|3	|165.00	|2020-07-05
15053	|10001	|1	|108.00	|2020-07-05
15054	|10003	|1	|79.00	|2020-08-06
15054	|10008	|1	|95.00	|2020-08-06

## Consultar:
- Nome, valor unitário, nome da editora e nome do autor dos livros do estoque que foram vendidos. Não podem haver repetições.
- Nome do livro, quantidade comprada e valor de compra da compra 15051
- Nome do livro e site da editora dos livros da Makron books (Caso o site tenha mais de 10 dígitos, remover o www.).
- Nome do livro e Breve Biografia do David Halliday
- Código de compra e quantidade comprada do livro Sistemas Operacionais Modernos
- Quais livros não foram vendidos
- Quais livros foram vendidos e não estão cadastrados
- Nome e site da editora que não tem Livros no estoque (Caso o site tenha mais de 10 dígitos, remover o www.)
- Nome e biografia do autor que não tem Livros no estoque (Caso a biografia inicie com Doutorado, substituir por Ph.D.)
- O nome do Autor, e o maior valor de Livro no estoque. Ordenar por valor descendente
- O código da compra, o total de livros comprados e a soma dos valores gastos. Ordenar por Código da Compra ascendente.
- O nome da editora e a média de preços dos livros em estoque.Ordenar pela Média de Valores ascendente.
- O nome do Livro, a quantidade em estoque o nome da editora, o site da editora (Caso o site tenha mais de 10 dígitos, remover o www.), criar uma coluna status onde:
  - Caso tenha menos de 5 livros em estoque, escrever Produto em Ponto de Pedido
  - Caso tenha entre 5 e 10 livros em estoque, escrever Produto Acabando
  - Caso tenha mais de 10 livros em estoque, escrever Estoque Suficiente
  - A Ordenação deve ser por Quantidade ascendente
- Para montar um relatório, é necessário montar uma consulta com a seguinte saída: Código do Livro, Nome do Livro, Nome do Autor, Info Editora (Nome da Editora + Site) de todos os livros
  - Só pode concatenar sites que não são nulos
- Codigo da compra, quantos dias da compra até hoje e quantos meses da compra até hoje
- O código da compra e a soma dos valores gastos das compras que somam mais de 200.00

## Exercício 10:

### Medicamentos:
Código(PK)  	|Nome	 |Apresentação  	 |Unidade de Cadastro  	 |Preço Proposto (R$)
-|-|-|-|-
1	 |Acetato de medroxiprogesterona  	 |150 mg/ml  	 |Ampola  	|6.700
2	 |Aciclovir  	 |200mg/comp.  	 |Comprimido  	|0.280
3	 |Ácido Acetilsalicílico  	 |500mg/comp.  	 |Comprimido  	|0.035
4	 |Ácido Acetilsalicílico  	 |100mg/comp.  	 |Comprimido  	|0.030
5	 |Ácido Fólico  	 |5mg/comp.  	 |Comprimido  	|0.054
6	 |Albendazol  	 |400mg/comp. mastigável  	 |Comprimido  	|0.560
7	 |Alopurinol  	 |100mg/comp.  	 |Comprimido  	|0.080
8	 |Amiodarona  	 |200mg/comp.  	 |Comprimido  	|0.200
9	 |Amitriptilina(Cloridrato)  	 |25mg/comp.  	 |Comprimido  	|0.220
10	 |Amoxicilina  	 |500mg/cáps.  	 |Cápsula  	|0.190

### Cliente:
CPF(PK)	|Nome	|Rua	|N°	|Bairro	|Telefone
-|-|-|-|-|-
34390898700	|Maria Zélia	|Anhaia	|65	|Barra Funda	|92103762
21345986290	|Roseli Silva	|Xv. De Novembro	|987	|Centro	|82198763
86927981825	|Carlos Campos	|Voluntários da Pátria	|1276	|Santana	|98172361
31098120900	|João Perdizes	|Carlos de Campos	|90	|Pari	|61982371

### Venda:
Nota Fiscal(PK)	|CPF_cliente(PK)(FK)	|Código_Medicamento(PK)(FK)	|Quantidade	|Valor Total	|Data
-|-|-|-|-|-
31501	|86927981825	|10	|3	|0.57	|2020-11-01
31501	|86927981825	|2	|10	|2.8	|2020-11-01
31501	|86927981825	|5	|30	|1.05	|2020-11-01
31501	|86927981825	|8	|30	|6.6	|2020-11-01
31502	|34390898700	|8	|15	|3	|2020-11-01
31502	|34390898700	|2	|10	|2.8	|2020-11-01
31502	|34390898700	|9	|10	|2.2	|2020-11-01
31503	|31098120900	|1	|20	|134	|2020-11-02

## Consultar:
- Nome, apresentação, unidade e valor unitário dos remédios que ainda não foram vendidos. Caso a unidade de cadastro seja comprimido, mostrar Comp.
- Nome dos clientes que compraram Amiodarona
- CPF do cliente, endereço concatenado, nome do medicamento (como nome de remédio),  apresentação do remédio, unidade, preço proposto, quantidade vendida e valor total dos remédios vendidos a Maria Zélia
- Data de compra, convertida, de Carlos Campos

## Alterar:
- O nome da  Amitriptilina(Cloridrato) para Cloridrato de Amitriptilina

## Exercício 11:

### Planos de Saúde:
Código(PK)	|Nome	|Telefone
-|-|-
1234	|Amil	|41599856
2345	|Sul América	|45698745
3456	|Unimed	|48759836
4567	|Bradesco Saúde	|47265897
5678	|Intermédica	|41415269

### Paciente:
CPF(PK)	|Nome	|Rua	|Número	|Bairro	|Telefone	|Plano de Saúde(FK)
-|-|-|-|-|-|-
85987458920	|Maria Paula	|R. Voluntários da Pátria	|589	|Santana	|98458741	|2345
87452136900	|Ana Julia	  |R. XV de Novembro	|657	|Centro	|69857412	|5678
23659874100	|João Carlos	|R. Sete de Setembro	|12	|República	|74859632	|1234
63259874100	|José Lima 	  |R. Anhaia	|768	|Barra Funda	|96524156	|2345

### Médico:
Código(PK)	|Nome	|Especialidade	|Plano de Saúde(FK)
-|-|-|-
1	|Claudio	|Clínico Geral	|1234
2	|Larissa	|Ortopedista	|2345
3	|Juliana	|Otorrinolaringologista	|4567
4	|Sérgio	|Pediatra	|1234
5	|Julio	|Clínico Geral	|4567
6	|Samara	|Cirurgião	|1234

### Consulta:
Médico(PK)(FK)	|Paciente(PK)(FK)	|DataHora(PK)	|Diagnóstico
-|-|-|-
1	|85987458920	|2021-02-10 10:30:00	|Gripe
2	|23659874100	|2021-02-10 11:00:00	|Pé Fraturado
4	|85987458920	|2021-02-11 14:00:00	|Pneumonia
1	|23659874100	|2021-02-11 15:00:00	|Asma
3	|87452136900	|2021-02-11 16:00:00	|Sinusite
5	|63259874100	|2021-02-11 17:00:00	|Rinite
4	|23659874100	|2021-02-11 18:00:00	|Asma
5	|63259874100	|2021-02-12 10:00:00	|Rinoplastia

## Consultar:
- Nome e especialidade dos médicos da Amil
- Nome, Endereço concatenado, Telefone e Nome do Plano de Saúde de todos os pacientes
- Telefone do Plano de  Saúde de Ana Júlia
- Plano de Saúde que não tem pacientes cadastrados
- Planos de Saúde que não tem médicos cadastrados
- Data da consulta, Hora da consulta, nome do médico, nome do paciente e diagnóstico de todas as consultas
- Nome do médico, data e hora de consulta e diagnóstico de José Lima
- Diagnóstico e Quantidade de consultas que aquele diagnóstico foi dado (Coluna deve chamar qtd)
- Quantos Planos de Saúde que não tem médicos cadastrados

## CRUD:
- Alterar o nome de João Carlos para João Carlos da Silva
- Deletar o plano de Saúde Unimed
- Renomear a coluna Rua da tabela Paciente para Logradouro
- Inserir uma coluna, na tabela Paciente, de nome data_nasc e inserir os valores (1990-04-18,1981-03-25,2004-09-04 e 1986-06-18) respectivamente

## Exercício 12:

### Planos:
CodPlano(PK)	|NomePlano	|ValorPlano
-|-|-
1	|100 Minutos	|80
2	|150 Minutos	|130
3	|200 Minutos	|160
4	|250 Minutos	|220
5	|300 Minutos	|260
6	|600 Minutos	|350

### Servicos:
CodServico(PK)	|NomeServico	|ValorServico
-|-|-
1	|100 SMS	|10
2	|SMS Ilimitado	|30
3	|Internet 500 MB	|40
4	|Internet 1 GB	|60
5	|Internet 2 GB	|70

### Cliente:
CodCliente(PK)	|NomeCliente	|DataInicio
-|-|-
1234	|Cliente A	|2012-10-15
2468	|Cliente B	|2012-11-20
3702	|Cliente C	|2012-11-25
4936	|Cliente D	|2012-12-01
6170	|Cliente E	|2012-12-18
7404	|Cliente F	|2013-01-20
8638	|Cliente G	|2013-01-25

### Contratos:
CodCliente(PK)(FK)	|CodPlano(PK)(FK)	|CodServico(PK)(FK)	|Status	|Data(PK)
-|-|-|-|-
1234	|3	|1	|E	|2012-10-15
1234	|3	|3	|E	|2012-10-15
1234	|3	|3	|A	|2012-10-16
1234	|3	|1	|A	|2012-10-16
2468	|4	|4	|E	|2012-11-20
2468	|4	|4	|A	|2012-11-21
6170	|6	|2	|E	|2012-12-18
6170	|6	|5	|E	|2012-12-19
6170	|6	|2	|A	|2012-12-20
6170	|6	|5	|A	|2012-12-21
1234	|3	|1	|D	|2013-01-10
1234	|3	|3	|D	|2013-01-10
1234	|2	|1	|E	|2013-01-10
1234	|2	|1	|A	|2013-01-11
2468	|4	|4	|D	|2013-01-25
7404	|2	|1	|E	|2013-01-20
7404	|2	|5	|E	|2013-01-20
7404	|2	|5	|A	|2013-01-21
7404	|2	|1	|A	|2013-01-22
8638	|6	|5	|E	|2013-01-25
8638	|6	|5	|A	|2013-01-26
7404	|2	|5	|D	|2013-02-03

## Info:
-> Status de contrato A(Ativo), D(Desativado), E(Espera)

-> Um plano só é válido se existe pelo menos um serviço associado a ele

## Consultar:
- O nome do cliente, o nome do plano, a quantidade de estados de contrato (sem repetições) por contrato, dos planos cancelados, ordenados pelo nome do cliente
- O nome do cliente, o nome do plano, a quantidade de estados de contrato (sem repetições) por contrato, dos planos não cancelados, ordenados pelo nome do cliente
- O nome do cliente, o nome do plano, e o valor da conta de cada contrato que está ou esteve ativo, sob as seguintes condições:
  - A conta é o valor do plano, somado à soma dos valores de todos os serviços
  - Caso a conta tenha valor superior a R$400.00, deverá ser incluído um desconto de 8%
  - Caso a conta tenha valor entre R$300,00 a R$400.00, deverá ser incluído um desconto de 5%
  - Caso a conta tenha valor entre R$200,00 a R$300.00, deverá ser incluído um desconto de 3%
  - Contas com valor inferiores a R$200,00 não tem desconto
- O nome do cliente, o nome do serviço, e a duração, em meses (até a data de hoje) do serviço, dos cliente que nunca cancelaram nenhum plano
