use db_sbook;

insert into tbl_endereco(
	logradouro,
    bairro,
    cidade,
    estado,
    cep
) values (
	"Rua Julio Preste",
    "Jardim Belval",
    "Barueri",
    "São Paulo",
    "06420-230"
);

insert into tbl_usuario(
	nome, 
    data_nascimento,
    email,
    senha,
    id_endereco
)values(
	"Luiz Gustavo",
    "2006-02-15",
    "gustavo@gmail.com",
    "40028922",
    1
);

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
    
    


