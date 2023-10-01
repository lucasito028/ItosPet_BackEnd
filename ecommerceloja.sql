DROP DATABASE KIDSBRASIL;

CREATE DATABASE KIDSBRASIL;

USE KIDSBRASIL;



CREATE TABLE TIPOPESSOA(
  IDTIPOPESSOA INT NOT NULL AUTO_INCREMENT ,

  NOMETIPOPESSOA VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDTIPOPESSOA)
);


CREATE TABLE PESSOA(
  IDPESSOA INT NOT NULL AUTO_INCREMENT ,
  FKTIPOPESSOA INT NOT NULL ,

  NOME VARCHAR(45) NOT NULL ,
  SOBRENOME VARCHAR(45) NOT NULL ,
  DTNASC DATE NOT NULL ,
  EMAIL VARCHAR(45) NOT NULL ,
  SENHA VARCHAR(45) NOT NULL ,
  NWHATS VARCHAR(13) NOT NULL ,
  CPF VARCHAR(14) ,
  
  PRIMARY KEY(IDPESSOA) ,
  FOREIGN KEY(FKTIPOPESSOA) REFERENCES TIPOPESSOA(IDTIPOPESSOA)
);


CREATE TABLE ENDERECO(
  IDENDERECO INT NOT NULL AUTO_INCREMENT ,
  FKPESSOA INT NOT NULL ,

  CEP VARCHAR(9) NOT NULL ,
  RUA VARCHAR(45) NOT NULL ,
  N INT NOT NULL ,
  BAIRRO VARCHAR(45) NOT NULL ,
  CIDADE VARCHAR(13) NOT NULL ,
  ESTADO VARCHAR(4) NOT NULL ,
  OBS VARCHAR(45) NOT NULL ,
  
  PRIMARY KEY(IDENDERECO) ,
  FOREIGN KEY(FKPESSOA) REFERENCES PESSOA(IDPESSOA)
);



CREATE TABLE ESTADOVENDA(
  IDESTADOVENDA INT NOT NULL AUTO_INCREMENT ,

  NMSTADOVENDA VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDESTADOVENDA)
);


CREATE TABLE MEIOPAGAMENTO(
  IDMEIOPAGAMENTO INT NOT NULL AUTO_INCREMENT ,

  NMEIOPGT VARCHAR(45) NOT NULL ,
  PARCELA INT NOT NULL ,

  PRIMARY KEY(IDMEIOPAGAMENTO)
);



CREATE TABLE ONDECATEGORIA(
  IDONDECATEGORIA INT NOT NULL AUTO_INCREMENT ,

  NMONDECATEGORIA VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDONDECATEGORIA)
);


CREATE TABLE CATEGORIA(
  IDCATEGORIA INT NOT NULL AUTO_INCREMENT ,

  NMCATEGORIA VARCHAR(45) NOT NULL ,
  URLCATEGORIA VARCHAR(100) NOT NULL ,

  PRIMARY KEY(IDCATEGORIA)
);


CREATE TABLE POSICAOCATEGORIA(
  FKONDECATEORIA INT NOT NULL,
  FKCATEGORIA INT NOT NULL,

  FOREIGN KEY(FKONDECATEORIA) REFERENCES ONDECATEGORIA(IDONDECATEGORIA) ,
  FOREIGN KEY(FKCATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA) 
);


CREATE TABLE FABRICANTE(
  IDFABRICANTE INT NOT NULL AUTO_INCREMENT , 

  NMFABRICANTE VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDFABRICANTE)
);


CREATE TABLE TIPOPRODUTO(
  IDTIPOPRODUTO INT NOT NULL AUTO_INCREMENT ,

  NMTPPRODUTO VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDTIPOPRODUTO)
);


CREATE TABLE SEXO(
  IDSEXO INT NOT NULL AUTO_INCREMENT ,

  NMSEXO VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDSEXO)
);


CREATE TABLE TECIDO(
  IDTECIDO INT NOT NULL AUTO_INCREMENT ,

  NMTECIDO VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDTECIDO)
);


CREATE TABLE ESTACAO(
  IDESTACAO INT NOT NULL AUTO_INCREMENT ,

  NMESTACAO VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDESTACAO)
);


CREATE TABLE TAMANHO(
  IDTAMANHO INT NOT NULL AUTO_INCREMENT ,

  TAM VARCHAR(5) NOT NULL ,

  PRIMARY KEY(IDTAMANHO)
);


CREATE TABLE ESTADOPRODUTO(
  IDESTADOPRODUTO INT NOT NULL AUTO_INCREMENT ,

  NMESTADOPROD VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDESTADOPRODUTO)
);


CREATE TABLE CONPOE(
  IDCONPOE INT NOT NULL AUTO_INCREMENT ,

  NMCONPOE VARCHAR(45) NOT NULL ,

  PRIMARY KEY(IDCONPOE)
);



CREATE TABLE PRODUTO(
  IDPRODUTO INT NOT NULL AUTO_INCREMENT ,
  FKESTADO INT NOT NULL ,
  FKTAM INT NOT NULL ,
  FKSEXO INT NOT NULL ,
  FKFABRICANTE INT NOT NULL ,
  FKESTACAO INT NOT NULL ,
  FKCONPOE INT NOT NULL ,
  
  CODPRODUTO INT NOT NULL ,

  PRECO DECIMAL(10, 2) NOT NULL ,
  QTD INT NOT NULL ,
  URLPROD VARCHAR(45) NOT NULL ,
  SUBDESC VARCHAR(45) NOT NULL ,
  DESCPRODUTO VARCHAR(45) NOT NULL ,
  
  PRIMARY KEY(IDPRODUTO) ,
  FOREIGN KEY(FKESTADO) REFERENCES ESTADOPRODUTO(IDESTADOPRODUTO) ,
  FOREIGN KEY(FKTAM) REFERENCES TAMANHO(IDTAMANHO), 
  FOREIGN KEY(FKSEXO) REFERENCES SEXO(IDSEXO),
  FOREIGN KEY(FKFABRICANTE) REFERENCES FABRICANTE(IDFABRICANTE) , 
  FOREIGN KEY(FKESTACAO) REFERENCES ESTACAO(IDESTACAO) ,
  FOREIGN KEY(FKCONPOE) REFERENCES CONPOE(IDCONPOE) 
);



CREATE TABLE ONDEPRODUTO(
  FKPRODUTO INT NOT NULL,
  FKCATEGORIA INT NOT NULL,

  FOREIGN KEY(FKPRODUTO) REFERENCES PRODUTO(IDPRODUTO) ,
  FOREIGN KEY(FKCATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA)
);



CREATE TABLE VENDA(
  IDVENDA INT NOT NULL AUTO_INCREMENT ,
  FKMEIOPG INT,
  FKESTADOVENDA INT NOT NULL ,
  FKPESSOA INT NOT NULL ,
  FKENDERECO INT NOT NULL ,
  FKTAM INT NOT NULL ,

  DTVENDA DATE NOT NULL ,
  
  PRIMARY KEY(IDVENDA) ,
  FOREIGN KEY(FKMEIOPG) REFERENCES MEIOPAGAMENTO(IDMEIOPAGAMENTO) ,
  FOREIGN KEY(FKESTADOVENDA) REFERENCES ESTADOVENDA(IDESTADOVENDA) ,
  FOREIGN KEY(FKPESSOA) REFERENCES PESSOA(IDPESSOA) ,
  FOREIGN KEY(FKENDERECO) REFERENCES ENDERECO(IDENDERECO),
  FOREIGN KEY(FKTAM) REFERENCES TAMANHO(IDTAMANHO)
);



CREATE TABLE VARIACAO(
  FKPRODUTO INT NOT NULL ,
  FKCATEGORIA INT NOT NULL ,
  FKTECIDO INT NOT NULL ,
  FKTPROD INT NOT NULL ,
  
  FOREIGN KEY(FKPRODUTO) REFERENCES PRODUTO(IDPRODUTO) ,
  FOREIGN KEY(FKCATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA) ,
  FOREIGN KEY(FKTECIDO) REFERENCES TECIDO(IDTECIDO) ,
  FOREIGN KEY(FKTPROD) REFERENCES TIPOPRODUTO(IDTIPOPRODUTO)
);



CREATE TABLE ITEMVENDA(
  FKVENDA INT NOT NULL,
  FKPRODUTO INT NOT NULL,

  QTD INT NOT NULL ,

  FOREIGN KEY(FKPRODUTO) REFERENCES PRODUTO(IDPRODUTO) ,
  FOREIGN KEY(FKVENDA) REFERENCES VENDA(IDVENDA) 
);




INSERT INTO TIPOPESSOA(NOMETIPOPESSOA) VALUES 
("ADM"),
("CLIENTE");


INSERT INTO SEXO(NMSEXO) VALUES 
("MASCULINO"), 
("FEMININO"), 
("UNISSEX");


INSERT INTO FABRICANTE(NMFABRICANTE) VALUES 
("MALWEE"), 
("KYLY"), 
("MILON"), 
("FAKINI");


INSERT INTO ESTACAO(NMESTACAO) VALUES 
("INVERNO"), 
("CALOR"),
("NORMAL");


INSERT INTO TECIDO(NMTECIDO) VALUES 
("ALGODAO"),
("MOLETOM"), 
("TACTEL"),
("POLIESTER");


INSERT INTO TAMANHO(TAM) VALUES 
("PBB"),
("MBB"),
("GBB"),

("1"),
("2"),
("3"),

("4"),
("6"),
("8"),
("10"),

("12"),
("14"),
("16"),
("18");


INSERT INTO TIPOPRODUTO(NMTPPRODUTO) VALUES 
("CAMISETAS"),
("BLUSAS"),
("VESTIDOS"),
("MACAQUINHO"),
("BODY"),

("CALCA"),
("BERMUDAS"),
("LEGGING"),
("CORSARIO"),

("MEIA"),
("CUECA"),
("CALCINHA");


INSERT INTO MEIOPAGAMENTO(NMEIOPGT, PARCELA) VALUES
("DEBITO", 1),
("CREDITO", 1),
("PARCELA 2X", 2),
("PARCELA 3X", 3),
("PARCELA 4X", 4),
("PARCELA 5X", 5),
("PARCELA 6X", 6);


INSERT INTO ESTADOVENDA(NMSTADOVENDA) VALUES
("FINALIZADO"),
("PENDENTE PAGAMENTO"),
("CARRINHO"),
("CANCELADO");


INSERT INTO ONDECATEGORIA(NMONDECATEGORIA) VALUES 
("MENU"),
("PAGINA PRINCIPAL");


INSERT INTO ESTADOPRODUTO(NMESTADOPROD) VALUES 
("ATIVO"),
("DESABILITADO");


INSERT INTO CONPOE(NMCONPOE) VALUES ("CONJUNTO"),
("INDIVIDUAL")