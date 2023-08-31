use db_sbook;

########## PROCEDURE PARA INSERT EM 3 TABELAS #########
DELIMITER //

create procedure sp_inserir_dados(
    logradouro varchar(250),
    bairro varchar(100),
    cidade varchar(100),
    estado varchar(50),
    cep varchar(10),
    nome varchar(60),
    data_nascimento date,
    email varchar(255),
    senha varchar(256),
    id_endereco int
)
begin
    declare id_endereco int;
    
    if char_length(cep) = 0 or cep = null   then 
		insert into tbl_endereco(
			logradouro,
			bairro,
			cidade,
			estado
		) values (
			logradouro,
            bairro,
            cidade,
            estado
		);
	set id_endereco = select id
	else
		set cep = 1;

    -- Inserir dados na tabela tbl_aluno
    insert into tbl_aluno (nome, data_nascimento, email)
    values (nome_aluno, data_nascimento, email_aluno);
    
    -- Obter o ID do aluno inserido
    set id_aluno = LAST_INSERT_ID();

    -- Inserir dados na tabela tbl_usuario
    insert into tbl_usuario (email, senha, id_status_usuario)
    values (email_usuario, senha, 2); -- O valor "2" representa o ID do status de usuário desejado
    
    -- Obter o ID do usuário inserido
    set id_usuario = LAST_INSERT_ID();

    -- Inserir dados na tabela tbl_matricula
    insert into tbl_matricula (numero, id_status_matricula, id_aluno, id_usuario)
    values (numero_matricula, 1, id_aluno, id_usuario); -- O valor "1" representa o ID do status de matrícula desejado
   end if; 
end //

DELIMITER ;