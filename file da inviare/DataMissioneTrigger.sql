CREATE OR REPLACE TRIGGER check_data_inizio_missione
BEFORE INSERT ON missione
FOR EACH ROW
DECLARE
    data_satellite DATE;
BEGIN
    SELECT data_di_lancio INTO data_satellite
    FROM satellite
    WHERE :NEW.satellite_nome = nome;

    IF :NEW.data_inizio < data_satellite THEN
        raise_application_error(-20001, 'La data di inizio missione non può essere minore della data di lancio satellite');
    END IF;
END;