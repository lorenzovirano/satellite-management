-- Table: operatore
CREATE TABLE operatore (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    nazionalita VARCHAR2(255) NOT NULL,
    data_di_fondazione DATE NOT NULL,
    tipo VARCHAR2(255) NOT NULL
);

-- Table: satellite
CREATE TABLE satellite (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    dimensioni NUMBER NOT NULL,
    periodo_orbitale INTERVAL DAY TO SECOND,
    data_di_lancio DATE,
    peso NUMBER NOT NULL,
    operatore_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_satellite FOREIGN KEY (operatore_nome) REFERENCES operatore(nome)
);

-- Table: stazione_terrestre
CREATE TABLE stazione_terrestre (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    longitudine NUMBER NOT NULL,
    latitudine NUMBER NOT NULL,
    operatore_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_stazione_terrestre FOREIGN KEY (operatore_nome) REFERENCES operatore(nome)
);

-- Table: crew
CREATE TABLE crew (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    data_di_creazione DATE NOT NULL,
    numero_membri NUMBER NOT NULL,
    stazione_terrestre_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_stazione_terrestre_nome_crew FOREIGN KEY (stazione_terrestre_nome) REFERENCES stazione_terrestre(nome)
);

-- Table: tipo_missione
CREATE TABLE tipo_missione (tipo VARCHAR2(255) PRIMARY KEY NOT NULL);

-- Table: missione
CREATE TABLE missione (
    nome VARCHAR2(255) NOT NULL,
    data_inizio DATE NOT NULL,
    data_fine DATE,
    tipo_missione_tipo VARCHAR2(255) NOT NULL,
    crew_nome VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_tipo_missione_tipo FOREIGN KEY (tipo_missione_tipo) REFERENCES tipo_missione(tipo),
    CONSTRAINT fk_crew_nome_missione FOREIGN KEY (crew_nome) REFERENCES crew(nome),
    CONSTRAINT fk_satellite_nome_missione FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_missione PRIMARY KEY (nome, data_inizio, tipo_missione_tipo)
);

-- Table: strumento_di_bordo
CREATE TABLE strumento_di_bordo (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    funzionalita VARCHAR2(255) NOT NULL
);

-- Table: coordinate_orbitali
CREATE TABLE coordinate_orbitali (
    altitudine NUMBER NOT NULL,
    inclinazione NUMBER NOT NULL,
    eccentricità NUMBER NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_coordinate_orbitali FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_coordinate_orbitali PRIMARY KEY (
        altitudine,
        inclinazione,
        eccentricità,
        satellite_nome
    )
);

-- Table: rilevazione
CREATE TABLE rilevazione (
    valore NUMBER NOT NULL,
    data DATE NOT NULL,
    coordinate_orbitali_altitudine NUMBER NOT NULL,
    coordinate_orbitali_inclinazione NUMBER NOT NULL,
    coordinate_orbitali_eccentricità NUMBER NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_strumento_di_bordo_nome_rilevazione FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT fk_coordinate_orbitali_rilevazione FOREIGN KEY (
        coordinate_orbitali_altitudine,
        coordinate_orbitali_inclinazione,
        coordinate_orbitali_eccentricità
    ) REFERENCES coordinate_orbitali(altitudine, inclinazione, eccentricità),
    CONSTRAINT fk_satellite_nome FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_rilevazione PRIMARY KEY (data, strumento_di_bordo_nome)
);

-- Table: tipo_guasto
CREATE TABLE tipo_guasto (tipo VARCHAR2(255) PRIMARY KEY NOT NULL);

-- Table: guasto
CREATE TABLE guasto (
    data_guasto DATE NOT NULL,
    data_riparazione DATE,
    tipo_guasto_tipo VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_guasto PRIMARY KEY (data_guasto, tipo_guasto_tipo),
    CONSTRAINT fk_tipo_guasto FOREIGN KEY (tipo_guasto_tipo) REFERENCES tipo_guasto(tipo),
    CONSTRAINT fk_satellite_nome_guasto FOREIGN KEY (satellite_nome) REFERENCES satellite(nome)
);

-- Table: strumento_di_bordo_satellite
CREATE TABLE strumento_di_bordo_satellite(
    satellite_nome VARCHAR2(255) NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_strumento_di_bordo_satellite FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT fk_strumento_di_bordo_nome_strumento_di_bordo_satellite FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT pk_strumento_di_bordo_satellite PRIMARY KEY (satellite_nome, strumento_di_bordo_nome)
);