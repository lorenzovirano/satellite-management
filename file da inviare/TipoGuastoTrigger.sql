CREATE OR REPLACE TRIGGER check_tipo_guasto
BEFORE INSERT ON guasto
FOR EACH ROW
DECLARE
    tipo_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO tipo_count
    FROM tipo_guasto
    WHERE tipo = :NEW.tipo_guasto_tipo;

    IF tipo_count = 0 THEN
        raise_application_error(-20003, 'Il tipo di guasto specificato non esiste nella tabella tipo_guasto');
    END IF;
END;