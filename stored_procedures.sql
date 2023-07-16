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
        SELECT 1 FROM satellite WHERE nome = p_nome_satellite;
    END IF;
END //


CREATE PROCEDURE GetCrews(
    IN p_nome_operatore VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT crew.* FROM stazione_terrestre 
        JOIN crew ON crew.stazione_terrestre_nome = stazione_terrestre.nome
        WHERE stazione_terrestre.operatore_nome = p_nome_operatore
    ) THEN
        SIGNAL SQLSTATE '46002' SET MESSAGE_TEXT = "L'operatore non ha Crew";
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
        SELECT missione.*
        FROM satellite
        JOIN missione ON missione.satellite_nome = satellite.nome
        WHERE satellite.operatore_nome = p_nome_operatore
    ) THEN
        SIGNAL SQLSTATE '46004' SET MESSAGE_TEXT = "L'operatore non ha missioni associate";
    ELSE
        SELECT missione.*
        FROM satellite
        JOIN missione ON missione.satellite_nome = satellite.nome
        WHERE satellite.operatore_nome = p_nome_operatore;
    END IF;
END //


CREATE PROCEDURE GetRilevazioni(
    IN p_nome_satellite VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1  FROM rilevazioe WHERE satellite_nome = p_nome_satellite
    ) THEN
        SIGNAL SQLSTATE '46005' SET MESSAGE_TEXT = "Il satellite non ha rilevazioni";
    ELSE
        SELECT *  FROM rilevazioe WHERE satellite_nome = p_nome_satellite;
    END IF;
END //


CREATE PROCEDURE GetGuasti(
    IN p_nome_satellite VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1  FROM guasto WHERE satellite_nome = p_nome_satellite
    ) THEN
        SIGNAL SQLSTATE '46006' SET MESSAGE_TEXT = "Il satellite non è stato afflitto da guasti";
    ELSE
        SELECT *  FROM guasto WHERE satellite_nome = p_nome_satellite;
    END IF;
END //

DELIMITER ;
