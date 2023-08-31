-- drop database if exists db_sbook;

create database db_sbook;

use db_sbook;

#TBL_ENDEREÇO
create table tbl_endereco(
	id int primary key auto_increment not null,
	logradouro varchar(250) not null,
    bairro varchar(100) not null,
    cidade varchar(100) not null,
    estado varchar(50) not null,
    cep varchar(8),
    
    unique index (id)
);

#TBL_USUÁRIO
create table tbl_usuario(
	id int primary key auto_increment not null,
    nome varchar(60) not null,
    data_nascimento date not null,
    data_criacao datetime not null, -- é a data e hora da criação da conta do usuário.
    email varchar(255) not null,
    senha varchar(256) not null,
    foto varchar(5000) not null default "https://www.seekpng.com/png/detail/41-410093_circled-user-icon-user-profile-icon-png.png",
    
    unique index (id)
);

#TBL_AVALIAÇÃO
create table tbl_avaliacao(
	id int primary key auto_increment not null,
    id_usuario int not null,
    valor int not null,
    comentario varchar(400),
    
    constraint FK_Usuario_Avaliacao
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index (id)
);

#TBL_CHAT
create table tbl_chat(
	id_mongo int primary key not null,
    
    unique index (id_mongo)
);

#TBL_CHAT -- TBL_USUARIO
create table tbl_chat_usuario(
	id int primary key auto_increment not null,
    id_mongo int not null,
    id_usuario int not null,
    
	constraint FK_Mongo_ChatUsuario
    foreign key (id_mongo)
    references tbl_chat(id_mongo),
    
    constraint FK_Usuario_ChatUsuario
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index (id)
);

#TBL_ESTADO-LIVRO (novo, seminovo ou usado)
create table tbl_estado_livro(
	id int primary key auto_increment not null,
    estado varchar(10) not null,
    
    unique index (id)
);

#TBL_IDIOMA
create table tbl_idioma(
	id int primary key auto_increment not null,
    nome varchar(50) not null,
    
    unique index (id)
);

#TBL_EDITORA
create table tbl_editora(
	id int primary key auto_increment not null,
	nome varchar(80) not null,
    
    unique index (id)
);

#TBL_ANUNCIO
create table tbl_anuncio(
	id int primary key auto_increment not null,
    nome varchar(200) not null,
    numero_paginas int not null,
    ano_lancamento year not null,
    descricao text not null,
    data_criacao datetime not null, -- é a data e hora de criação do anúncio.
    status_anuncio bit not null default 1, -- status 1 significa que o anúncio ainda está ativo, e 0 significa que foi encerrao, e não excluido.
    edicao varchar(100), -- edição não é tabela por causa que para cada livro existe tipos de edições diferente.
    isbn int,
    preco decimal(6,2), -- preço só é obrigatório quando for venda.
    
    id_usuario int not null,
    id_estado_livro int not null,
    id_idioma int not null,
    id_editora int not null,
    
    constraint FK_Usuario_Anuncio
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    constraint FK_EstadoLivro_Anuncio
    foreign key (id_estado_livro)
    references tbl_estado_livro(id),
    
    constraint FK_Idioma_Anuncio
    foreign key (id_idioma)
    references tbl_idioma(id),
    
    constraint FK_Editora_Anuncio
    foreign key (id_editora)
    references tbl_editora(id),
    
    unique index (id)
);

#TBL_USUÁRIO -- TBL_ANUNCIO (Intermediária para o usuário poder favoritar os anúncios de outros usuário)
create table tbl_usuario_anuncio(
	id int primary key auto_increment not null,
    id_usuario int not null,
    id_anuncio int not null,
    
    constraint FK_Usuario_UsuarioAnuncio
    foreign key (id_usuario) 
    references tbl_usuario(id),
    
    constraint FK_Anuncio_UsuarioAnuncio
    foreign key (id_anuncio)
    references tbl_anuncio(id),
    
    unique index (id)
);

#TBL_FOTO
create table tbl_foto(
	id int primary key auto_increment not null,
	foto varchar(5000) not null,
    id_anuncio int not null,
    
    constraint FK_Anuncio_Foto
    foreign key (id_anuncio)
    references tbl_anuncio(id),
    
    unique index (id)
);

#TBL_AUTOR
create table tbl_autor(
	id int primary key auto_increment not null,
    nome varchar(80) not null,
    
    unique index (id)
);

#TBL_ANUNCIO -- TBL_AUTOR
create table tbl_anuncio_autor(
	id int primary key auto_increment not null,
    id_anuncio int not null,
    id_autor int not null,
    
    constraint FK_Anuncio_AnuncioAutor
    foreign key (id_anuncio)
    references tbl_anuncio(id),
    
    constraint FK_Autor_AnuncioAutor
    foreign key (id_autor)
    references tbl_autor(id),
    
    unique index (id)
);

#TBL_TIPO0-ANÚNCIO (doação, troca, venda ou o usuário pode escolher venda e troca junto)
create table tbl_tipo_anuncio(
	id int primary key auto_increment not null,
    tipo varchar(8) not null,
    
    unique index (id)
);

#TBL_ANÚNCIO -- TBL_TIPO-ANÚNCIO
create table tbl_anuncio_tipo_anuncio(
	id int primary key auto_increment not null,
    id_anuncio int not null,
    id_tipo_anuncio int not null,
    
    constraint FK_Anuncio_AnuncioTipAnuncio
    foreign key (id_anuncio)
    references tbl_anuncio(id),
    
    constraint FK_TipoAnuncio_AnuncioTipoAnuncio
    foreign key (id_tipo_anuncio)
    references tbl_tipo_anuncio(id),
    
    unique index (id)
);

#TBL_GENERO
create table tbl_genero(
	id int primary key auto_increment not null,
    nome varchar(35) not null,
    
    unique index (id)
);

#TBL_USUARIO -- TBL_GENERO (Intemediária para saber quais são generos literários favoritos do usuário para uma melhor navageção)
create table tbl_usuario_genero(
	id int primary key auto_increment not null,
    id_usuario int not null,
    id_genero int not null,
    
    constraint FK_Usuario_UsuarioGenero
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    constraint FK_Genero_UsuarioGenero
    foreign key (id_genero)
    references tbl_genero(id),
    
    unique index (id)
);

#TBL_ANUNCIO -- TBL_GENERO
create table tbl_anuncio_genero(
	id int primary key auto_increment not null,
    id_anuncio int not null,
    id_genero int not null,
    
    constraint FK_Anuncio_AnuncioGenero
    foreign key (id_anuncio)
    references tbl_anuncio(id),
    
    constraint FK_Genero_AnuncioGenero
    foreign key (id_genero)
    references tbl_genero(id),
    
    unique index (id)
);

#TBL_GRUPO_INTERESSE
create table tbl_grupo_interesse(
	id int primary key auto_increment not null,
    nome varchar(80) not null,
    data_criacao datetime not null, -- é a data e hora de criação do grupo.
    foto varchar(5000) not null default "data:image/png;base64,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",
    descricao varchar(200),
    
    unique index (id)
);

#TBL_TIPO-USUARIO (Tabela para saber se o usário no grupo é: membro ou administrador)
create table tbl_tipo_usuario(
	id int primary key auto_increment not null,
    tipo varchar(15) not null,
    
    unique index (id)
);

#TBL_USUARIO -- TBL_GRUPO-INTERESSE -- TBL_TIPO-USUÁRIO
create table tbl_usuario_grupo_interesse_tipo_usuario(
	id int primary key auto_increment not null,
    id_usuario int not null,
    id_grupo_interesse int not null,
    id_tipo_usuario int not null,
    
    constraint FK_Usuario_UsuarioGrupoInteresseTipoUsuario
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    constraint FK_GrupoInteresse_UsuarioGrupoInteresseTipoUsuario
    foreign key (id_grupo_interesse)
    references tbl_grupo_interesse(id),
    
    constraint FK_TipoUsuario_UsuarioGrupoInteresseTipoUsuario
	foreign key (id_tipo_usuario)
    references tbl_tipo_usuario(id),
    
    unique index (id)
);

#TBL_ANUNCIO -- TBL_GRUPO-INTERESSE
create table tbl_anuncio_grupo_interesse(
	id int primary key auto_increment not null,
    id_anuncio int not null,
    id_grupo_interesse int not null,
    
    constraint FK_Anuncio_AnuncioGrupoInteresse
    foreign key (id_anuncio)
    references tbl_anuncio(id),
    
    constraint FK_GrupoInteresse_AnuncioGrupoInteresse
    foreign key (id_grupo_interesse)
    references tbl_grupo_interesse(id),
    
    unique index (id)
);


