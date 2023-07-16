CREATE TABLE coord_orbitali (
    altitudine NUMBER(19) NOT NULL,
    inclinazione NUMBER(19) NOT NULL,
    eccentricita NUMBER(19) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_satellite_nome_coord_orbt FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_coord_orbitali PRIMARY KEY (altitudine, inclinazione, eccentricita, satellite_nome)
);
