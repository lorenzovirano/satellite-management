CREATE TABLE strumento_bordo (
    nome VARCHAR2(30) PRIMARY KEY NOT NULL,
    funzionalita VARCHAR2(30) NOT NULL,
    CONSTRAINT chk_lunghezza_funzionalita CHECK (LENGTH(funzionalita) <= 100)
);
