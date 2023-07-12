-- Vincolo di controllo sulla data di lancio del satellite
DELIMITER / / CREATE TRIGGER check_data_lancio_satellite BEFORE
INSERT ON satellite FOR EACH ROW BEGIN
DECLARE data_attuale DATE;
SET data_attuale = CURDATE();
IF NEW.data_di_lancio > data_attuale THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'La data di lancio del satellite non può essere futura';
END IF;
END / / DELIMITER;
-- Vincolo di controllo sulla tipologia di guasto
DELIMITER / / CREATE TRIGGER check_tipo_guasto BEFORE
INSERT ON guasto FOR EACH ROW BEGIN
DECLARE tipo_count INT;
SELECT COUNT(*) INTO tipo_count
FROM tipo_guasto
WHERE tipo = NEW.tipo_guasto_tipo;
IF tipo_count = 0 THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Il tipo di guasto specificato non esiste nella tabella tipo_guasto';
END IF;
END / / DELIMITER;
-- Vincolo di controllo sulla data di inizio e fine di una missione
DELIMITER / / CREATE TRIGGER check_data_missione BEFORE
INSERT ON missione FOR EACH ROW BEGIN IF NEW.data_inizio >= NEW.data_fine THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'La data di inizio della missione deve essere precedente alla data di fine';
END IF;
END / / DELIMITER;
-- Vincolo di controllo sulle dimensioni dei satelliti
DELIMITER / / CREATE TRIGGER check_dimensioni_satellite BEFORE
INSERT ON satellite FOR EACH ROW BEGIN IF NEW.dimensioni < 0.1
    OR NEW.dimensioni > 110 THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Le dimensioni del satellite devono essere comprese tra 0.1 metri e 110 metri';
END IF;
END / / DELIMITER;
-- Vincolo di controllo sulla relazione tra tipo operatore e operatore
DELIMITER / / CREATE TRIGGER check_tipo_operatore BEFORE
INSERT ON operatore FOR EACH ROW BEGIN
DECLARE tipo_count INT;
SELECT COUNT(*) INTO tipo_count
FROM tipo_operatore
WHERE tipo = NEW.tipo_operatore_tipo;
IF tipo_count = 0 THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Il tipo di operatore specificato non esiste nella tabella tipo_operatore';
END IF;
END / / DELIMITER;