CREATE DATABASE hospital_plano
GO
USE hospital_plano
GO
CREATE TABLE plano_saude
(
    codigo INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone CHAR(13) NOT NULL
    PRIMARY KEY (codigo)
)
GO
CREATE TABLE paciente 
(
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    telefone CHAR(13) NOT NULL,
    plano_saude INT NOT NULL
    PRIMARY KEY (cpf)
    FOREIGN KEY (plano_saude) REFERENCES plano_saude(codigo)
)
GO
CREATE TABLE medico 
(
    codigo INT IDENTITY(1, 1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    plano_saude INT NOT NULL
    PRIMARY KEY (codigo)
    FOREIGN KEY (plano_saude) REFERENCES plano_saude(codigo)
)
GO
CREATE TABLE consulta
(
    codigo_medico INT NOT NULL,
    cpf_paciente CHAR(11) NOT NULL,
    datahora DATETIME NOT NULL,
    diagnostico VARCHAR(50) NOT NULL
    PRIMARY KEY (codigo_medico, cpf_paciente, datahora)
    FOREIGN KEY (codigo_medico) REFERENCES medico(codigo),
    FOREIGN KEY (cpf_paciente) REFERENCES paciente(cpf)
)

INSERT INTO plano_saude 
VALUES
(1234, 'Amil', '41599856'),
(2345, 'Sul América', '45698745'),
(3456, 'Unimed', '48759836'),
(4567, 'Bradesco Saúde', '47265897'),
(5678, 'Intermédica', '41415269')

INSERT INTO paciente 
VALUES
('85987458920', 'Maria Paula', 'R. Voluntários da Pátria', 589, 'Santana', '98458741', 2345),
('87452136900', 'Ana Julia', 'R. XV de Novembro', 657, 'Centro', '69857412', 5678),
('23659874100', 'João Carlos', 'R. Sete de Setembro', 12, 'República', '74859632', 1234),
('63259874100', 'José Lima', 'R. Anhaia', 768, 'Barra Funda', '96524156', 2345)

INSERT INTO medico 
VALUES
('Claudio', 'Clínico Geral', 1234),
('Larissa', 'Ortopedista', 2345),
('Juliana', 'Otorrinolaringologista', 4567),
('Sérgio', 'Pediatra', 1234),
('Julio', 'Clínico Geral', 4567),
('Samara', 'Cirurgião', 1234)

INSERT INTO consulta 
VALUES
(1, '85987458920', '2021-02-10 10:30:00', 'Gripe'),
(2, '23659874100', '2021-02-10 11:00:00', 'Pé Fraturado'),
(4, '85987458920', '2021-02-11 14:00:00', 'Pneumonia'),
(1, '23659874100', '2021-02-11 15:00:00', 'Asma'),
(3, '87452136900', '2021-02-11 16:00:00', 'Sinusite'),
(5, '63259874100', '2021-02-11 17:00:00', 'Rinite'),
(4, '23659874100', '2021-02-11 18:00:00', 'Asma'),
(5, '63259874100', '2021-02-12 10:00:00', 'Rinoplastia')

--Consultar:
--1) Nome e especialidade dos médicos da Amil.
SELECT m.nome, m.especialidade 
FROM medico m, plano_saude ps 
WHERE m.plano_saude = ps.codigo 
	AND ps.nome LIKE 'Amil'

--2) Nome, Endereço concatenado, Telefone e Nome do Plano de Saúde de todos os pacientes.
SELECT p.nome, CONCAT(p.rua, ' ', p.numero, ' ', p.bairro) AS endereco, p.telefone, ps.nome
FROM paciente p, plano_saude ps 
WHERE p.plano_saude = ps.codigo 

--3) Telefone do Plano de  Saúde de Ana Júlia.
SELECT ps.telefone, ps.nome, p.nome 
FROM paciente p, plano_saude ps 
WHERE p.plano_saude = ps.codigo
	AND p.nome LIKE 'Ana Julia'

--4) Plano de Saúde que não tem pacientes cadastrados.
SELECT ps.*
FROM plano_saude ps 
LEFT JOIN paciente p ON p.plano_saude = ps.codigo 
WHERE p.cpf IS NULL

--5) Planos de Saúde que não tem médicos cadastrados.
SELECT ps.*
FROM plano_saude ps 
LEFT JOIN medico m ON m.plano_saude = ps.codigo 
WHERE m.codigo IS NULL

--6) Data da consulta, Hora da consulta, nome do médico, nome do paciente e diagnóstico de todas as consultas.
SELECT 
CONVERT(VARCHAR, datahora, 103) AS data_consulta, 
CONVERT(VARCHAR, datahora, 108) AS hora_consulta,
m.nome, p.nome, c.diagnostico 
FROM consulta c, medico m, paciente p 
WHERE c.codigo_medico = m.codigo 
	AND c.cpf_paciente = p.cpf 

--7) Nome do médico, data e hora de consulta e diagnóstico de José Lima.
SELECT m.nome, 
CONVERT(VARCHAR, datahora, 103) AS data_consulta, 
CONVERT(VARCHAR, datahora, 108) AS hora_consulta, 
c.diagnostico 
FROM medico m, consulta c, paciente p 
WHERE p.cpf = c.cpf_paciente
	AND c.codigo_medico = m.codigo 
	AND p.nome LIKE 'José Lima'

--8) Diagnóstico e Quantidade de consultas que aquele diagnóstico foi dado (Coluna deve chamar qtd).
SELECT diagnostico, COUNT(diagnostico) AS qtd_diagnostico
FROM consulta
GROUP BY diagnostico 

--9) Quantos Planos de Saúde que não tem médicos cadastrados.
SELECT COUNT(ps.codigo) AS qtd_plano_sem_medico
FROM plano_saude ps 
LEFT JOIN medico m ON ps.codigo = m.plano_saude 
WHERE m.codigo IS NULL

--CRUD:
--10) Alterar o nome de João Carlos para João Carlos da Silva.
UPDATE paciente 
SET nome = 'João Carlos da Silva'
WHERE nome = 'João Carlos'

--11) Deletar o plano de Saúde Unimed.
DELETE plano_saude
WHERE nome = 'Unimed'

--12) Renomear a coluna Rua da tabela Paciente para Logradouro.
EXEC sp_rename 'paciente.rua', 'logradouro', 'COLUMN'

--13) Inserir uma coluna, na tabela Paciente, de nome data_nasc e inserir os valores (1990-04-18,1981-03-25,2004-09-04 e 1986-06-18) respectivamente.
ALTER TABLE paciente 
ADD data_nasc DATE

UPDATE paciente 
SET data_nasc = '1990-04-18'
WHERE nome LIKE 'João%'

UPDATE paciente 
SET data_nasc = '1981-03-25'
WHERE nome LIKE 'José%'

UPDATE paciente 
SET data_nasc = '2004-09-04'
WHERE nome LIKE 'Maria%'

UPDATE paciente 
SET data_nasc = '1986-06-18'
WHERE nome LIKE 'Ana%'
