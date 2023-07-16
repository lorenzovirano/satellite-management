DELIMITER //


CREATE PROCEDURE InsertSatellite(
    IN p_nome VARCHAR(255),
    IN p_dimensioni BIGINT,
    IN p_peso BIGINT,
    IN p_operatore_nome VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM operatore
        WHERE nome = p_operatore_nome
    ) THEN
        SIGNAL SQLSTATE '46000' SET MESSAGE_TEXT = "L'operatore non esiste.";
    ELSE
        INSERT INTO satellite (nome, dimensioni, peso, operatore_nome)
        VALUES (p_nome, p_dimensioni, p_peso, p_operatore_nome);
    END IF;
END //


CREATE PROCEDURE GetSatellite(
    IN p_nome_satellite VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite
    ) THEN
        SIGNAL SQLSTATE '46001' SET MESSAGE_TEXT = "Il satellite non esiste.";
    ELSE
        SELECT satellite.nome , coordinate_orbitali.altitudine, coordinate_orbitali.inclinazione, coordinate_orbitali.eccentricità, GROUP_CONCAT(strumento_di_bordo_satellite.strumento_di_bordo_nome SEPARATOR ', ')
        FROM satellite
        JOIN coordinate_orbitali ON satellite.nome = coordinate_orbitali.satellite_nome
        JOIN strumento_di_bordo_satellite ON satellite.nome = strumenti_di_bordo_satellite.satellite_nome
        WHERE satellite.nome = p_nome_satellite
        GROUP BY satellite.nome;
    END IF;
END //


CREATE PROCEDURE GetCrews(
    IN p_nome_operatore VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM operatore WHERE nome = p_nome_operatore
    ) THEN
        SIGNAL SQLSTATE '46002' SET MESSAGE_TEXT = "L'operatore non esiste";
    ELSE
        SELECT crew.* FROM stazione_terrestre 
        JOIN crew ON crew.stazione_terrestre_nome = stazione_terrestre.nome
        WHERE stazione_terrestre.operatore_nome = p_nome_operatore;
    END IF;
END //


CREATE PROCEDURE GetMissioniByNomeOperatore(
    IN p_nome_operatore VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM operatore WHERE nome = p_nome_operatore
    ) THEN
        SIGNAL SQLSTATE '46003' SET MESSAGE_TEXT = "L'operatore non esiste";
    ELSE
        SELECT missione.*
        FROM satellite
        JOIN missione ON missione.satellite_nome = satellite.nome
        WHERE satellite.operatore_nome = p_nome_operatore;
    END IF;
END //


CREATE PROCEDURE GetRilevazioniBySatellite(
    IN p_nome_satellite VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite
    ) THEN
        SIGNAL SQLSTATE '46004' SET MESSAGE_TEXT = "Il satellite non esiste.";
    ELSE
        SELECT *  FROM rilevazioe WHERE satellite_nome = p_nome_satellite;
    END IF;
END //


CREATE PROCEDURE GetGuasti(
    IN p_nome_satellite VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite
    ) THEN
        SIGNAL SQLSTATE '46005' SET MESSAGE_TEXT = "Il satellite non esiste.";
    ELSE
        SELECT *  FROM guasto WHERE satellite_nome = p_nome_satellite;
    END IF;
END //

CREATE PROCEDURE GetGuastiByStrumentoNome(
    IN p_nome_strumento VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1  FROM strumento_di_bordo WHERE nome = p_nome_strumento
    ) THEN
        SIGNAL SQLSTATE '46006' SET MESSAGE_TEXT = "Lo strumento di bordo non esiste";
    ELSE
        SELECT *  FROM rilevazioe WHERE strumento_di_bordo_nome = p_nome_strumento;
    END IF;
END //


CREATE PROCEDURE InsertMissione(
    IN p_nome VARCHAR(255),
    IN p_data_inizio DATETIME,
    IN p_tipo_missione VARCHAR(255),
    IN p_crew_nome VARCHAR(255),
    IN p_satellite_nome VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM tipo_missione
        WHERE tipo = p_tipo_missione
    ) THEN
        SIGNAL SQLSTATE '46007' SET MESSAGE_TEXT = "Inserire un corretto tipo di missione.";
    ELSEIF NOT EXISTS (
        SELECT 1
        FROM crew
        WHERE nome = p_crew_nome
    ) THEN
        SIGNAL SQLSTATE '46008' SET MESSAGE_TEXT = "La crew inserita non esiste.";
    ELSEIF NOT EXISTS (
        SELECT 1
        FROM satellite
        WHERE nome = p_satellite_nome
    ) THEN
        SIGNAL SQLSTATE '46009' SET MESSAGE_TEXT = "Il satellite non esiste";
    ELSE
        INSERT INTO missione (nome, data_inizio, tipo_missione_tipo, crew_nome, satellite_nome)
        VALUES  (p_nome, p_data_inizio, p_tipo_missione, p_crew_nome, p_satellite_nome);
    END IF;
END //


DELIMITER ;
