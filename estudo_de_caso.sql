show databases;

CREATE DATABASE supermercado;

CREATE TABLE tbl_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL,
    data_nascimento_cliente DATE,
    email_cliente VARCHAR(100),
    cpf_cliente VARCHAR(14) UNIQUE,
    fk_telefone_cliente INT,
    fk_endereco_cliente INT
);

CREATE TABLE tbl_telefone_cliente (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero_telefone VARCHAR(20),
    fk_id_cliente_tbl_cliente INT
);

CREATE TABLE tbl_endereco_cliente (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_cliente_tbl_cliente INT,
    cep VARCHAR(10),
    logradouro VARCHAR(255),
    numero_predial VARCHAR(15),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);

CREATE TABLE tbl_colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador VARCHAR(255) NOT NULL,
    fk_endereco_colaborador INT,
    data_nascimento_colaborador DATE,
    fk_telefone_colaborador INT,
    cargo_colaborador VARCHAR(100),
    data_admissao_colaborador DATE,
    salario_atual_colaborador DECIMAL(10 , 2 ),
    departamento_colaborador VARCHAR(50)
);

CREATE TABLE tbl_endereco_colaborador (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_colaborador_tbl_colaborador INT,
    cep VARCHAR(10),
    logradouro VARCHAR(255),
    numero_predial VARCHAR(15),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);

CREATE TABLE tbl_telefone_colaborador (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero_telefone VARCHAR(20) NOT NULL,
    fk_id_colaborador_tbl_colaborador INT
);

CREATE TABLE tbl_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto TEXT,
    preco_atual_produto DECIMAL(8 , 2 ) NOT NULL,
    qtd_estoque DECIMAL(5 , 2 ),
    categoria_produto VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_produto INT,
    FOREIGN KEY (fk_id_produto)
        REFERENCES tbl_produto (id_produto),
    qtd_vendida DECIMAL(5 , 2 ),
    preco_unitario DECIMAL(5 , 2 ),
    subtotal DECIMAL(10 , 2 ),
    fk_id_colaborador INT,
    FOREIGN KEY (fk_id_colaborador)
        REFERENCES tbl_colaboradores (id_colaborador),
    fk_id_cliente INT,
    FOREIGN KEY (fk_id_cliente)
        REFERENCES tbl_clientes (id_cliente)
);

ALTER TABLE tbl_clientes
	ADD FOREIGN KEY (fk_telefone_cliente) REFERENCES tbl_telefone_cliente(id_telefone),
    ADD FOREIGN KEY (fk_endereco_cliente) REFERENCES tbl_endereco_cliente(id_endereco)
;

ALTER TABLE tbl_telefone_cliente
	ADD FOREIGN KEY (fk_id_cliente_tbl_cliente) REFERENCES tbl_clientes(id_cliente)
;

ALTER TABLE tbl_endereco_cliente
	ADD  FOREIGN KEY (fk_id_cliente_tbl_cliente) REFERENCES tbl_clientes(id_cliente)
;

ALTER TABLE tbl_colaboradores
	ADD FOREIGN KEY (fk_endereco_colaborador) REFERENCES tbl_endereco_colaborador(id_endereco),
    ADD FOREIGN KEY (fk_telefone_colaborador) REFERENCES tbl_telefone_colaborador(id_telefone)
;

ALTER TABLE tbl_endereco_colaborador
	ADD FOREIGN KEY (fk_id_colaborador_tbl_colaborador) REFERENCES tbl_colaboradores(id_colaborador)
;

ALTER TABLE tbl_telefone_colaborador
	ADD FOREIGN KEY (fk_id_colaborador_tbl_colaborador) REFERENCES tbl_colaboradores(id_colaborador) 
;

/* Inserindo dados nas tabelas de clientes*/
INSERT INTO tbl_clientes (id_cliente, nome_cliente, data_nascimento_cliente, email_cliente, cpf_cliente)
VALUES 
(1, "Devan Marçal", '1986-12-27', "devan.marcal@gmail.com", "123.456.789-12" ),
(2, "José da Silva", '1930-01-01', "jose@example.com", "123.654.987-21" );

INSERT INTO supermercado.tbl_endereco_cliente (id_endereco, fk_id_cliente_tbl_cliente, cep, logradouro, numero_predial, cidade, estado)
VALUES 
(1, 1, "83502-140", "Rua Jorge da Silva", "31", "Almirante Tamandaré", "PR"),
(2, 2, "12345-789", "Rua Sei lá", "S/N", "São Paulo", "SP");

INSERT INTO supermercado.tbl_telefone_cliente (id_telefone, numero_telefone, fk_id_cliente_tbl_cliente)
VALUES
(1, "(41)999158842", 1),
(2, "(11)9854-5598", 2);

UPDATE supermercado.tbl_clientes
SET fk_telefone_cliente = 1, fk_endereco_cliente = 1
WHERE id_cliente = 1;

UPDATE supermercado.tbl_clientes
SET fk_telefone_cliente = 2, fk_endereco_cliente = 2
WHERE id_cliente = 2;

/* Inserindo dados nas tabelas de colaboradores*/
INSERT INTO supermercado.tbl_colaboradores(id_colaborador, 
	nome_colaborador, data_nascimento_colaborador, 
    cargo_colaborador, data_admissao_colaborador, salario_atual_colaborador, departamento_colaborador)
VALUES
(1, "Sabrina Silva", '2000-10-15', "caixa", '2024-11-02', 1200.00, "VENDAS"),
(2, "Márcia Oliveira", '1995-12-18', "Supervisor", '2024-11-01', '1600.00', "Supervisão");

INSERT INTO supermercado.tbl_endereco_colaborador(id_endereco, fk_id_colaborador_tbl_colaborador, 
			cep, logradouro, numero_predial, cidade, estado)
VALUES
(1, 1, "12354-546", "Rua da Sabrina", "100", "Botucatu", "SP"),
(2, 2, "12365-987", "Rua da Márcia", "101", "Belém", "PA");

INSERT INTO supermercado.tbl_telefone_colaborador(id_telefone, numero_telefone, fk_id_colaborador_tbl_colaborador)
VALUES
(1, "(11)9548-2544", 2),
(2, "(12)2456-8458", 1);

UPDATE supermercado.tbl_colaboradores
SET fk_endereco_colaborador = 1, fk_telefone_colaborador = 2
WHERE id_colaborador = 1;

UPDATE supermercado.tbl_colaboradores
SET fk_endereco_colaborador = 2, fk_telefone_colaborador = 1
WHERE id_colaborador = 2;

/* INSERINDO PRODUTOS */ 
INSERT INTO supermercado.tbl_produto(id_produto, nome_produto, descricao_produto, preco_atual_produto, qtd_estoque, categoria_produto)
VALUES
(1, "Arroz Tio Urbano", "Arroz Tio Urbano, 2kg, tipo branco, etc", '14.99', 100, "Alimentos"),
(2, "Feijão Pontarollo Premium", "Feijão Pontarollo Premium, tipo Carioca, 1kg", '6.49', 58, "Alimentos"),
(3, "Qboa", "Água Sanitária Qboa 2 Litros", '6.89', 10 , "Limpeza");

/* INSERINDO VENDA*/
INSERT INTO supermercado.tbl_vendas(id_venda, fk_id_produto, qtd_vendida, preco_unitario, subtotal, fk_id_colaborador, fk_id_cliente)
VALUES
(1, 1, 10, '14.99', '149.90', 1, 2),
(2, 3, 1, '6.89', '6.89', 2, 1);
