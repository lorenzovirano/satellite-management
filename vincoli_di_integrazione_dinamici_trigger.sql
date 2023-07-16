DELIMITER //

-- Vincolo di controllo sulla data di inizio missione rispetto alla data di lancio satellite
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
//

-- Vincolo di controllo sulla data di rilevazione rispetto alla data di lancio satellite
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
//

-- Vincolo di controllo sulla tipologia di guasto
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
//

-- Vincolo di controllo sulla data di inizio e fine di una missione
CREATE OR REPLACE TRIGGER check_data_missione
BEFORE INSERT ON missione
FOR EACH ROW
BEGIN
    IF :NEW.data_inizio >= :NEW.data_fine THEN
        raise_application_error(-20004, 'La data di inizio della missione deve essere precedente alla data di fine');
    END IF;
END;
//

-- Vincolo di controllo sulle dimensioni dei satelliti
CREATE OR REPLACE TRIGGER check_dimensioni_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF :NEW.dimensioni < 0.1 OR :NEW.dimensioni > 110 THEN
        raise_application_error(-20005, 'Le dimensioni del satellite devono essere comprese tra 0.1 metri e 110 metri');
    END IF;
END;
//

-- Vincolo di controllo sul peso dei satelliti
CREATE OR REPLACE TRIGGER check_peso_satellite
BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF :NEW.peso < 0 THEN
        raise_application_error(-20006, 'Il peso del satellite deve essere maggiore di 0');
    END IF;
END;
//

DELIMITER ;
