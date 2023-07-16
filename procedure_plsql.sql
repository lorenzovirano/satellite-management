CREATE OR REPLACE PROCEDURE InsertSatellite(
    p_nome IN VARCHAR2,
    p_dimensioni IN NUMBER,
    p_peso IN NUMBER,
    p_operatore_nome IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM operatore
        WHERE nome = p_operatore_nome
    ) THEN
        RAISE_APPLICATION_ERROR(-20001, 'L''operatore non esiste.');
    ELSE
        INSERT INTO satellite (nome, dimensioni, peso, operatore_nome)
        VALUES (p_nome, p_dimensioni, p_peso, p_operatore_nome);
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE GetSatellite(
    p_nome_satellite IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite
    ) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Il satellite non esiste.');
    ELSE
        SELECT s.nome as satellite_nome, s.dimensioni, s.peso, s.periodo_orbitale, s.data_di_lancio, s.operatore_nome, c.altitudine, c.inclinazione, c.eccentricità, LISTAGG(si.strumento_di_bordo_nome, ', ') WITHIN GROUP (ORDER BY si.strumento_di_bordo_nome) AS strumenti_di_bordo
        FROM satellite s
        JOIN coordinate_orbitali c ON s.nome = c.satellite_nome
        JOIN strumento_di_bordo_satellite si ON s.nome = si.satellite_nome
        WHERE s.nome = p_nome_satellite
        GROUP BY s.nome, c.altitudine, c.inclinazione, c.eccentricità;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE GetCrews(
    p_nome_operatore IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM operatore WHERE nome = p_nome_operatore
    ) THEN
        RAISE_APPLICATION_ERROR(-20003, 'L''operatore non esiste');
    ELSE
        SELECT crew.*
        FROM stazione_terrestre
        JOIN crew ON crew.stazione_terrestre_nome = stazione_terrestre.nome
        WHERE stazione_terrestre.operatore_nome = p_nome_operatore;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE GetMissioniByNomeOperatore(
    p_nome_operatore IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM operatore WHERE nome = p_nome_operatore
    ) THEN
        RAISE_APPLICATION_ERROR(-20004, 'L''operatore non esiste');
    ELSE
        SELECT missione.*
        FROM satellite
        JOIN missione ON missione.satellite_nome = satellite.nome
        WHERE satellite.operatore_nome = p_nome_operatore;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE GetRilevazioniBySatellite(
    p_nome_satellite IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite
    ) THEN
        RAISE_APPLICATION_ERROR(-20005, 'Il satellite non esiste.');
    ELSE
        SELECT * FROM rilevazione WHERE satellite_nome = p_nome_satellite;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE GetGuasti(
    p_nome_satellite IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite
    ) THEN
        RAISE_APPLICATION_ERROR(-20006, 'Il satellite non esiste.');
    ELSE
        SELECT * FROM guasto WHERE satellite_nome = p_nome_satellite;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE GetGuastiByStrumentoNome(
    p_nome_strumento IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM strumento_di_bordo WHERE nome = p_nome_strumento
    ) THEN
        RAISE_APPLICATION_ERROR(-20007, 'Lo strumento di bordo non esiste');
    ELSE
        SELECT * FROM rilevazione WHERE strumento_di_bordo_nome = p_nome_strumento;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE InsertMissione(
    p_nome IN VARCHAR2,
    p_data_inizio IN DATE,
    p_tipo_missione IN VARCHAR2,
    p_crew_nome IN VARCHAR2,
    p_satellite_nome IN VARCHAR2
)
IS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM tipo_missione
        WHERE tipo = p_tipo_missione
    ) THEN
        RAISE_APPLICATION_ERROR(-20008, 'Inserire un corretto tipo di missione.');
    ELSIF NOT EXISTS (
        SELECT 1
        FROM crew
        WHERE nome = p_crew_nome
    ) THEN
        RAISE_APPLICATION_ERROR(-20009, 'La crew inserita non esiste.');
    ELSIF NOT EXISTS (
        SELECT 1
        FROM satellite
        WHERE nome = p_satellite_nome
    ) THEN
        RAISE_APPLICATION_ERROR(-20010, 'Il satellite non esiste');
    ELSE
        INSERT INTO missione (nome, data_inizio, tipo_missione_tipo, crew_nome, satellite_nome)
        VALUES  (p_nome, p_data_inizio, p_tipo_missione, p_crew_nome, p_satellite_nome);
    END IF;
END;
/
