use db_sbook;
    
# Endereco -> Usuário
call sp_inserir_endereco_usuario(
	"Rua Julio Preste",
    "Jardim Belval",
    "Barueri",
    "São Paulo",
    "06420-230",
    "Luiz Gustavo",
    "2006-02-15",
    "gustavo@gmail.com",
    "40022298"
);
call sp_inserir_endereco_usuario(
	"Rua Elton Silva",
    "Centro",
    "Jandira",
    "São Paulo",
    "",
    "Gilson",
    "1985-04-20",
    "gislon@gmail.com",
    "89224002"
);

# Estado Livro
insert into tbl_estado_livro(estado)values("Novo"), ("Seminovo"), ("Usado");

#


    


