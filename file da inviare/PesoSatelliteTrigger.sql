CREATE OR REPLACE TRIGGER check_peso_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF :NEW.peso < 0 THEN
        raise_application_error(-20006, 'Il peso del satellite deve essere maggiore di 0');
    END IF;
END;