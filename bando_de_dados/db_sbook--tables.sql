create database db_sbook;

use db_sbook;

create table tbl_endereco(
	id int primary key auto_increment not null,
	logradouro varchar(250) not null,
    bairro varchar(100) not null,
    cidade varchar(100) not null,
    estado varchar(50) not null,
    cep varchar(8),
    
    unique index (id)
);