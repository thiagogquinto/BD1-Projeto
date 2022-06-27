--  GitHub: https://github.com/thiagogquinto03/BD1-Projeto



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
     cpf CHAR(14),
     PRIMARY KEY(cpf)
);

CREATE TABLE COZINHEIRO(
	horas_trabalhadas INTEGER,
    salario_hora REAL,
    especialidade VARCHAR(100),
    cpf CHAR(14),
    PRIMARY KEY(cpf),
    FOREIGN KEY(cpf) REFERENCES FUNCIONARIO(cpf) ON DELETE CASCADE
);

CREATE TABLE GARCOM(
	senha INTEGER,
    id INTEGER,
    avaliacao ENUM('BOM', 'RUIM', 'REGULAR'),
    cpf CHAR(14),
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
	cpf CHAR(14),
    telefone CHAR(11),
    nome VARCHAR(100),
    FOREIGN KEY(numero_conta) REFERENCES CONTA(numero),
    UNIQUE(numero_conta),
    PRIMARY KEY(cpf)
);

CREATE TABLE FORNECEDOR(
	nome VARCHAR(100),
    telefone CHAR(11),
    cnpj CHAR(18),
    PRIMARY KEY(cnpj)
);

CREATE TABLE ENDERECO(
	numero INTEGER,
    rua VARCHAR(100),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    cnpj_f CHAR(18),
    FOREIGN KEY(cnpj_f) REFERENCES FORNECEDOR(cnpj)  ON DELETE CASCADE,
    PRIMARY KEY(cnpj_f, numero)
);

CREATE TABLE INGREDIENTE(
	nome VARCHAR(100),
    qtde_estoque VARCHAR(100),
	valor_unitario REAL,
    PRIMARY KEY(nome)
);

CREATE TABLE PEDIDO(
	numero INTEGER,
    hora TIME,
    descricao VARCHAR(500),
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
	cpf_G CHAR(14),
    cpf_C CHAR(14),
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
	qtde VARCHAR(200),
    nome_P VARCHAR(100),
    nome_I VARCHAR(100),
    FOREIGN KEY(nome_P) REFERENCES PRODUTO(nome),
    FOREIGN KEY(nome_I) REFERENCES INGREDIENTE(nome),
    PRIMARY KEY(nome_P, nome_I)
);

CREATE TABLE FORNECEDOR_INGREDIENTE(
	nome_I VARCHAR(100),
	cnpj_F CHAR(18),
	FOREIGN KEY(nome_I) REFERENCES INGREDIENTE(nome),
	FOREIGN KEY(cnpj_F) REFERENCES FORNECEDOR(cnpj),	
	PRIMARY KEY(nome_I, cnpj_F)
);


CREATE TABLE COZINHEIRO_PRODUTO(
	nome_P VARCHAR(100),
    cpf_C CHAR(14),
    FOREIGN KEY(nome_P) REFERENCES PRODUTO(nome),
    FOREIGN KEY(cpf_C) REFERENCES COZINHEIRO(cpf),
    PRIMARY KEY(nome_P, cpf_C)
);

INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Thiago Gariani', '44999599299', '183.067.107-38');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Lucas Matos', '44984512568', '938.916.311-03');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Mateus Vargas', '44954896541', '799.404.652-54');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Joao Lucas', '44965147820', '203.300.408-20');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Pedro Neves', '44995428166', '815.563.106-09');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Gabriela Silva', '44999998888', '255.016.120-38');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Julia Garcia', '44955558989', '552.626.700-83');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Maria Eduarda', '44988885252', '643.520.411-06');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Giovana Barbosa', '44977775418', '471.813.962-77');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Laura Andrade', '44944443214', '111.786.124-88');

INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Karla Beltrão', '44944783214', '111.986.134-98');


INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Gustavo Rocha', '44993253572', '354.217.077-17');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Luis Araujo', '44996566789','954.224.679-06');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Pedro Silva', '44994192516', '394.700,522-93');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Gustavo Souza', '44983346691', '715.070.466-26');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('André Ferreira', '44999599560', '234.890.424-17');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Ágatha Alves', '44952192362', '563.116.670-45');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Manuela Pereira', '44995568770', '273.652.687-27');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Sofia Alves', '44953493279', '723.894.592-42');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Larissa Oliveira', '44989504232', '763.338.178-72');
INSERT INTO FUNCIONARIO(nome, telefone, cpf) VALUES('Thaís Melo', '44950982040', '707.455.581-94');


INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(4, 11.30, 'Sobremesa', '111.986.134-98');

INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(4, 21.30, 'Sobremesa', '183.067.107-38');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(7, 21.99, 'Massas', '938.916.311-03');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(2, 10.50, 'Entrada', '799.404.652-54');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(9, 25.00, 'Bebida', '203.300.408-20');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(6, 22.30, 'Comida Vegana', '815.563.106-09');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(3, 14.50, 'Cozinha Criativa', '255.016.120-38');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(10, 20.00, 'Massas', '552.626.700-83');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(5, 15.00, 'Sobremesa', '643.520.411-06');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(11, 12.00, 'Frios', '471.813.962-77');
INSERT INTO COZINHEIRO(horas_trabalhadas, salario_hora, especialidade, cpf) VALUES(9, 10.00, 'Comida Vegana', '111.786.124-88');

INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(2380560, 1, 'Regular', '354.217.077-17');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(3388898, 2, 'Regular', '954.224.679-06');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(6815230, 3, 'Regular', '394.700,522-93');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(1254862, 4, 'Bom', '715.070.466-26');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(5675103, 5, 'Bom', '234.890.424-17');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(4586210, 6, 'Bom', '563.116.670-45');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(7562105, 7, 'Bom', '273.652.687-27');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(8201756, 8, 'Ruim', '723.894.592-42');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(9239514, 9, 'Ruim', '763.338.178-72');
INSERT INTO GARCOM(senha, id, avaliacao, cpf) VALUES(1052348, 10, 'Ruim', '707.455.581-94');

INSERT INTO MESA(numero, capacidade, statu) VALUES(1, 2, 'Livre');
INSERT INTO MESA(numero, capacidade, statu) VALUES(2, 6, 'Livre');
INSERT INTO MESA(numero, capacidade, statu) VALUES(3, 5, 'Livre');
INSERT INTO MESA(numero, capacidade, statu) VALUES(4, 4, 'Reservada');
INSERT INTO MESA(numero, capacidade, statu) VALUES(5, 8, 'Reservada');
INSERT INTO MESA(numero, capacidade, statu) VALUES(6, 3, 'Reservada');
INSERT INTO MESA(numero, capacidade, statu) VALUES(7, 4, 'Ocupada');
INSERT INTO MESA(numero, capacidade, statu) VALUES(8, 6, 'Ocupada');
INSERT INTO MESA(numero, capacidade, statu) VALUES(9, 2, 'Ocupada');
INSERT INTO MESA(numero, capacidade, statu) VALUES(10, 4, 'Ocupada');

INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(1, 0, 500.23, 500.23);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(2, 25.80, 658.21, 648.01);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(3, 125.56, 100.63, 226.19);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(4, 500.00, 445.82, 945.82);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(5, 200.70, 924.00, 1124.70);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(6, 1000.42, 314.14, 1314.56);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_final) VALUES(7, 850.21, 547.75, 1397.96);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_finaL) VALUES(8, 2000.65, 501.69, 2502.34);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_finaL) VALUES(9, 847.33, 292.47, 1139.80);
INSERT INTO CAIXA(numero, saldo_inicial, recebimento, saldo_finaL) VALUES(10, 1172.85, 485.67, 1658.52);

INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(23, 1, 9, 'Paga', 200.85);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(56, 2, 2, 'Não Paga', 100.22);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(14, 3, 8, 'Paga', 85.41);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(26, 4, 3, 'Não Paga', 69.75);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(120, 5, 5, 'Paga', 265.23);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(43, 6, 7, 'Não Paga', 78.62);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(75, 7, 4, 'Paga', 45.87);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(39, 8, 1, 'Não Paga', 120.78);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(99, 9, 6, 'Paga', 320.98);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(100, 10, 10, 'Não Paga', 145.78);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(10, 2, 10, 'Não Paga', 45.78);
INSERT INTO CONTA(numero, numero_caixa, numero_mesa, statu, valor_total) VALUES(13, 4, 7, 'Não Paga', 15.98);

INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(23, '364.651.182-62', 44996613814, 'Vitór Ferreira');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(56, '525.890.307-97', 44950518589, 'Alexandre Chitwood');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(14, '692.385.196-33', 44962047507, 'Ricardo McIntire');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(26, '835.002.463-11', 44999187714, 'Otávio Correia');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(120, '594.049.718-71', 44933138649, 'Douglas Costa');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(43, '906.532.753-31', 44969179824, 'Thaís Correia');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(75, '724.940.983-27', 44958665222, 'Livia Silva');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(39, '326.749.790-62', 44969537356, 'Gabrielly Sousa');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(99, '163.145.243-69', 44990998745, 'Isabelle Almeida');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(100, '360.451.332-42', 44987308547, 'Beatrice Castro');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(10, '619.431.202-50', 44987306888, 'Samuel Barbosa');
INSERT INTO CLIENTE(numero_conta, cpf, telefone, nome) VALUES(13, '522.071.718-92', 44922668547, 'Ágatha Fernandes');



INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Fortali Food', 4534796663, '98.998.537/0001-97');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Plena Alimentos', 4221431788, '63.809.275/0001-90');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Slice Alimentos', 4235687186, '46.650.574/0001-06');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Gala Food', 4122711592, '54.712.181/0001-08');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Palace Alimentos', 4622120680, '47.055.753/0001-68');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('AGROFOOD', 4537245674, '34.761.357/0001-04');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Feed Distribuidora', 4426160682, '23.240.919/0001-58');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Distribuidora Emporium', 4527421565, '42.954.260/0001-46');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Ambrosial Food', 4526864118, '51.819.536/0001-74');
INSERT INTO FORNECEDOR(nome, telefone, cnpj) VALUES('Spices Alimentos', 4324220456, '13.233.743/0001-38');

INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(208, 'Sueo Toda', 'Maringá', 'Vila Esperança', '98.998.537/0001-97');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(45, 'Nelson Borba', 'Curitiba', 'Cidade Industrial', '63.809.275/0001-90');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(98, 'Athanagildo Martins de Almeida', 'Ponta Grossa', 'Contorno', '46.650.574/0001-06');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(120, 'Jorge Mayer', 'Ponta Grossa', 'Colônia Dona Luíza', '54.712.181/0001-08');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(65, 'Serra da Carioca', 'Londrina', 'Gávea', '47.055.753/0001-68');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(178, 'Gralha-azul', 'Telêmaco Borba', 'Vila Esperança', '34.761.357/0001-04');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(29, 'Orlando Coser', 'Londrina', 'Jardim do Leste', '23.240.919/0001-58');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(408, 'Professor Francisco Dranka', 'Curitiba', 'Orleans', '42.954.260/0001-46');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(200, 'Jonas Bento de Deus', 'Campo Mourão', 'Jardim Francisco Ferreira Albuquerque', '51.819.536/0001-74');
INSERT INTO ENDERECO(numero, rua, cidade, bairro, cnpj_F) VALUES(128, 'Avenida Goioerê', 'Campo Mourão', 'Centro', '13.233.743/0001-38');


INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Batata', '50 Kg', 6.20);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Mandioca', '60 Kg', 13.79);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Achocolatado em pó', '1.6 Kg', 5.13);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Cebola', '10 Kg', 5.13);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Carne Bovina', '200 Kg', 40.00);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Farinha', '60 Kg', 4.69);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Laranja', '5 Kg', 7.19);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Alho', '2 Kg', 5.13);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Óleo', '9000ml', 9.77);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Tilápia', '25 Kg', 10.90);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Fubá', '3 Kg', 6.15);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Azeite', '2000 ml ', 11.30);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Leite', '20 L ', 5.55);
INSERT INTO INGREDIENTE(nome, qtde_estoque, valor_unitario) VALUES('Sal', '5 Kg L ', 2.25);

INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(1, '19:30:29',' Porção inteira de batata frita, porção inteira de mini-kibe', 23);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(20, '18:58:45', 'Garrafa de 1L de Coca-Cola, pizza de 8 pedaços de strogonoff de carne e calabresa, porção inteira de anéis de cebola', 56);

INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(14, '21:12:45', 'Meia porção de polenta frita e um porção inteira de mandioca frita', 14);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(50, '22:00:02', 'Uma porção inteira de filé de tilápia', 26);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(98, '22:23:06', 'Uma Coca-Cola de 1L, um chopp-Heineken, uma porção inteira de batata frita, uma pizza de 4 pedaços do sabor sensação', 120);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(65, '20:45:23', 'Um copo de 500ml de suco de laranja, uma pizza de 4 pedaços de portuguesa(retirar cebola), uma porção pequena de tilápia', 43);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(10, '19:15:43', 'Um chopp, um porção inteira de bata frita, uma porção média de frango frito, uma porção média de mandioca, uma pizza de 2 pedaços do sabor brigadeiro, uma garrafa de cerveja', 75);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(45, '21:45:14', 'Um copo de 500ml de suco de abacaxi, uma garrafa de 1L de Guaraná, uma porção inteira de polenta frita, meia porção de frango frito, meia porção de bolinho de peixe', 39);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(12, '18:30:00', 'Uma garrafa de coca-cola de 600ml, meia porção de mandioca frita, uma porção inteira de mini kibe', 99);
INSERT INTO PEDIDO(numero, hora, descricao, numero_conta) VALUES(32, '22:45:26', 'Uma garrafa de vinho tinto, uma porção inteira de anéis de cebola, uma meia porção de mini kibe, uma panqueca de chocolate', 100);

INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de polenta frita', 'Comida', '00:25:00', 27.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de batata frita', 'Comida', '00:15:00', 27.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de mandioca frita', 'Comida', '00:15:00', 26.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de filé de tilápia', 'Comida', '00:20:00', 49.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de frango a passarinho', 'Comida', '00:30:00', 36.00);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Pizza de 4 pedaços(até 2 sabores)', 'Comida', '00:30:00', 47.00);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Pizza de 8 pedaços(até 4 sabores)', 'Comida', '00:40:00', 61.00);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Chopp-Heineken', 'Bebida', '00:00:00', 12.50);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Refrigerante de 1L', 'Bebida', '00:00:00', 8.00);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Suco 500ml', 'Bebida', '00:07:00', 10.50);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de anéis de cebola', 'Comida', '00:32:00', 34.00);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira de mini-kibe(20un)', 'Comida', '00:18:00', 28.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de carne acebolada', 'Comida', '00:25:00', 40.00);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Porção inteira(500g) de calabresa', 'Comida', '00:23:00', 36.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Panqueca de chocolate', 'Comida', '00:30:00', 20.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Panqueca vegana-beterraba, couve, cenora, etc', 'Comida', '00:35:00', 21.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Torrada', 'Comida', '00:07:00', 9.90);
INSERT INTO PRODUTO(nome, categoria, tempo_preparo, preco) VALUES('Tábua de frios-queijo, salame, presunto e azeitonas', 'Comida', '00:07:00', 9.90);

INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('354.217.077-17', '364.651.182-62');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('954.224.679-06', '525.890.307-97');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('394.700,522-93', '692.385.196-33');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('715.070.466-26', '835.002.463-11');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('234.890.424-17', '594.049.718-71');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('563.116.670-45', '906.532.753-31');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('273.652.687-27', '724.940.983-27');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('723.894.592-42', '326.749.790-62');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('763.338.178-72', '163.145.243-69');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('707.455.581-94', '360.451.332-42');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('707.455.581-94', '619.431.202-50');
INSERT INTO GARCOM_CLIENTE(cpf_G, cpf_C) VALUES('707.455.581-94', '522.071.718-92');

INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(1, 'Porção inteira(500g) de batata frita');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(20, 'Refrigerante de 1L');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(14, 'Porção inteira(500g) de mandioca frita');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(50, 'Porção inteira(500g) de filé de tilápia');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(98, 'Pizza de 4 pedaços(até 2 sabores)');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(65, 'Suco 500ml');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(10, 'Chopp-Heineken');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(45, 'Porção inteira(500g) de frango a passarinho');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(12, 'Porção inteira de mini-kibe(20un)');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(32, 'Porção inteira(500g) de anéis de cebola');

INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(1, 'Porção inteira de mini-kibe(20un)');
INSERT INTO PEDIDO_PRODUTO(pedido_N, nome_P) VALUES(20, 'Porção inteira(500g) de anéis de cebola');

INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('500g', 'Porção inteira(500g) de batata frita', 'Batata');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('30g', 'Panqueca de chocolate', 'Achocolatado em pó');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('1Kg', 'Suco 500ml', 'Laranja');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('4g', 'Porção inteira(500g) de polenta frita', 'Fubá');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('36 g', 'Porção inteira(500g) de frango a passarinho', 'Sal');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('300ml', 'Porção inteira(500g) de anéis de cebola', 'Leite');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('1Kg', 'Porção inteira de mini-kibe(20un)', 'Carne Bovina');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('420g', 'Pizza de 4 pedaços(até 2 sabores)', 'Farinha');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('2 dentes', 'Porção inteira(500g) de carne acebolada', 'Alho');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('1L', 'Porção inteira(500g) de calabresa', 'Óleo');

INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('800g', 'Pizza de 8 pedaços(até 4 sabores)', 'Farinha');
INSERT INTO PRODUTO_INGREDIENTE(qtde, nome_P, nome_I) VALUES('10g', 'Pizza de 8 pedaços(até 4 sabores)', 'Sal');



INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Batata', '98.998.537/0001-97');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Mandioca', '63.809.275/0001-90');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Achocolatado em pó', '46.650.574/0001-06');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Cebola', '54.712.181/0001-08');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Carne Bovina', '23.240.919/0001-58');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Laranja', '34.761.357/0001-04');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Sal', '47.055.753/0001-68');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Tilápia', '42.954.260/0001-46');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Óleo', '51.819.536/0001-74');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Farinha', '13.233.743/0001-38');

INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Sal', '51.819.536/0001-74');
INSERT INTO FORNECEDOR_INGREDIENTE(nome_I, cnpj_F) VALUES('Óleo', '47.055.753/0001-68');


INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Panqueca de chocolate', '183.067.107-38');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Pizza de 4 pedaços(até 2 sabores)', '938.916.311-03');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Porção inteira(500g) de frango a passarinho', '799.404.652-54');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Suco 500ml', '203.300.408-20');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Panqueca vegana-beterraba, couve, cenora, etc', '815.563.106-09');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Torrada', '255.016.120-38');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Panqueca de chocolate', '643.520.411-06');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Tábua de frios-queijo, salame, presunto e azeitonas', '471.813.962-77');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Pizza de 8 pedaços(até 4 sabores)', '552.626.700-83');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Panqueca vegana-beterraba, couve, cenora, etc', '111.786.124-88');
INSERT INTO COZINHEIRO_PRODUTO(nome_P, cpf_C) VALUES('Porção inteira de mini-kibe(20un)', '799.404.652-54');
