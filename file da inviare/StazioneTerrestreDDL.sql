CREATE TABLE stazione_terrestre (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    longitudine NUMBER(19) NOT NULL,
    latitudine NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_operatore_nome_staz_terr FOREIGN KEY (operatore_nome) REFERENCES operatore(nome) ON DELETE CASCADE
);
