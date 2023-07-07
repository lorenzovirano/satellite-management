CREATE TABLE satellite (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    dimensioni BIGINT NOT NULL,
    periodo_orbitale TIME NOT NULL,
    data_di_lancio DATETIME NOT NULL,
    peso BIGINT NOT NULL
);
CREATE TABLE operatore (
    nome VARCHAR(255) PRIMARY KEY NOT NULL,
    nazionalita VARCHAR(255) NOT NULL,
    data_di_fondazione DATETIME NOT NULL
);
CREATE TABLE tipo_operatore (nome VARCHAR(255) PRIMARY KEY NOT NULL);
CREATE TABLE missione (
    nome VARCHAR(255) NOT NULL,
    data_inizio DATETIME NOT NULL,
    data_fine DATETIME
);
CREATE TABLE tipo_missione (tipo VARCHAR(255) PRIMARY KEY NOT NULL);