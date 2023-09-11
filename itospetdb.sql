create database itospet;

use itospet;


create table TIPOPESSOA(
    IDTIPOPESSOA int not null auto_increment,

    NOMETIPOPESSOA varchar(45) not null,
    
    primary key(IDTIPOPESSOA)
);

create table PESSOA(
CPF int not null auto_increment,
FKIDTIPOPESSOA int not null,

NOME varchar(45) not null,
SOBRENOME varchar(45) not null,

primary key(CPF),
foreign key(FKIDTIPOPESSOA) references TIPOPESSOA(IDTIPOPESSOA),

index NOMECOMPLETO (NOME, SOBRENOME)
);



create table TIPO(
IDTIPO int not null auto_increment,

NOMETIPO varchar(45) not null,

primary key(IDTIPO)
);


create table RACA(
IDRACA int not null auto_increment,
TIPO_ID int not null,

NOMERACA varchar(45) not null,

primary key(IDRACA),
foreign key(TIPO_ID) references TIPO(IDTIPO)
);



create table PET(
IDPET int not null auto_increment,
CPFPESSOA int not null,
RACA_ID int not null,

APELIDO varchar(45) not null,
IDADE INT not null,

primary key(IDPET),
foreign key(CPFPESSOA) references PESSOA(CPF),
foreign key(RACA_ID) references RACA(IDRACA)
);



create table MEIO_VENDA(
    IDMEIO_VENDA int not null auto_increment,

    NOMEMEIO_VENDA varchar(45) not null,

    primary key(IDMEIO_VENDA)
);


create table MEIO_PAGAMENTO(
    IDMEIO_PAGAMENTO int not null auto_increment,

    NOMEMEIO_PAGAMENTO varchar(45) not null,
    PARCELAMEIO_PAGAMENTO int not null,

    primary key(IDMEIO_PAGAMENTO)
);


create table ESTADO_VENDA(
    IDESTADO_VENDA int not null auto_increment,

    NOMEESTADO_VENDA varchar(45) not null,

    primary key(IDESTADO_VENDA)
);



create table TIPOPRODUTO(
    IDTIPOPROD int NOT NULL auto_increment,

    NOMETIPOPROD varchar(45) not null,

    primary key(IDTIPOPROD)
);


create table PRODUTO(
    IDPRODUTO int not null auto_increment,
    FK_IDTIPOPROD int not null,

    NOMEPRODUTO varchar(45) not null,
    PRECO double not null,
    QTD int not null, 

    primary key(IDPRODUTO),
    foreign key (FK_IDTIPOPROD) references TIPOPRODUTO(IDTIPOPROD)
);



create table VENDA(
    IDVENDA int not null auto_increment,

    PRECOTOTAL double not null,

    primary key(IDVENDA)
);


-- Isso é uma conecao de uma chave a outra
create table PETVENDA(
    PET_IDPET int not null,
    VENDA_IDVENDA int not null, 

    foreign key(PET_IDPET) references PET(IDPET),
    foreign key(VENDA_IDVENDA) references VENDA(IDVENDA)
);


-- Também é
create table ITEMVENDA(
    PRODUTO_IDPRODUTO int not null,
    FK_IDVENDA int not null,
    QTD_ITEM int not null, 

    foreign key(PRODUTO_IDPRODUTO) references PET(IDPET),
    foreign key(FK_IDVENDA) references VENDA(IDVENDA)
);




insert into TIPOPESSOA(NOMETIPOPESSOA) values ("Cliente"),
("Vendedor");



insert into PESSOA(FKIDTIPOPESSOA, NOME, SOBRENOME) values (1, "Pedlo", "Pogo"),
(1, "Foo", "Kao"),
(1, "Jao", "Paulo"),
(1, "Coelho", "PEgador"),
(2, "Abril", "Inhegas");



insert into TIPO (NOMETIPO) values 
('Cachorro'),
('Gato'),
('Peixe');


insert into RACA (TIPO_ID, NOMERACA) values 
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


insert into MEIO_VENDA (NOMEMEIO_VENDA) values 
('Presencial'),
('Ecommerce');

insert into MEIO_PAGAMENTO (NOMEMEIO_PAGAMENTO, PARCELAMEIO_PAGAMENTO) values
('Dinheiro', 1),
('PIX', 1),
('Débito', 1),
('Crédito à Vista', 1),
('Parcelado 2X', 2),
('Parcelado 3X', 3),
('Parcelado 4X', 4),
('Parcelado 5X', 5),
('Parcelado 6X', 6);

insert into ESTADO_VENDA(NOMEESTADO_VENDA) values 
("Finalizado"),
("Cancelado"),
("Pendente");


insert into TIPOPRODUTO(NOMETIPOPROD) values 
("Servico"),
("Produto");

