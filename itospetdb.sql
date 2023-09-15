drop database itospet;

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

    primary key(CPF),
    foreign key(FKIDTIPOPESSOA) references TIPOPESSOA(IDTIPOPESSOA),

    index NOMECOMPLETO (NOME, SOBRENOME)
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


create table PRODUTO(
    IDPRODUTO int not null auto_increment,
    FKESTADOPRODUTO int not null,
    FKTIPOPRODUTO int not null,

    NOMEPRODUTO varchar(45) not null,
    PRECO double not null,
    QTD int not null, 

    primary key(IDPRODUTO),
    foreign key (FKTIPOPRODUTO) references TIPOPRODUTO(IDESTADOPRODUTO),
    foreign key (FKESTADOPRODUTO) references ESTADOPRODUTO(IDESTADOPRODUTO)
);




create table VENDA(
    IDVENDA int not null auto_increment,
    FKMEIOPG int not null,
    FKESTADOVENDA int not null,
    FKONDE int not null,
    FKPESSOA int not null,

    PRECOTOTAL double not null,
    DTVENDA date not null,

    primary key(IDVENDA),
    foreign key (FKMEIOPG) references MEIOPAGAMENTO(IDMEIOPAGAMENTO),
    foreign key (FKESTADOVENDA) references ESTADOVENDA(IDESTADOVENDA),
    foreign key (FKONDE) references ONDE(IDONDE),
    foreign key (FKPESSOA) references PESSOA(CPF)
);




create table LOCALPRODUTO(
    FKONDE int not null,
    FKPRODUTO int not null,

    foreign key (FKONDE) references ONDE(IDONDE),
    foreign key (FKPRODUTO) references PRODUTO(IDPRODUTO),
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




insert into TIPOPESSOA(NOMETIPOPESSOA) values ("Cliente"),
    ("Vendedor");



insert into PESSOA(FKTPESSOA, NOME, SOBRENOME) values (1, "Pedlo", "Pogo"),
    (1, "Foo", "Kao"),
    (1, "Jao", "Paulo"),
    (1, "Coelho", "PEgador"),
    (2, "Abril", "Inhegas");



insert into TIPOANIMAL (NOMETIPO) values 
    ('Cachorro'),
    ('Gato'),
    ('Peixe');


insert into RACA (FKTIPOANIMAL, NOMERACA) values 
    (1, 'Labrador'),
    (1, 'Poodle'),
    (1, 'Bulldog'),
    (1, 'Vira Lata'),
    (1, 'Pasto Alemões'),
    (1, 'Golden Retriever'),

    (2, 'Mial'),
    (2, 'Abyssinian'),
    (2, 'Aegean'),
    (2, 'Arabian Mau'),

    (3, 'Kanpachi'),
    (3, 'Sake'),
    (3, 'Maguro');



insert into ONDE (NOMEONDE) values 
    ('Presencial'),
    ('Ecommerce');


insert into MEIOPAGAMENTO (NMEIOPGT, PARCELA) values
    ('Dinheiro', 1),
    ('PIX', 1),
    ('Débito', 1),
    ('Crédito à Vista', 1),
    ('Parcelado 2X', 2),
    ('Parcelado 3X', 3),
    ('Parcelado 4X', 4),
    ('Parcelado 5X', 5),
    ('Parcelado 6X', 6);


insert into ESTADOVENDA(NOMESTADOVENDA) values 
    ("Finalizado"),
    ("Cancelado"),
    ("Pendente");


insert into TIPOPRODUTO(NMESTADOPROD) values 
    ("Servico"),
    ("Produto");

