create database itospet;

use itospet;


create table TIPOPESSOA(
    IDTIPOPESSOA int not null auto_increment,

    NOMETIPOPESSOA varchar(45) not null,
    
    primary key(IDTIPOPESSOA)
);


create table PESSOA(
    CPF int not null auto_increment,
    FKTPESSOA int not null,

    NOME varchar(45) not null,
    SOBRENOME varchar(45) not null,
    DTNASC date not null,

    primary key(CPF),
    foreign key(FKTPESSOA) references TIPOPESSOA(IDTIPOPESSOA),

    index NOMECOMPLETO (NOME, SOBRENOME)
);


create table ENDERECO(
    IDENDERECO int not null auto_increment,
    FKPESSOA int not null,

    CEP INT not null,
    RUA varchar(45) not null,
    N INT NOT NULL,
    BAIRRO varchar(45) not null,
    CIDAADE varchar(45) not null,
    ESTAO varchar(45) not null,
    OBS varchar(45) ,
    

    primary key(IDENDERECO),
    foreign key(FKPESSOA) references PESSOA(CPF)
);




create table TIPOANIMAL(
    IDTIPO int not null auto_increment,

    NOMETIPO varchar(45) not null,

    primary key(IDTIPO)
);


create table RACA(
    IDRACA int not null auto_increment,
    FKTIPOANIMAL int not null,

    NOMERACA varchar(45) not null,

    primary key(IDRACA),
    foreign key(FKTIPOANIMAL) references TIPOANIMAL(IDTIPO)
);



create table PET(
    IDPET int not null auto_increment,
    FKRACA int not null,
    FKCPF int not null,

    APELIDO varchar(45) not null,
    IDADE INT not null,
    DATANASC DATE NOT NULL,

    primary key(IDPET),
    foreign key(FKCPF) references PESSOA(CPF),
    foreign key(FKRACA) references RACA(IDRACA)
);




create table ONDE(
    IDONDE int not null auto_increment,

    NOMEONDE varchar(45) not null,

    primary key(IDONDE)
);


create table MEIOPAGAMENTO(
    IDMEIOPAGAMENTO int not null auto_increment,

    NMEIOPGT varchar(45) not null,
    PARCELA int not null,

    primary key(IDMEIOPAGAMENTO)
);


create table ESTADOVENDA(
    IDESTADOVENDA int not null auto_increment,

    NOMESTADOVENDA varchar(45) not null,

    primary key(IDESTADOVENDA)
);




create table ESTADOPRODUTO(
    IDESTADOPRODUTO int not null auto_increment,

    NMESTADOPROD varchar(45) not null,

    primary key(IDESTADOPRODUTO)
);


create table TIPOPRODUTO(
    IDESTADOPRODUTO int NOT NULL auto_increment,

    NMESTADOPROD varchar(45) not null,

    primary key(IDESTADOPRODUTO)
);


create table FABRICANTE(
    IDFABRICANTE int not null auto_increment,

    NMFABRICANTE varchar(45) not null,

    primary key(IDESTADOPRODUTO)
);


create table CATEGORIA(
    IDCATEGORIA int not null auto_increment,
    FKTPANIMAL int not null,

    NMCATEGORIA varchar(45) not null,

    primary key(IDCATEGORIA),
    foreign key(FKTPANIMAL) references TIPOANIMAL(IDTIPO)
);


create table PRODUTO(
    IDPRODUTO int not null auto_increment,
    FKTIPOPRODUTO int not null,

    NOMEPRODUTO varchar(45) not null,
    PRECO double not null,
    QTD int not null, 

    primary key(IDPRODUTO),
    foreign key (FKTIPOPRODUTO) references TIPOPRODUTO(IDESTADOPRODUTO)
);




create table VENDA(
    IDVENDA int not null auto_increment,
    FKMEIOPG int not null,
    FKESTADOVENDA int not null,
    FKONDE int not null,
    FKIDCLIENTE int not null,
    FKIDVENDEDOR int not null,


    PRECOTOTAL double not null,
    DTVENDA date not null,

    primary key(IDVENDA),
    foreign key (FKMEIOPG) references MEIOPAGAMENTO(IDMEIOPAGAMENTO),
    foreign key (FKESTADOVENDA) references ESTADOVENDA(IDESTADOVENDA),
    foreign key (FKONDE) references ONDE(IDONDE)
);




create table LOCALPRODUTO(
    FKONDE int not null,
    FKPRODUTO int not null,
    FKESTADO int not null,

    foreign key (FKONDE) references ONDE(IDONDE),
    foreign key (FKPRODUTO) references PRODUTO(IDPRODUTO),
    foreign key (FKESTADO) references ESTADOPRODUTO(IDESTADOPRODUTO)
);


create table PETVENDA(
    FKPET int not null,
    FKVENDA int not null, 

    foreign key(FKPET) references PET(IDPET),
    foreign key(FKVENDA) references VENDA(IDVENDA)
);


create table ITEMVENDA(
    FKVENDA int not null,
    FKPRODUTO int not null,

    QTD_ITEM int not null, 

    foreign key(FKVENDA) references VENDA(IDVENDA),
    foreign key(FKPRODUTO) references PRODUTO(IDPRODUTO)
);




