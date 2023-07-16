CREATE TABLE satellite (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    dimensioni NUMBER(19) NOT NULL,
    periodo_orbit INTERVAL DAY(0) TO SECOND(0),
    data_lancio DATE DEFAULT SYSDATE NOT NULL,
    peso NUMBER(19) NOT NULL,
    operatore_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_operatore_nome_satellite FOREIGN KEY (operatore_nome) REFERENCES operatore(nome) ON DELETE CASCADE
);
