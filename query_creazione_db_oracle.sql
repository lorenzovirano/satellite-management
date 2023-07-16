CREATE TABLE operatore (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    nazionalita VARCHAR2(30) NOT NULL,
    data_fondazione DATE NOT NULL,
    tipo VARCHAR2(30) NOT NULL
);

CREATE TABLE satellite (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    dimensioni NUMBER(19) NOT NULL,
    periodo_orbit INTERVAL DAY(0) TO SECOND(0),
    data_lancio DATE DEFAULT SYSDATE NOT NULL,
    peso NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_operatore_nome_satellite FOREIGN KEY (operatore_nome) REFERENCES operatore(nome) ON DELETE CASCADE
);

CREATE TABLE stazione_terrestre (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    longitudine NUMBER(19) NOT NULL,
    latitudine NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_operatore_nome_staz_terr FOREIGN KEY (operatore_nome) REFERENCES operatore(nome) ON DELETE CASCADE
);

CREATE TABLE crew (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    data_creazione DATE DEFAULT SYSDATE NOT NULL,
    numero_membri NUMBER(19) NOT NULL,
    staz_terr_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT chk_numero_membri_positivo CHECK (numero_membri > 0),
    CONSTRAINT fk_staz_terr_nome_crew FOREIGN KEY (staz_terr_nome) REFERENCES stazione_terrestre(nome) ON DELETE CASCADE
);

CREATE TABLE tipo_missione (
    tipo VARCHAR2(30) PRIMARY KEY NOT NULL
);

CREATE TABLE missione (
    nome VARCHAR2(30) NOT NULL,
    data_inizio DATE DEFAULT SYSDATE NOT NULL,
    data_fine DATE,
    tipo_missione_tipo VARCHAR2(30) NOT NULL,
    crew_nome VARCHAR2(30) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_tipo_missione_tipo FOREIGN KEY (tipo_missione_tipo) REFERENCES tipo_missione(tipo) ON DELETE CASCADE,
    CONSTRAINT fk_crew_nome_missione FOREIGN KEY (crew_nome) REFERENCES crew(nome) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_missione FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_missione PRIMARY KEY (nome, data_inizio, tipo_missione_tipo)
);

CREATE TABLE strumento_bordo (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    funzionalita VARCHAR2(30) NOT NULL,
    CONSTRAINT chk_lunghezza_funzionalita CHECK (LENGTH(funzionalita) <= 100)
);

CREATE TABLE coord_orbitali (
    altitudine NUMBER(19) NOT NULL,
    inclinazione NUMBER(19) NOT NULL,
    eccentricita NUMBER(19) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_satellite_nome_coord_orbt FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_coord_orbitali PRIMARY KEY (altitudine, inclinazione, eccentricita, satellite_nome)
);

CREATE TABLE rilevazione (
    valore NUMBER(19) NOT NULL,
    data_rilevazione DATE DEFAULT SYSDATE NOT NULL,
    coord_orbitali_altitudine NUMBER(19) NOT NULL,
    coord_orbitali_inclinazione NUMBER(19) NOT NULL,
    coord_orbitali_eccentricita NUMBER(19) NOT NULL,
    strumento_bordo_nome VARCHAR2(30) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_str_bordo_nome_rilev FOREIGN KEY (strumento_bordo_nome) REFERENCES strumento_bordo(nome) ON DELETE CASCADE,
    CONSTRAINT fk_coord_orbitali_rilev FOREIGN KEY (coord_orbitali_altitudine, coord_orbitali_inclinazione, coord_orbitali_eccentricita, satellite_nome) REFERENCES coord_orbitali(altitudine, inclinazione, eccentricita, satellite_nome) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_rilev FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_rilevazione PRIMARY KEY (data_rilevazione, strumento_bordo_nome)
);

CREATE TABLE tipo_guasto (
    tipo VARCHAR2(30) PRIMARY KEY NOT NULL
);

CREATE TABLE guasto (
    data_guasto DATE NOT NULL,
    data_riparazione DATE,
    tipo_guasto_tipo VARCHAR2(30) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT pk_guasto PRIMARY KEY (data_guasto, tipo_guasto_tipo),
    CONSTRAINT fk_tipo_guasto FOREIGN KEY (tipo_guasto_tipo) REFERENCES tipo_guasto(tipo) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_guasto FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE
);

CREATE TABLE str_brd_sat (
    satellite_nome VARCHAR2(30) NOT NULL,
    strumento_bordo_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_sat_nome_str_bordo_sat FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT fk_str_nome_str_bordo_sat FOREIGN KEY (strumento_bordo_nome) REFERENCES strumento_bordo(nome) ON DELETE CASCADE,
    CONSTRAINT pk_str_bordo_sat PRIMARY KEY (satellite_nome, strumento_bordo_nome)
);
