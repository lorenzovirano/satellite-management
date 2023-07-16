CREATE TABLE operatore (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    nazionalita VARCHAR2(255) NOT NULL,
    data_di_fondazione DATE NOT NULL,
    tipo VARCHAR2(255) NOT NULL
);

CREATE INDEX idx_operatore_nome ON operatore(nome);

CREATE TABLE satellite (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    dimensioni NUMBER(19) NOT NULL,
    periodo_orbitale INTERVAL DAY(0) TO SECOND(0),
    data_di_lancio DATE DEFAULT SYSDATE NOT NULL,
    peso NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_satellite FOREIGN KEY (operatore_nome) REFERENCES operatore(nome) ON DELETE CASCADE
);

CREATE INDEX idx_satellite_nome ON satellite(nome);

CREATE TABLE stazione_terrestre (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    longitudine NUMBER(19) NOT NULL,
    latitudine NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_operatore_nome_stazione_terrestre FOREIGN KEY (operatore_nome) REFERENCES operatore(nome) ON DELETE CASCADE
);

CREATE INDEX idx_stazione_terrestre_nome ON stazione_terrestre(nome);
CREATE INDEX idx_stazione_terrestre_operatore_nome ON stazione_terrestre(operatore_nome);

CREATE TABLE crew (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    data_di_creazione DATE DEFAULT SYSDATE NOT NULL,
    numero_membri NUMBER(19) NOT NULL,
    stazione_terrestre_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT chk_numero_membri_positivo CHECK (numero_membri > 0),
    CONSTRAINT fk_stazione_terrestre_nome_crew FOREIGN KEY (stazione_terrestre_nome) REFERENCES stazione_terrestre(nome) ON DELETE CASCADE
);

CREATE INDEX idx_crew_nome ON crew(nome);
CREATE INDEX idx_crew_stazione_terrestre_nome ON crew(stazione_terrestre_nome);

CREATE TABLE tipo_missione (
    tipo VARCHAR2(255) PRIMARY KEY NOT NULL
);

CREATE INDEX idx_tipo_missione_tipo ON tipo_missione(tipo);

CREATE TABLE missione (
    nome VARCHAR2(255) NOT NULL,
    data_inizio DATE DEFAULT SYSDATE NOT NULL,
    data_fine DATE,
    tipo_missione_tipo VARCHAR2(255) NOT NULL,
    crew_nome VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_tipo_missione_tipo FOREIGN KEY (tipo_missione_tipo) REFERENCES tipo_missione(tipo) ON DELETE CASCADE,
    CONSTRAINT fk_crew_nome_missione FOREIGN KEY (crew_nome) REFERENCES crew(nome) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_missione FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_missione PRIMARY KEY (nome, data_inizio, tipo_missione_tipo)
);

CREATE INDEX idx_missione_nome ON missione(nome);
CREATE INDEX idx_missione_data_inizio ON missione(data_inizio);
CREATE INDEX idx_missione_tipo_missione_tipo ON missione(tipo_missione_tipo);
CREATE INDEX idx_missione_crew_nome ON missione(crew_nome);
CREATE INDEX idx_missione_satellite_nome ON missione(satellite_nome);

CREATE TABLE strumento_di_bordo (
    nome VARCHAR2(255) PRIMARY KEY NOT NULL,
    funzionalita VARCHAR2(255) NOT NULL,
    CONSTRAINT chk_lunghezza_funzionalita CHECK (LENGTH(funzionalita) <= 100)
);

CREATE INDEX idx_strumento_di_bordo_nome ON strumento_di_bordo(nome);

CREATE TABLE coordinate_orbitali (
    altitudine NUMBER(19) NOT NULL,
    inclinazione NUMBER(19) NOT NULL,
    eccentricita NUMBER(19) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_coordinate_orbitali FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_coordinate_orbitali PRIMARY KEY (altitudine, inclinazione, eccentricita, satellite_nome)
);

CREATE INDEX idx_coordinate_orbitali_altitudine ON coordinate_orbitali(altitudine);
CREATE INDEX idx_coordinate_orbitali_inclinazione ON coordinate_orbitali(inclinazione);
CREATE INDEX idx_coordinate_orbitali_eccentricita ON coordinate_orbitali(eccentricita);
CREATE INDEX idx_coordinate_orbitali_satellite_nome ON coordinate_orbitali(satellite_nome);

CREATE TABLE rilevazione (
    valore NUMBER(19) NOT NULL,
    data DATE DEFAULT SYSDATE NOT NULL,
    coordinate_orbitali_altitudine NUMBER(19) NOT NULL,
    coordinate_orbitali_inclinazione NUMBER(19) NOT NULL,
    coordinate_orbitali_eccentricita NUMBER(19) NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_strumento_di_bordo_nome_rilevazione FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome) ON DELETE CASCADE,
    CONSTRAINT fk_coordinate_orbitali_rilevazione FOREIGN KEY (coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricita, satellite_nome) REFERENCES coordinate_orbitali(altitudine, inclinazione, eccentricita, satellite_nome) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_rilevazione PRIMARY KEY (data, strumento_di_bordo_nome)
);

CREATE INDEX idx_rilevazione_data ON rilevazione(data);
CREATE INDEX idx_rilevazione_coordinate_orbitali_altitudine ON rilevazione(coordinate_orbitali_altitudine);
CREATE INDEX idx_rilevazione_coordinate_orbitali_inclinazione ON rilevazione(coordinate_orbitali_inclinazione);
CREATE INDEX idx_rilevazione_coordinate_orbitali_eccentricita ON rilevazione(coordinate_orbitali_eccentricita);
CREATE INDEX idx_rilevazione_strumento_di_bordo_nome ON rilevazione(strumento_di_bordo_nome);
CREATE INDEX idx_rilevazione_satellite_nome ON rilevazione(satellite_nome);

CREATE TABLE tipo_guasto (
    tipo VARCHAR2(255) PRIMARY KEY NOT NULL
);

CREATE INDEX idx_tipo_guasto_tipo ON tipo_guasto(tipo);

CREATE TABLE guasto (
    data_guasto DATE NOT NULL,
    data_riparazione DATE,
    tipo_guasto_tipo VARCHAR2(255) NOT NULL,
    satellite_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT chk_data_guasto CHECK (data_guasto <= SYSDATE),
    CONSTRAINT pk_guasto PRIMARY KEY (data_guasto, tipo_guasto_tipo),
    CONSTRAINT fk_tipo_guasto FOREIGN KEY (tipo_guasto_tipo) REFERENCES tipo_guasto(tipo) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_guasto FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE
);

CREATE INDEX idx_guasto_data_guasto ON guasto(data_guasto);
CREATE INDEX idx_guasto_tipo_guasto_tipo ON guasto(tipo_guasto_tipo);
CREATE INDEX idx_guasto_satellite_nome ON guasto(satellite_nome);

CREATE TABLE strumento_di_bordo_satellite(
    satellite_nome VARCHAR2(255) NOT NULL,
    strumento_di_bordo_nome VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_satellite_nome_strumento_di_bordo_satellite FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT fk_strumento_di_bordo_nome_strumento_di_bordo_satellite FOREIGN KEY (strumento_di_bordo_nome) REFERENCES strumento_di_bordo(nome) ON DELETE CASCADE,
    CONSTRAINT pk_strumento_di_bordo_satellite PRIMARY KEY (satellite_nome, strumento_di_bordo_nome)
);

CREATE INDEX idx_strumento_di_bordo_satellite_satellite_nome ON strumento_di_bordo_satellite(satellite_nome);
CREATE INDEX idx_strumento_di_bordo_satellite_strumento_di_bordo_nome ON strumento_di_bordo_satellite(strumento_di_bordo_nome);
