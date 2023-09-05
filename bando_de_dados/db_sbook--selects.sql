use db_sbook;

select 
	usuario.id as id_usuario,
	usuario.nome, 
    usuario.data_nascimento, 
    usuario.data_criacao, 
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
