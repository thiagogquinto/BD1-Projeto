DROP TABLE IF EXISTS COZINHEIRO_PRODUTO;
DROP TABLE IF EXISTS PEDIDO_PRODUTO;
DROP TABLE IF EXISTS PRODUTO_INGREDIENTE;
DROP TABLE IF EXISTS FORNECEDOR_INGREDIENTE;
DROP TABLE IF EXISTS GARCOM_CLIENTE;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS INGREDIENTE;
DROP TABLE IF EXISTS ENDERECO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS CONTA;
DROP TABLE IF EXISTS CAIXA;
DROP TABLE IF EXISTS MESA;
DROP TABLE IF EXISTS GARCOM;
DROP TABLE IF EXISTS COZINHEIRO;
DROP TABLE IF EXISTS FUNCIONARIO;


CREATE TABLE FUNCIONARIO(
	 nome VARCHAR(100),
     telefone CHAR(11),
     cpf CHAR(9),
     PRIMARY KEY(cpf)
);

CREATE TABLE COZINHEIRO(
	horas_trabalhadas TIME,
    salario_hora REAL,
    especialidade VARCHAR(100),
    cpf CHAR(9),
    PRIMARY KEY(cpf),
    FOREIGN KEY(cpf) REFERENCES FUNCIONARIO(cpf) ON DELETE CASCADE
);

CREATE TABLE GARCOM(
	senha INTEGER,
    id INTEGER,
    avaliacao ENUM('BOM', 'RUIM', 'REGULAR'),
    cpf CHAR(9),
    PRIMARY KEY(cpf),
    FOREIGN KEY(cpf) REFERENCES FUNCIONARIO(cpf) ON DELETE CASCADE
);

CREATE TABLE MESA(
	numero INTEGER,
    capacidade INTEGER,
    statu ENUM('Ocupada', 'Reservada', 'Livre'),
    PRIMARY KEY(numero)
);

CREATE TABLE CAIXA(
	numero INTEGER,
    saldo_inicial REAL,
    recebimento REAL,
    saldo_final REAL,
	PRIMARY KEY(numero)
);

CREATE TABLE CONTA(
	numero INTEGER,
    numero_caixa INTEGER,
    numero_mesa INTEGER,
    statu ENUM('Paga', 'Não Paga'),
    valor_total REAL,
    FOREIGN KEY(numero_mesa) REFERENCES MESA(numero),
    FOREIGN KEY(numero_caixa) REFERENCES CAIXA(numero),
    PRIMARY KEY(numero)
);

CREATE TABLE CLIENTE(
	numero_conta INTEGER,
	cpf CHAR(9),
    telefone CHAR(11),
    nome VARCHAR(100),
    FOREIGN KEY(numero_conta) REFERENCES CONTA(numero),
    UNIQUE(numero_conta),
    PRIMARY KEY(cpf)
);

CREATE TABLE FORNECEDOR(
	nome VARCHAR(100),
    telefone CHAR(11),
    cnpj INTEGER,
    PRIMARY KEY(cnpj)
);

CREATE TABLE ENDERECO(
	numero INTEGER,
    bairro VARCHAR(100),
    jardim VARCHAR(100),
    cnpj_f INTEGER,
    FOREIGN KEY(cnpj_f) REFERENCES FORNECEDOR(cnpj)  ON DELETE CASCADE,
    PRIMARY KEY(cnpj_f, numero)
);

CREATE TABLE INGREDIENTE(
	nome VARCHAR(100),
    qtde_estoque INTEGER,
	valor REAL,
    PRIMARY KEY(nome)
);

CREATE TABLE PEDIDO(
	numero INTEGER,
    hora TIME,
    descricao VARCHAR(100),
    numero_conta INTEGER,
    FOREIGN KEY(numero_conta) REFERENCES CONTA(numero),
    PRIMARY KEY(numero)
);

CREATE TABLE PRODUTO(
	nome VARCHAR(100),
    categoria ENUM('Bebida', 'Comida'),
    tempo_preparo TIME,
    preco REAL,
    PRIMARY KEY(nome)
);

CREATE TABLE GARCOM_CLIENTE(
	cpf_G CHAR(9),
    cpf_C CHAR(9),
    FOREIGN KEY(cpf_C) REFERENCES CLIENTE(cpf),
    FOREIGN KEY(cpf_G) REFERENCES GARCOM(cpf),
    PRIMARY KEY(cpf_C, cpf_G)
);

CREATE TABLE PEDIDO_PRODUTO(
	pedido_N INTEGER,
    nome_P VARCHAR(100),
    FOREIGN KEY(pedido_N) REFERENCES PEDIDO(numero),
    FOREIGN KEY(nome_P) REFERENCES PRODUTO(nome),
    PRIMARY KEY(nome_P, pedido_N)
);

CREATE TABLE PRODUTO_INGREDIENTE(
	qtde INTEGER,
    nome_P VARCHAR(100),
    nome_I VARCHAR(100),
    FOREIGN KEY(nome_P) REFERENCES PRODUTO(nome),
    FOREIGN KEY(nome_I) REFERENCES INGREDIENTE(nome),
    PRIMARY KEY(nome_P, nome_I)
);

CREATE TABLE FORNECEDOR_INGREDIENTE(
	nome_I VARCHAR(100),
	cnpj_F INTEGER,
	FOREIGN KEY(nome_I) REFERENCES INGREDIENTE(nome),
	FOREIGN KEY(cnpj_F) REFERENCES FORNECEDOR(cnpj),	
	PRIMARY KEY(nome_I, cnpj_F)
);


CREATE TABLE COZINHEIRO_PRODUTO(
	nome_P VARCHAR(100),
    cpf_C CHAR(9),
    FOREIGN KEY(nome_P) REFERENCES PRODUTO(nome),
    FOREIGN KEY(cpf_C) REFERENCES COZINHEIRO(cpf),
    PRIMARY KEY(nome_P, cpf_C)
);






    
