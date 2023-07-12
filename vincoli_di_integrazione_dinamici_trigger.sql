-- Vincolo di controllo sulla data di lancio del satellite: 
-- assicura che la data di lancio di un satellite sia precedente alla data
-- attuale o al massimo alla data di oggi. In questo modo si evita l'inserimento 
-- di date future per i lanci dei satelliti.
CREATE OR REPLACE TRIGGER check_data_lancio_satellite BEFORE
INSERT
    OR
UPDATE ON satellite FOR EACH ROW
DECLARE data_attuale DATE := SYSDATE;
BEGIN IF :NEW.data_di_lancio > data_attuale THEN RAISE_APPLICATION_ERROR(
    -20001,
    'La data di lancio del satellite non può essere futura.'
);
END IF;
END;
/ -- Vincolo di controllo sulla data di rilevazione:
-- garantisce che la data di una rilevazione sia successiva alla data di lancio 
-- del satellite corrispondente. . Questo evita che vengano inserite rilevazioni 
-- prima del lancio del satellite.
CREATE OR REPLACE TRIGGER check_data_rilevazione BEFORE
INSERT
    OR
UPDATE ON rilevazione FOR EACH ROW
DECLARE data_lancio DATE;
BEGIN
SELECT data_di_lancio INTO data_lancio
FROM satellite
WHERE nome = :NEW.satellite_nome;
IF :NEW.data > data_lancio THEN -- La data di rilevazione è successiva alla data di lancio del satellite
NULL;
ELSE RAISE_APPLICATION_ERROR(
    -20001,
    'La data di rilevazione non può essere antecedente alla data di lancio del satellite corrispondente.'
);
END IF;
END;
/ -- Vincolo di controllo sulla tipologia di guasto: 
-- permette l'inserimento di tipi di guasto solo se esistono nella tabella "tipo_guasto".
-- Questo vincolo garantisce che i guasti siano classificati correttamente e non siano 
-- presenti tipologie non valide.
CREATE OR REPLACE TRIGGER check_tipo_guasto BEFORE
INSERT
    OR
UPDATE ON guasto FOR EACH ROW BEGIN IF NOT EXISTS (
        SELECT 1
        FROM tipo_guasto
        WHERE tipo = :NEW.tipo_guasto_tipo
    ) THEN RAISE_APPLICATION_ERROR(
        -20001,
        'Il tipo di guasto specificato non esiste nella tabella tipo_guasto.'
    );
END IF;
END;
/ -- Vincolo di controllo sulla data di inizio e fine di una missione:
-- assicura che la data di inizio di una missione sia precedente alla data di fine.
-- In questo modo si evitano missioni con date inconsistenti o sovrapposte.
CREATE OR REPLACE TRIGGER check_data_missione BEFORE
INSERT
    OR
UPDATE ON missione FOR EACH ROW BEGIN IF :NEW.data_inizio >= :NEW.data_fine THEN RAISE_APPLICATION_ERROR(
        -20001,
        'La data di inizio della missione deve essere precedente alla data di fine.'
    );
END IF;
END;
/ -- Vincolo di controllo sulle dimensioni dei satelliti:
-- limita le dimensioni dei satelliti ad un valore massimo specificato, ad esempio minimo 0.1 massimo 110 metri.
-- In questo modo si evita l'inserimento di satelliti con dimensioni non realistiche o fuori dai limiti 
-- consentiti.
CREATE OR REPLACE TRIGGER check_dimensioni_satellite BEFORE
INSERT
    OR
UPDATE ON satellite FOR EACH ROW BEGIN IF :NEW.dimensioni < 0.1
    OR :NEW.dimensioni > 110 THEN RAISE_APPLICATION_ERROR(
        -20001,
        'Le dimensioni del satellite devono essere comprese tra 0.1 metri e 110 metri.'
    );
END IF;
END;
/ -- Vincolo di controllo sulla relazione tra tipo operatore e operatore:
-- assicura che il tipo di operatore associato a un operatore sia valido e esista nella tabella "tipo_operatore".
-- Questo vincolo impedisce l'inserimento di tipi di operatore non validi o inesistenti per gli operatori.
CREATE OR REPLACE TRIGGER check_tipo_operatore BEFORE
INSERT
    OR
UPDATE ON operatore FOR EACH ROW BEGIN IF NOT EXISTS (
        SELECT 1
        FROM tipo_operatore
        WHERE tipo = :NEW.tipo_operatore_tipo
    ) THEN RAISE_APPLICATION_ERROR(
        -20001,
        'Il tipo di operatore specificato non esiste nella tabella tipo_operatore.'
    );
END IF;
END;
/