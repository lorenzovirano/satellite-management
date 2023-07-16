CREATE TABLE str_brd_sat (
    satellite_nome VARCHAR2(30) NOT NULL,
    strumento_bordo_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_sat_nome_str_bordo_sat FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT fk_str_nome_str_bordo_sat FOREIGN KEY (strumento_bordo_nome) REFERENCES strumento_bordo(nome) ON DELETE CASCADE,
    CONSTRAINT pk_str_bordo_sat PRIMARY KEY (satellite_nome, strumento_bordo_nome)
);
