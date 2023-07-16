CREATE OR REPLACE TRIGGER check_data_rilevazione
BEFORE INSERT ON rilevazione
FOR EACH ROW
DECLARE
    data_satellite DATE;
BEGIN
    SELECT data_di_lancio INTO data_satellite
    FROM satellite
    WHERE :NEW.satellite_nome = nome;

    IF :NEW.data < data_satellite THEN
        raise_application_error(-20002, 'La data di rilevazione non può essere minore della data di lancio satellite');
    END IF;
END;