#drop database if exists db_sbook;

create database db_sbook;

use db_sbook;

#TBL_ENDEREÇO
create table tbl_endereco(
	id int primary key auto_increment not null,
	logradouro varchar(250) not null,
    bairro varchar(100) not null,
    cidade varchar(100) not null,
    estado varchar(50) not null,
    cep varchar(10) not null,
    
    unique index (id)
);

#TBL_USUARIO_TEMPORARIO
create table tbl_usuario_temporario(
	id int primary key auto_increment not null,
	email varchar(255) not null,
    token int not null,
    token_expiress datetime not null,
    
    unique index (id)
);

#TBL_USUÁRIO
create table tbl_usuario(
	id int primary key auto_increment not null,
    nome varchar(60) not null,
    data_nascimento date not null,
    data_criacao datetime not null default current_timestamp, -- é a data e hora da criação da conta do usuário.
    cpf varchar(18) not null,
    email varchar(255) not null,
    senha varchar(256) not null,
    senha_reset_token int,
    senha_reset_expiracao datetime,
    status_usuario bit default 1 not null,
    foto varchar(5000) not null default "https://www.seekpng.com/png/detail/41-410093_circled-user-icon-user-profile-icon-png.png",
    id_endereco int not null,
    
    constraint FK_Endereco_Usuario
    foreign key (id_endereco)
    references tbl_endereco(id),
    
    unique index (id)
);

#TBL_AVALIAÇÃO
create table tbl_avaliacao(
	id int primary key auto_increment not null,
    id_usuario_avaliador int not null,
    id_usuario_avaliado int not null,
    valor int not null,
    
    constraint FK_UsuarioAvaliado_Avaliacao
    foreign key (id_usuario_avaliado)
    references tbl_usuario(id),
    
    constraint FK_UsuarioAvaliador_Avaliacao
    foreign key (id_usuario_avaliador)
    references tbl_usuario(id),
    
    unique index (id)
);

#TBL_CHAT
create table tbl_chat(
	id int primary key not null,
    status_usuario bit default 1 not null,
	id_mongo varchar(255) not null,
    id_usuario int not null,
    
    constraint FK_Usuario_Chat
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
    numero_paginas int,
    ano_lancamento year not null,
    descricao text not null,
    data_criacao datetime not null, -- é a data e hora de criação do anúncio.
    status_anuncio bit not null default 1, -- status 1 significa que o anúncio ainda está ativo, e 0 significa que foi encerrao, e não excluido.
    edicao varchar(100), -- edição não é tabela por causa que para cada livro existe tipos de edições diferente.
    isbn double,
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
create table tbl_usuario_anuncio_favoritados(
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
    foto varchar(5000) not null default "https://cdn-icons-png.flaticon.com/512/4519/4519678.png",
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



