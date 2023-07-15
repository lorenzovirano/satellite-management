CREATE TABLE operatore (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    nazionalita VARCHAR(255) NOT NULL,
    data_di_fondazione DATETIME NOT NULL,
    tipo VARCHAR(255) NOT NULL
);
CREATE TABLE satellite (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    dimensioni BIGINT NOT NULL,
    periodo_orbitale TIME,
    data_di_lancio DATETIME,
    peso BIGINT NOT NULL,
    operatore_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_satellite FOREIGN KEY (operatore_nome) REFERENCES operatore(nome)
);
CREATE TABLE stazione_terrestre (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    longitudine BIGINT NOT NULL,
    latitudine BIGINT NOT NULL,
    operatore_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_stazione_terrestre FOREIGN KEY (operatore_nome) REFERENCES operatore(nome)
);
CREATE TABLE crew (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    data_di_creazione DATETIME NOT NULL,
    numero_membri BIGINT NOT NULL,
    stazione_terrestre_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_stazione_terrestre_nome_crew FOREIGN KEY (stazione_terrestre_nome) REFERENCES stazione_terrestre(nome)
);
CREATE TABLE tipo_missione (tipo VARCHAR(255) PRIMARY KEY NOT NULL);
CREATE TABLE missione (
    nome VARCHAR(255) NOT NULL,
    data_inizio DATETIME NOT NULL,
    data_fine DATETIME,
    tipo_missione_tipo VARCHAR(255) NOT NULL,
    crew_nome VARCHAR(255) NOT NULL,
    satellite_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_tipo_missione_tipo FOREIGN KEY (tipo_missione_tipo) REFERENCES tipo_missione(tipo),
    CONSTRAINT fk_crew_nome_missione FOREIGN KEY (crew_nome) REFERENCES crew(nome),
    CONSTRAINT fk_satellite_nome_missione FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_missione PRIMARY KEY (nome, data_inizio, tipo_missione_tipo)
);
CREATE TABLE strumento_di_bordo (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    funzionalita VARCHAR(255) NOT NULL
);
CREATE TABLE coordinate_orbitali (
    altitudine BIGINT NOT NULL,
    inclinazione BIGINT NOT NULL,
    eccentricità BIGINT NOT NULL,
    satellite_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_coordinate_orbitali FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_coordinate_orbitali PRIMARY KEY (
        altitudine,
        inclinazione,
        eccentricità,
        satellite_nome
    )
);
CREATE TABLE rilevazione (
    valore BIGINT NOT NULL,
    data DATETIME NOT NULL,
    coordinate_orbitali_altitudine BIGINT NOT NULL,
    coordinate_orbitali_inclinazione BIGINT NOT NULL,
    coordinate_orbitali_eccentricità BIGINT NOT NULL,
    strumento_di_bordo_nome VARCHAR(255) NOT NULL,
    satellite_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_strumento_di_bordo_nome_rilevazione FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT fk_coordinate_orbitali_rilevazione FOREIGN KEY (
        coordinate_orbitali_altitudine,
        coordinate_orbitali_inclinazione,
        coordinate_orbitali_eccentricità
    ) REFERENCES coordinate_orbitali(altitudine, inclinazione, eccentricità),
    CONSTRAINT fk_satellite_nome FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_rilevazione PRIMARY KEY (data, strumento_di_bordo_nome)
);
CREATE TABLE tipo_guasto (tipo VARCHAR(255) PRIMARY KEY NOT NULL);
CREATE TABLE guasto (
    data_guasto DATETIME NOT NULL,
    data_riparazione DATETIME,
    tipo_guasto_tipo VARCHAR(255) NOT NULL,
    satellite_nome VARCHAR(255) NOT NULL,
    CONSTRAINT pk_guasto PRIMARY KEY (data_guasto, tipo_guasto_tipo),
    CONSTRAINT fk_tipo_guasto FOREIGN KEY (tipo_guasto_tipo) REFERENCES tipo_guasto(tipo),
    CONSTRAINT fk_satellite_nome_guasto FOREIGN KEY (satellite_nome) REFERENCES satellite(nome)
);
CREATE TABLE strumento_di_bordo_satellite(
    satellite_nome VARCHAR(255) NOT NULL,
    strumento_di_bordo_nome VARCHAR(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_strumento_di_bordo_satellite FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT fk_strumento_di_bordo_nome_strumento_di_bordo_satellite FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT pk_strumento_di_bordo_satellite PRIMARY KEY (satellite_nome, strumento_di_bordo_nome)
);