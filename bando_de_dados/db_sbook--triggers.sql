use db_sbook;


DELIMITER //

CREATE TRIGGER trgDeleteIDAnuncio_Autor_Foto_Genero_TipoAnuncio
BEFORE DELETE ON tbl_anuncio
FOR EACH ROW
BEGIN

    -- Exclua os registros correspondentes na tbl_anuncio_autor
    DELETE FROM tbl_anuncio_autor
    WHERE id_anuncio = OLD.id;
    
    -- Exclua os registros correspondentes na tbl_anuncio_tipo_anuncio
    DELETE FROM tbl_anuncio_tipo_anuncio
    WHERE id_anuncio = OLD.id;
    
    -- Exclua os registros correspondentes na tbl_anuncio_genero
    DELETE FROM tbl_anuncio_genero
    WHERE id_anuncio = OLD.id;
    
    -- Exclua os registros correspondentes na tbl_anuncio_autor
    DELETE FROM tbl_foto
    WHERE id_anuncio = OLD.id;
    
END;
//

DELIMITER ;


