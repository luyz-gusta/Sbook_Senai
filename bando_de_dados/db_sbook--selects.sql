use db_sbook;

# Usuário
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
    
# Avaliação
select avaliacao.id, avaliacao.valor, avaliacao.comentario, usuario.nome from tbl_avaliacao as avaliacao inner join tbl_usuario as usuario on avaliacao.id_usuario = usuario.id;
select * from tbl_endereco;