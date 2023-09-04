use db_sbook;

########## PROCEDURE PARA INSERT #########

# Endereco -> Usuario
DELIMITER //
create procedure sp_inserir_endereco_usuario(
    logradouro varchar(250),
    bairro varchar(100),
    cidade varchar(100),
    estado varchar(50),
    cep varchar(10),
    nome varchar(60),
    data_nascimento date,
    email varchar(255),
    senha varchar(256)
)
begin
    declare id_endereco int;
    
    if char_length(cep) = 0 or cep = null then 
    
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
    
    else
		insert into tbl_endereco(
			logradouro,
			bairro,
			cidade,
			estado,
            cep
		) values (
			logradouro,
            bairro,
            cidade,
            estado,
            cep
		);

   end if; 
   
   set id_endereco = last_insert_id();
	
		insert into tbl_usuario(
			nome,
            data_nascimento,
            email,
            senha,
            id_endereco
        )values(
			nome,
            data_nascimento,
            email,
            senha,
            id_endereco
        );
end //
DELIMITER ;



