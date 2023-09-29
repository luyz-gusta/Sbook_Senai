use db_sbook;

select * from tbl_usuario;

show tables;

# Usuário
select 
	usuario.id as id_usuario,
	usuario.nome, 
    date_format(usuario.data_nascimento, '%d-%m-%Y') as data_nascimento,
    date_format(usuario.data_criacao, '%d-%m-%Y %H:%i') as data_criacao,
    usuario.email,
    usuario.senha,
    usuario.foto,
    endereco.logradouro,
    endereco.bairro,
    endereco.cidade,
    endereco.estado,
    endereco.cep
from tbl_usuario as usuario
	inner join tbl_endereco as endereco 
    on usuario.id_endereco = endereco.id;
    
# Avaliação
select avaliacao.id, avaliacao.valor, avaliacao.comentario, usuario.nome from tbl_avaliacao as avaliacao inner join tbl_usuario as usuario on avaliacao.id_usuario = usuario.id;
select * from tbl_idioma;

select * from tbl_anuncio;

select usuario_genero.id as id_genero_preferido_usuario ,genero.id as id_genero ,genero.nome as nome_genero from tbl_genero as genero
	    inner join tbl_usuario_genero as usuario_genero
		    on usuario_genero.id_genero = genero.id
	    inner join tbl_usuario as usuario
		    on usuario.id = usuario_genero.id_usuario
    where usuario.id = 1 order by usuario_genero.id desc limit 1;

delete from tbl_usuario_genero where id = 5;

select * from tbl_genero;

select usuario_genero.id as id_genero_preferido_usuario ,genero.id as id_genero ,genero.nome as nome_genero from tbl_genero as genero
	    inner join tbl_usuario_genero as usuario_genero
		    on usuario_genero.id_genero = genero.id
	    inner join tbl_usuario as usuario
		    on usuario.id = usuario_genero.id_usuario
    where usuario.id = 1 order by usuario_genero.id desc limit 1;
    
select * from tbl_tipo_anuncio;
    
select 
	anuncio.id, 
    anuncio.nome, 
    anuncio.ano_lancamento,
    date_format(anuncio.data_criacao, '%d-%m-%Y %H:%i') as data_criacao,
    anuncio.status_anuncio,
    anuncio.edicao,
    anuncio.preco,
    anuncio.descricao,
    anuncio.status_anuncio,
    anuncio.numero_paginas,
    anuncio.id_usuario,
    endereco.estado,
    endereco.cidade,
    endereco.bairro,
    anuncio.id_estado_livro,
    estado_livro.estado,
    anuncio.id_idioma,
    idioma.nome as nome_idioma,
    anuncio.id_editora,
    editora.nome as nome_editora
from tbl_anuncio as anuncio
	inner join tbl_usuario as usuario
		on usuario.id = anuncio.id_usuario
	inner join tbl_endereco as endereco 
		on endereco.id = usuario.id_endereco
	inner join tbl_estado_livro as estado_livro
		on estado_livro.id = anuncio.id_estado_livro
	inner join tbl_idioma as idioma
		on anuncio.id_idioma = idioma.id
	inner join tbl_editora as editora
		on editora.id = anuncio.id_editora
	inner join tbl_anuncio_genero 
		on tbl_anuncio_genero.id_anuncio = anuncio.id
	inner join tbl_genero as genero
		on genero.id = tbl_anuncio_genero.id_genero
where anuncio.id_usuario = 4;

select * from tbl_genero;

select 
	genero.id, 
    genero.nome 
from tbl_genero as genero
	inner join tbl_anuncio_genero as anuncio_genero
		on anuncio_genero.id_genero = genero.id
	inner join tbl_anuncio as anuncio
		on anuncio_genero.id_anuncio = anuncio.id
where anuncio_genero.id_anuncio = 2;

select * from tbl_anuncio_genero;

select
	autor.id, 
    autor.nome
from tbl_autor as autor 
	inner join tbl_anuncio_autor
		on tbl_anuncio_autor.id_autor = autor.id
	inner join tbl_anuncio as anuncio
		on tbl_anuncio_autor.id_anuncio = anuncio.id
where tbl_anuncio_autor.id_anuncio = 2;


select * from tbl_usuario_temporario;

select 
    anuncio.id, 
    anuncio.nome, 
    anuncio.ano_lancamento,
    date_format(anuncio.data_criacao, '%d-%m-%Y %H:%i') as data_criacao,
    anuncio.status_anuncio,
    anuncio.edicao,
    anuncio.preco,
    anuncio.descricao,
    anuncio.status_anuncio,
    anuncio.numero_paginas,
    anuncio.id_estado_livro,
    estado_livro.estado as estado_livro,
    anuncio.id_idioma,
    idioma.nome as nome_idioma,
    anuncio.id_editora,
    editora.nome as nome_editora,
    foto.foto
    from tbl_anuncio as anuncio
        inner join tbl_foto as foto
            on foto.id_anuncio = anuncio.id
    	inner join tbl_usuario as usuario
	    	on usuario.id = anuncio.id_usuario
	    inner join tbl_endereco as endereco 
    		on endereco.id = usuario.id_endereco
	    inner join tbl_estado_livro as estado_livro
		    on estado_livro.id = anuncio.id_estado_livro
	    inner join tbl_idioma as idioma
    		on anuncio.id_idioma = idioma.id
	    inner join tbl_editora as editora
		    on editora.id = anuncio.id_editora
    where anuncio.id_usuario = 1
	
    

