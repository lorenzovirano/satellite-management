DELIMITER //

-- Vincolo di controllo sulla data di inizio missione rispetto alla data di lancio satellite
CREATE TRIGGER check_data_inizio_missione BEFORE INSERT ON missione
FOR EACH ROW
BEGIN
    DECLARE data_satellite DATETIME;
    SELECT data_di_lancio INTO data_satellite
    FROM satellite
    WHERE NEW.satellite_nome = nome;


    IF NEW.data_inizio < data_satellite THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'La data di inizio missione non può essere minore della data di lancio satellite';
    END IF;
END //

-- Vincolo di controllo sulla data di rilevazione rispetto alla data di lancio satellite
CREATE TRIGGER check_data_rilevazione BEFORE INSERT ON rilevazione
FOR EACH ROW
BEGIN
    DECLARE data_satellite DATETIME;
    SELECT data_di_lancio INTO data_satellite
    FROM satellite
    WHERE NEW.satellite_nome = nome;


    IF NEW.data < data_satellite THEN
        SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'La data di rilevazione non può essere minore della data di lancio satellite';
    END IF;
END //

-- Vincolo di controllo sulla tipologia di guasto
CREATE TRIGGER check_tipo_guasto BEFORE INSERT ON guasto
FOR EACH ROW
BEGIN
    DECLARE tipo_count INT;
    SELECT COUNT(*) INTO tipo_count
    FROM tipo_guasto
    WHERE tipo = NEW.tipo_guasto_tipo;
    
    IF tipo_count = 0 THEN
        SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'Il tipo di guasto specificato non esiste nella tabella tipo_guasto';
    END IF;
END //

-- Vincolo di controllo sulla data di inizio e fine di una missione
CREATE TRIGGER check_data_missione BEFORE INSERT ON missione
FOR EACH ROW
BEGIN
    IF NEW.data_inizio >= NEW.data_fine THEN
        SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'La data di inizio della missione deve essere precedente alla data di fine';
    END IF;
END //

-- Vincolo di controllo sulle dimensioni dei satelliti
CREATE TRIGGER check_dimensioni_satellite BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF NEW.dimensioni < 0.1 OR NEW.dimensioni > 110 THEN
        SIGNAL SQLSTATE '45005' SET MESSAGE_TEXT = 'Le dimensioni del satellite devono essere comprese tra 0.1 metri e 110 metri';
    END IF;
END //

-- Vincolo di controllo sul peso dei satelliti
CREATE TRIGGER check_peso_satellite BEFORE INSERT ON satellite
FOR EACH ROW
BEGIN
    IF NEW.peso < 0 THEN
        SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = 'Il peso del satellite devono essere comprese maggiore di 0';
    END IF;
END //

DELIMITER ;