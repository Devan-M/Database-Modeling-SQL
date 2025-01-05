CREATE DATABASE universidade;

USE universidade;

CREATE TABLE tbl_alunos(
	matricula VARCHAR(15) NOT NULL,
	nome VARCHAR(100),
	rua VARCHAR(30),
	cidade VARCHAR(60),
	PRIMARY KEY(matricula));

CREATE TABLE tbl_disciplinas(
	id_disciplina VARCHAR(10) NOT NULL,
	nome VARCHAR(60),
	carga_horaria TIME,
	PRIMARY KEY(id_disciplina));

CREATE TABLE tbl_professores(
	id_professor VARCHAR(10) NOT NULL,
	nome VARCHAR(100),
	rua VARCHAR(30),
	cidade VARCHAR(60),
	PRIMARY KEY(id_professor));

CREATE TABLE tbl_turma(
	id_disciplina VARCHAR(10) NOT NULL,
	turma_cod INTEGER NOT NULL,
	id_professor VARCHAR(10) NOT NULL,
	ano INTEGER NOT NULL,
	horario VARCHAR(20),
	PRIMARY KEY(id_disciplina, turma_cod, id_professor, ano),
	FOREIGN KEY(id_disciplina) REFERENCES tbl_disciplinas(id_disciplina),
	FOREIGN KEY(id_professor) REFERENCES tbl_professores(id_professor));

CREATE TABLE tbl_historico(
	matricula VARCHAR(15) NOT NULL,
	id_disciplina VARCHAR(10) NOT NULL,
	turma_cod INTEGER NOT NULL,
	id_professor VARCHAR(10) NOT NULL,
	ano INTEGER NOT NULL,
	frequencia INTEGER NOT NULL,
	nota FLOAT,
	PRIMARY KEY(matricula, id_disciplina, turma_cod, id_professor, ano),
	FOREIGN KEY(id_disciplina, turma_cod, id_professor, ano) REFERENCES tbl_turma(id_disciplina, turma_cod, id_professor, ano),
	FOREIGN KEY(matricula) REFERENCES tbl_alunos(matricula));

/* INSERINDO REGISTROS NAS TABELAS: */

INSERT INTO tbl_alunos 
	VALUES
		(2023010101, 'JOSE DE OLIVEIRA', 'RUA DAS OLIVEIRAS',  'CURITIBA'),
		(2023010102, 'JOÃO JOSÉ', 'AVENIDA RUY BARBOSA', 'SÃO JOSÉ DOS PINHAIS'),
		(2023010103, 'MARIA MADALENA', 'RUA DAS BRINCADEIRAS', 'ALMIRANTE TAMANDARÉ'),
		(2023010104, 'MARIA DAS DORES', 'RUA DAS QUEDAS', 'FAZENDA RIO GRANDE'),
		(2023010105, 'ZÉ PEQUENO', 'RUA PRINCIPAL', 'COLOMBO'),
		(2023010106, 'CLAUDINEI DA SILVA', 'RUA DOS PROFESSORES', 'CURITIBA');

INSERT INTO tbl_disciplinas 
	VALUES
		('DB', 'DATABASE MODELLING', '100:00:00'), 
        	('AGL', 'AGILE METHODS', '90:00:00'),
      		('CPP', 'COMPUTATIONAL LOGIC USING PYTHON', '50:00:00'),
        	('ESG', 'ESG: SUSTENTABILIDADE DAS ORGANIZAÇÕES', '80:00:00');

INSERT INTO tbl_professores 
	VALUES
		(251099, 'LEONID', 'AVENIDA DAS TORRES', 'CURITIBA'),
	        (149988, 'VICTOR', 'AVENIDA SEN. SALGADO FILHO', 'CURITIBA'), 
	        (105298, 'LIGIA', 'AVENIDA RUI BARBOSA', 'SÃO JOSÉ DOS PINHAIS');

INSERT INTO tbl_turma 
	VALUES
		('DB', 1, 251099, 2023, '09H-10H'),
	        ('DB', 2, 251099, 2023, '13H-14H'),
	        ('AGL', 1, 105298, 2023, '08H-09H'), 
	        ('CPP', 1, 105298, 2023, '07H-08H'),
	        ('ESG', 1, 149988, 2023, '10H-11H');

INSERT INTO tbl_historico 
	VALUES
		(2023010101, 'DB', 1, 251099, 2023, 10, 5.74),
	        (2023010102, 'AGL', 1, 105298, 2023, 4, 10), 
	        (2023010103, 'CPP', 1, 105298, 2023, 5, 5),
	        (2023010104, 'ESG',1, 149988, 2023, 5, 6.2), 
	        (2023010105, 'DB', 2, 251099, 2023, 4, 4.5),
	        (2023010106, 'CPP', 1, 105298, 2023, 8, 5.5);
        
SELECT * FROM universidade.tbl_alunos;
SELECT * FROM universidade.tbl_disciplinas;
SELECT * FROM universidade.tbl_historico;
SELECT * FROM universidade.tbl_professores;
SELECT * FROM universidade.tbl_turma;
