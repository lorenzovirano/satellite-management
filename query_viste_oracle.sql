-- Operatori spaziali
CREATE VIEW vista_operatori_spaziali AS
SELECT
s.nome AS "Nome satellite",
s.dimensioni AS "Dimensioni satellite",
s.periodo_orbitale AS "Periodo orbitale satellite",
s.data_di_lancio AS "Data lancio satellite",
s.peso AS "Peso satellite",
m.nome AS "Nome missione",
m.data_inizio AS "Data inizio missione",
m.data_fine AS "Data fine missione",
r.valore AS "Valore rilevazione",
r.data AS "Data rilevazione",
g.data_guasto AS "Data guasto",
g.data_riparazione AS "Data riparazione"
FROM satellite s
LEFT JOIN missione m ON s.nome = m.satellite_nome
LEFT JOIN rilevazione r ON s.nome = r.strumento_di_bordo_nome
LEFT JOIN guasto g ON s.nome = g.satellite_nome;

-- Membri equipaggio
CREATE VIEW vista_membri_equipaggio AS
SELECT
c.nome AS "Nome crew",
c.data_di_creazione AS "Data creazione crew",
m.nome AS "Nome missione",
m.data_inizio AS "Data inizio missione",
m.data_fine AS "Data fine missione",
r.valore AS "Valore rilevazione",
r.data AS "Data rilevazione"
FROM crew c
LEFT JOIN missione m ON c.nome = m.crew_nome
LEFT JOIN rilevazione r ON m.nome = r.strumento_di_bordo_nome AND m.data_inizio = r.data;

-- Tecnico manutenzione
CREATE VIEW vista_tecnici_manutenzione AS
SELECT
g.tipo_guasto_tipo AS "Tipo guasto",
g.data_guasto AS "Data guasto",
s.nome AS "Nome satellite",
sd.nome AS "Nome strumento di bordo",
sd.funzionalita AS "Funzionalità strumento di bordo",
g.data_riparazione AS "Data riparazione",
s.dimensioni AS "Dimensioni satellite",
s.peso AS "Peso satellite",
s.periodo_orbitale AS "Periodo orbitale satellite",
s.data_di_lancio AS "Data di lancio satellite"
FROM guasto g
JOIN satellite s ON g.satellite_nome = s.nome
JOIN strumento_di_bordo_satellite sds ON s.nome = sds.satellite_nome
JOIN strumento_di_bordo sd ON sds.strumento_di_bordo_nome = sd.nome;

-- Ricercatore scientifico
CREATE VIEW vista_ricercatori_scientifici AS
SELECT
r.satellite_nome AS "Nome satellite",
r.strumento_di_bordo_nome AS "Nome strumento di bordo",
r.valore AS "Valore rilevazione",
r.data AS "Data rilevazione",
r.coordinate_orbitali_altitudine AS "Altitudine rilevazione",
r.coordinate_orbitali_inclinazione AS "Inclinazione rilevazione",
r.coordinate_orbitali_eccentricità AS "Eccentricità rilevazione"
FROM rilevazione r;