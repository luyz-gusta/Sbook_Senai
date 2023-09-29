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
    "12345678"
);
call sp_inserir_endereco_usuario(
	"Rua Elton Silva",
    "Centro",
    "Jandira",
    "São Paulo",
    "",
    "Thiago",
    "123-456-789-23",
    "1985-04-20",
    "tifreitas10@gmail.com",
    "87654321"
);
call sp_inserir_endereco_usuario(
	"Rua Guarujá",
    "Vila São Nicolau",
    "Jandira",
    "São Paulo",
    "",
    "Bianco",
    "123-458-789-23",
    "2005-08-11",
    "biancapeleao@gmail.com",
    "senai123"
);

# Editora
insert into tbl_editora (nome) values ("Act. Editora"), ("ArtNexus"), ("Banca Tatuí"), ("BEĨ"), ("Cobogó"), ("Desapê"), ('VR Editora'), ('HarperCollins');

# Autor
insert into tbl_autor(nome) values ("J.K Rolling"), ("Stephanke Myers"), ("David Goggins"), ("Donald Trump"), ("Gabriel Gomes"), ('Jeff Kinney'), ('J.R.R. Tolkien');

#Anuncios
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
 ) values ("Diario de um banana 1",
 224,
 2008,
 "Não é fácil ser criança. E ninguém sabe disso melhor do que Greg Heffley, que se vê mergulhado no mundo do ensino fundamental, onde fracotes são obrigados a dividir os corredores com garotos mais altos, mais malvados e que já se barbeiam. Em Diário de um Banana, o autor e ilustrados Jeff Kinney nos apresenta um herói improvável. Como Greg diz em seu diário. Só não espere que seja todo Querido Diário isso, Querido Diário aquilo. Para nossa sorte, o que Greg Heffley diz que fará e o que ele realmente faz são duas coisas bem diferentes.",
 current_timestamp(),
 "1˚ edição",
 "8576831309",
 1,
 1,
 37,
 7
);

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
 ) values (
 "Box Trilogia O Senhor dos Anéis",
 null,
 2019,
 "Apesar de ter sido publicado em três volumes – a sociedade do anel, as duas torres e o retorno do rei – desde os anos 1950, o senhor dos anéis não é exatamente uma trilogia, mas um único grande romance que só pode ser compreendido em seu conjunto, segundo a concepção de seu autor, j.r.r. Tolkien. Com design cuidadosamente pensado para refletir a unidade da obra e os desenhos originais feitos por tolkien para as capas de cada volume, este box reúne os três livros da saga do anel e oferece aos leitores uma nova oportunidade de mergulhar no notável mundo da terra-média.",
 current_timestamp(),
 "1˚ edição",
 "8595086354",
 1,
 1,
 37,
 8
);

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
 ) values (
 "Box Trilogia O Senhor dos Anéis",
 null,
 2019,
 "Apesar de ter sido publicado em três volumes – a sociedade do anel, as duas torres e o retorno do rei – desde os anos 1950, o senhor dos anéis não é exatamente uma trilogia, mas um único grande romance que só pode ser compreendido em seu conjunto, segundo a concepção de seu autor, j.r.r. Tolkien. Com design cuidadosamente pensado para refletir a unidade da obra e os desenhos originais feitos por tolkien para as capas de cada volume, este box reúne os três livros da saga do anel e oferece aos leitores uma nova oportunidade de mergulhar no notável mundo da terra-média.",
 current_timestamp(),
 "1˚ edição",
 "8595086354",
 2,
 2,
 37,
 8
);



#Intemediarios anuncios
insert into tbl_anuncio_genero (id_anuncio, id_genero) values (1, 16), (1, 26),(2, 7), (2,12), (3,7), (3,12);
insert into tbl_anuncio_tipo_anuncio(id_anuncio, id_tipo_anuncio) values (1,2), (1,3), (2,1), (3,3);
insert into tbl_anuncio_autor(id_autor, id_anuncio) values (6,1), (7, 2),(7, 3);
insert into tbl_usuario_anuncio_favoritados(id_usuario, id_anuncio) values (1, 3), (2, 1), (3,1), (3,2);
insert into tbl_foto(id_anuncio, foto) values 
(1, 'https://m.media-amazon.com/images/I/919dh4AX2hL._SL1500_.jpg'),
(2, 'https://m.media-amazon.com/images/I/715afDdgKfL._SL1500_.jpg'),
(3, 'https://m.media-amazon.com/images/I/81C+y75kQpL._SL1500_.jpg');


insert into tbl_usuario_genero(id_usuario, id_genero) values (1, 1), (1,13), (1, 17), (2, 13), (2,1), (2,16), (3,13), (3,2), (3, 9);
insert into tbl_grupo_interesse(nome, data_criacao, descricao) values ("Amantes de Harry Potter", current_timestamp(), "Amamantes de harry Potter de todo o Brasil." );
insert into tbl_tipo_usuario(tipo) values("Administrador"), ("Participante");
insert into tbl_usuario_grupo_interesse_tipo_usuario(id_usuario, id_grupo_interesse, id_tipo_usuario) values (2, 1, 2);
insert into tbl_anuncio_grupo_interesse(id_anuncio, id_grupo_interesse) values (1,1);



