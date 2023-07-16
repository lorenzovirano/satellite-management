CREATE TABLE guasto (
    data_guasto DATE NOT NULL,
    data_riparazione DATE,
    tipo_guasto_tipo VARCHAR2(30) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT pk_guasto PRIMARY KEY (data_guasto, tipo_guasto_tipo),
    CONSTRAINT fk_tipo_guasto FOREIGN KEY (tipo_guasto_tipo) REFERENCES tipo_guasto(tipo) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_guasto FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE
);