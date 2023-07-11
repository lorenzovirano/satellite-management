CREATE TABLE tipo_operatore (tipo VARCHAR2(255) PRIMARY KEY NOT NULL);
CREATE TABLE operatore (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    nazionalita VARCHAR2(255) NOT NULL,
    data_di_fondazione TIMESTAMP NOT NULL,
    tipo_operatore_tipo VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_tipo_operatore_tipo FOREIGN KEY (tipo_operatore_tipo) REFERENCES tipo_operatore(tipo)
);
CREATE TABLE satellite (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    dimensioni NUMBER(19) NOT NULL,
    periodo_orbitale INTERVAL DAY(9) TO SECOND(9) NOT NULL,
    data_di_lancio TIMESTAMP NOT NULL,
    peso NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(255) NOT NULL,
    tipo_operatore_tipo VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_satellite FOREIGN KEY (operatore_nome) REFERENCES operatore(nome),
    CONSTRAINT fk_tipo_operatore_tipo_satellite FOREIGN KEY (tipo_operatore_tipo) REFERENCES tipo_operatore(tipo)
);
CREATE TABLE stazione_terrestre (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    longitudine NUMBER(19) NOT NULL,
    latitudine NUMBER(19) NOT NULL,
    tipo_operatore_tipo VARCHAR2(255) NOT NULL,
    operatore_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_tipo_operatore_tipo_stazione_terrestre FOREIGN KEY (tipo_operatore_tipo) REFERENCES tipo_operatore(tipo),
    CONSTRAINT fk_operatore_nome_stazione_terrestre FOREIGN KEY (operatore_nome) REFERENCES operatore(nome)
);
CREATE TABLE crew (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    data_di_creazione TIMESTAMP NOT NULL,
    numero_membri NUMBER(19) NOT NULL,
    stazione_terrestre_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_stazione_terrestre_nome_crew FOREIGN KEY (stazione_terrestre_nome) REFERENCES stazione_terrestre(nome)
);
CREATE TABLE tipo_missione (tipo VARCHAR2(255) PRIMARY KEY NOT NULL);
CREATE TABLE missione (
    nome VARCHAR2(255) NOT NULL,
    data_inizio TIMESTAMP NOT NULL,
    data_fine TIMESTAMP,
    tipo_missione_tipo VARCHAR2(255) NOT NULL,
    crew_nome VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_tipo_missione_tipo FOREIGN KEY (tipo_missione_tipo) REFERENCES tipo_missione(tipo),
    CONSTRAINT fk_crew_nome_missione FOREIGN KEY (crew_nome) REFERENCES crew(nome),
    CONSTRAINT fk_satellite_nome_missione FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_missione PRIMARY KEY (nome, data_inizio, tipo_missione_tipo)
);
CREATE TABLE strumento_di_bordo (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    funzionalita VARCHAR2(255) NOT NULL
);
CREATE TABLE coordinate_orbitali (
    altitudine NUMBER(19) NOT NULL,
    inclinazione NUMBER(19) NOT NULL,
    eccentricità NUMBER(19) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_coordinate_orbitali FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT pk_coordinate_orbitali PRIMARY KEY (
        altitudine,
        inclinazione,
        eccentricità,
        satellite_nome
    )
);
CREATE TABLE rilevazione (
    valore NUMBER(19) NOT NULL,
    data TIMESTAMP NOT NULL,
    coordinate_orbitali_altitudine NUMBER(19) NOT NULL,
    coordinate_orbitali_inclinazione NUMBER(19) NOT NULL,
    coordinate_orbitali_eccentricità NUMBER(19) NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_strumento_di_bordo_nome_rilevazione FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT fk_coordinate_orbitali_rilevazione FOREIGN KEY (
        coordinate_orbitali_altitudine,
        coordinate_orbitali_inclinazione,
        coordinate_orbitali_eccentricità
    ) REFERENCES coordinate_orbitali(altitudine, inclinazione, eccentricità),
    CONSTRAINT pk_rilevazione PRIMARY KEY (data, strumento_di_bordo_nome)
);
CREATE TABLE tipo_guasto (tipo VARCHAR2(255) PRIMARY KEY NOT NULL);
CREATE TABLE guasto (
    data_guasto TIMESTAMP NOT NULL,
    data_riparazione TIMESTAMP NOT NULL,
    tipo_guasto_tipo VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_guasto PRIMARY KEY (data_guasto, tipo_guasto_tipo),
    CONSTRAINT fk_tipo_guasto FOREIGN KEY (tipo_guasto_tipo) REFERENCES tipo_guasto(tipo),
    CONSTRAINT fk_satellite_nome FOREIGN KEY (satellite_nome) REFERENCES satellite(nome)
);
CREATE TABLE strumento_di_bordo_satellite (
    satellite_nome VARCHAR2(255) NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_strumento_di_bordo_satellite FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT fk_strumento_di_bordo_nome_strumento_di_bordo_satellite FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT pk_strumento_di_bordo_satellite PRIMARY KEY (satellite_nome, strumento_di_bordo_nome)
);
CREATE TABLE rilevazione_satellite (
    satellite_nome VARCHAR2(255) NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    rilevazione_data TIMESTAMP NOT NULL,
    CONSTRAINT fk_satellite_nome_rilevazione_satellite FOREIGN KEY (satellite_nome) REFERENCES satellite(nome),
    CONSTRAINT fk_strumento_di_bordo_nome_rilevazione_satellite FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome),
    CONSTRAINT fk_rilevazione_data_rilevazione_satellite FOREIGN KEY (rilevazione_data) REFERENCES rilevazione(data),
    CONSTRAINT pk_rilevazione_satellite PRIMARY KEY (
        satellite_nome,
        strumento_di_bordo_nome,
        rilevazione_data
    )
);