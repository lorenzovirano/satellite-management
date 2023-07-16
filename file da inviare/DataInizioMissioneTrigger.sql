CREATE OR REPLACE TRIGGER check_data_missione
BEFORE INSERT ON missione
FOR EACH ROW
BEGIN
    IF :NEW.data_inizio >= :NEW.data_fine THEN
        raise_application_error(-20004, 'La data di inizio della missione deve essere precedente alla data di fine');
    END IF;
END;