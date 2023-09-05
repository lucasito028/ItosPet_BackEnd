create database itospet;

use itospet;


create table PESSOA(
CPF int not null auto_increment,
NOME varchar(45) not null,
SOBRENOME varchar(45) not null,
primary key(CPF),
index NOMECOMPLETO (NOME, SOBRENOME));

create table CLIENTE(
IDCLIENTE int not null auto_increment,
PESSOACPF int not null,
APELIDO varchar(45) not null,
primary key(IDCLIENTE),
foreign key(PESSOACPF) references PESSOA(CPF));

create table VENDEDOR(
IDVENDEDOR int not null auto_increment,
PESSOACPF int not null,
APELIDOVENDEDOR varchar(45) not null,
primary key(IDVENDEDOR),
foreign key(PESSOACPF) references PESSOA(CPF));






create table TIPO(
IDTIPO int not null auto_increment,
NOMETIPO varchar(45) not null,
primary key(IDTIPO)
);

create table RACA(
IDRACA int not null auto_increment,
NOMERACA varchar(45) not null,
TIPO_ID int not null,
primary key(IDRACA),
foreign key(TIPO_ID) references TIPO(IDTIPO)
);



create table PET(
IDPET int not null auto_increment,
CLIENTE_ID int not null,
RACA_ID int not null,

APELIDO varchar(45) not null,
IDADE INT not null,
primary key(IDPET),
foreign key(CLIENTE_ID) references CLIENTE(IDCLIENTE),
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
    primary key(IDPRODUTO),
    foreign key (FK_IDTIPOPROD) references TIPOPRODUTO(IDTIPOPROD)
);



create table VENDA(
    IDVENDA int not null auto_increment,
    PRECOTOTAL double not null,
    primary key(IDVENDA)
);



create table PETVENDA(
    PET_IDPET int not null,
    VENDA_IDVENDA int not null, 
    foreign key(PET_IDPET) references PET(IDPET),
    foreign key(VENDA_IDVENDA) references VENDA(IDVENDA)
);



create table ITEMVENDA(
    PRODUTO_IDPRODUTO int not null,
    FK_IDVENDA int not null, 
    foreign key(PRODUTO_IDPRODUTO) references PET(IDPET),
    foreign key(FK_IDVENDA) references VENDA(IDVENDA)
);



insert into TIPOCLIENTE(NOMETIPOCLIENTE) VALUES ('Normal'),
('VIP');


insert into CLIENTE(FKIDTIPOCLIENTE, NOMECLIENTE, SOBRENOME) 
values 
(1, 'Consumidor', 'Normal'),
(1 ,'Jane', 'Smith'),
(1, 'Michael', 'Johnson'),
(2, 'Emily', 'Williams'),
(2, 'William', 'Brown'),
(2, 'Olivia', 'Jones'),
(2, 'James', 'Miller'),
(1, 'Sophia', 'Davis'),
(1, 'Liam', 'Wilson'),
(1, 'Emma', 'Taylor'),
(1, 'Alexander', 'Anderson'),
(2, 'Ava', 'Thomas'),
(1, 'Ethan', 'Martinez'),
(1, 'Isabella', 'Robinson'),

(1, 'Doe', 'John'),
(2, 'Smith', 'Jane'),
(2, 'Johnson', 'Michael'),
(1, 'Williams', 'Emily'),
(2, 'Brown', 'William'),
(2, 'Jones', 'Olivia'),
(2, 'Miller', 'James'),
(1, 'Davis', 'Sophia'),
(2, 'Wilson', 'Liam'),
(1, 'Taylor', 'Emma'),
(1, 'Anderson', 'Alexander'),
(2, 'Thomas', 'Ava'),
(1, 'Martinez', 'Ethan'),
(2, 'Robinson', 'Isabelle');



insert into TIPO (NOMETIPO) values ('Cachorro');
insert into TIPO (NOMETIPO) values ('Gato');


insert into RACA (NOMERACA, TIPO_ID) values ('Labrador', 1);
insert into RACA (NOMERACA, TIPO_ID) values ('Poodle', 1);
insert into RACA (NOMERACA, TIPO_ID) values ('Bulldog', 1);
insert into RACA (NOMERACA, TIPO_ID) values ('Vira Lata', 1);

insert into RACA (NOMERACA, TIPO_ID) values ('Mial', 2);
insert into RACA (NOMERACA, TIPO_ID) values ('Abyssinian', 2);
insert into RACA (NOMERACA, TIPO_ID) values ('Aegean', 2);
insert into RACA (NOMERACA, TIPO_ID) values ('Arabian Mau', 2);


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
('Parcelado 6X', 6)

