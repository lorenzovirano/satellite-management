CREATE OR REPLACE TRIGGER check_data_lancio_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
DECLARE
    data_attuale DATE;
BEGIN
    data_attuale := SYSDATE;

    IF :NEW.data_di_lancio > data_attuale THEN
        RAISE_APPLICATION_ERROR(-20001, 'La data di lancio del satellite non può essere futura');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_tipo_guasto
BEFORE INSERT ON guasto
FOR EACH ROW
DECLARE
    tipo_count INT;
BEGIN
    SELECT COUNT(*) INTO tipo_count
    FROM tipo_guasto
    WHERE tipo = :NEW.tipo_guasto_tipo;

    IF tipo_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Il tipo di guasto specificato non esiste nella tabella tipo_guasto');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_data_missione
BEFORE INSERT ON missione
FOR EACH ROW
BEGIN
    IF :NEW.data_inizio >= :NEW.data_fine THEN
        RAISE_APPLICATION_ERROR(-20003, 'La data di inizio della missione deve essere precedente alla data di fine');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_dimensioni_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF :NEW.dimensioni < 0.1 OR :NEW.dimensioni > 110 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Le dimensioni del satellite devono essere comprese tra 0.1 metri e 110 metri');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_peso_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF :NEW.peso < 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Il peso del satellite deve essere maggiore di 0');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_tipo_operatore
BEFORE INSERT ON operatore
FOR EACH ROW
DECLARE
    tipo_count INT;
BEGIN
    SELECT COUNT(*) INTO tipo_count
    FROM tipo_operatore
    WHERE tipo = :NEW.tipo_operatore_tipo;

    IF tipo_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'Il tipo di operatore specificato non esiste nella tabella tipo_operatore');
    END IF;
END;
/
