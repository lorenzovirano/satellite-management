CREATE OR REPLACE TRIGGER check_dimensioni_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF :NEW.dimensioni < 0.1 OR :NEW.dimensioni > 110 THEN
        raise_application_error(-20005, 'Le dimensioni del satellite devono essere comprese tra 0.1 metri e 110 metri');
    END IF;
END;