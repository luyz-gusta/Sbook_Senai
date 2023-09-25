use db_sbook;

call sp_update_endereco_usuario(
	1,
    1,
    'Rua teste update',
    'Bairro teste update',
    'Cidade teste update',
    'Estado teste update',
    '06420-231',
    'Nome teste update',
    '2005-05-25',
    '40028922'
);

update tbl_usuario set senha_reset_expiracao = null where id = 1