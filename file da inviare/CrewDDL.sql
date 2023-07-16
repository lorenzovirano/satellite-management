CREATE TABLE crew (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    data_creazione DATE DEFAULT SYSDATE NOT NULL,
    numero_membri NUMBER(19) NOT NULL,
    staz_terr_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT chk_numero_membri_positivo CHECK (numero_membri > 0),
    CONSTRAINT fk_staz_terr_nome_crew FOREIGN KEY (staz_terr_nome) REFERENCES stazione_terrestre(nome) ON DELETE CASCADE
);