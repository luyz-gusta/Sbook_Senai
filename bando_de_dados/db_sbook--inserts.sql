use db_sbook;
    
# Endereco -> Usuário
call sp_inserir_endereco_usuario(
	"Rua Julio Preste",
    "Jardim Belval",
    "Barueri",
    "São Paulo",
    "06420-230",
    "Luiz Gustavo",
    "123-456-789-23",
    "2006-02-15",
    "luizgustavo.sp2020@gmail.com",
    "11940022298"
);
call sp_inserir_endereco_usuario(
	"Rua Elton Silva",
    "Centro",
    "Jandira",
    "São Paulo",
    "",
    "Gilson",
    "123-456-789-23",
    "1985-04-20",
    "gilson@gmail.com",
    "11989224002"
);

# Estado Livro
insert into tbl_estado_livro(estado)values("Novo"), ("Seminovo"), ("Usado");

# Avaliação
# insert into tbl_avaliacao (id_usuario, valor, comentario) values (2, 2, null), (1, 5);

# Editora
insert into tbl_editora (nome) values ("Act. Editora"), ("ArtNexus"), ("Banca Tatuí"), ("BEĨ"), ("Cobogó"), ("Desapê");

# Autor
insert into tbl_autor(nome) values ("J.K Rolling"), ("Stephanke Myers"), ("David Goggins"), ("Donald Trump"), ("Gabriel Gomes");

# Anuncio
insert into tbl_anuncio(nome,
 numero_paginas,
 ano_lancamento,
 descricao,
 data_criacao,
 edicao,
 isbn,
 id_usuario,
 id_estado_livro,
 id_idioma,
 id_editora
 ) values ("God of War",
 567,
 2017,
 "Livro do jogo God of War de 2018",
 curdate(),
 "1˚ edição",
 "170321",
 1,
 3,
 1,
 2
);

insert into tbl_tipo_anuncio(tipo) values ("Venda"), ("Troca"), ("Doação");

insert into tbl_usuario_anuncio(id_usuario, id_anuncio) values (2, 1);

insert into tbl_anuncio_tipo_anuncio(id_anuncio, id_tipo_anuncio) values (1, 2);

insert into tbl_usuario_genero(id_genero, id_usuario) values (1, 1), (2,1), (3,1), (1,2), (2,2);

insert into tbl_anuncio_genero (id_anuncio, id_genero) values (1, 2);

insert into tbl_grupo_interesse(nome, data_criacao, descricao) values ("Amantes de Harry Potter", curdate(), "Amamantes de harry Potter de todo o Brasil." );

insert into tbl_tipo_usuario(tipo) values("Administrador"), ("Participante");

insert into tbl_usuario_grupo_interesse_tipo_usuario(id_usuario, id_grupo_interesse, id_tipo_usuario) values (2, 1, 2);

insert into tbl_anuncio_grupo_interesse(id_anuncio, id_grupo_interesse) values (1,1);

insert into tbl_foto(foto, id_anuncio) values ("https://scontent-gru1-1.xx.fbcdn.net/v/t45.5328-4/365467136_7180069905340973_266786442043302573_n.jpg?stp=dst-jpg_s960x960&_nc_cat=101&ccb=1-7&_nc_sid=1a0e84&_nc_eui2=AeHB2fWfCpC9Ar9YTawz51qyNfKWGv1LPeY18pYa_Us95mzHHJD71YjgF_TJWOGSUOdPWqeeklrdQLGJjsuCEXIb&_nc_ohc=A3LsNQdB9EUAX9hxylu&_nc_ht=scontent-gru1-1.xx&oh=00_AfAUFDPd7oW5tomjRX4dumpzMtpz1_gc74lrsGob0rjtgQ&oe=64FA7308", 1);


