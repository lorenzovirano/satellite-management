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