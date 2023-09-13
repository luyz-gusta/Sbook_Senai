use db_sbook;

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
select * from tbl_endereco;

delete from tbl_idioma;

select * from tbl_usuario;

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

