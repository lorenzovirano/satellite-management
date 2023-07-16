CREATE TABLE missione (
    nome VARCHAR2(30) NOT NULL,
    data_inizio DATE DEFAULT SYSDATE NOT NULL,
    data_fine DATE,
    tipo_missione_tipo VARCHAR2(30) NOT NULL,
    crew_nome VARCHAR2(30) NOT NULL,
    satellite_nome VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_tipo_missione_tipo FOREIGN KEY (tipo_missione_tipo) REFERENCES tipo_missione(tipo) ON DELETE CASCADE,
    CONSTRAINT fk_crew_nome_missione FOREIGN KEY (crew_nome) REFERENCES crew(nome) ON DELETE CASCADE,
    CONSTRAINT fk_satellite_nome_missione FOREIGN KEY (satellite_nome) REFERENCES satellite(nome) ON DELETE CASCADE,
    CONSTRAINT pk_missione PRIMARY KEY (nome, data_inizio, tipo_missione_tipo)
);