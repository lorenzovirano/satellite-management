-- Operatori spaziali
CREATE VIEW vista_operatori_spaziali AS
SELECT 
    s.nome AS satellite_nome,
    s.dimensioni,
    s.periodo_orbitale,
    s.data_di_lancio,
    s.peso,
    m.nome AS missione_nome,
    m.data_inizio AS missione_data_inizio,
    m.data_fine AS missione_data_fine,
    r.valore AS rilevazione_valore,
    r.data AS rilevazione_data,
    g.data_guasto AS guasto_data_guasto,
    g.data_riparazione AS guasto_data_riparazione
FROM satellite s
LEFT JOIN missione m ON s.nome = m.satellite_nome
LEFT JOIN rilevazione r ON s.nome = r.strumento_di_bordo_nome
LEFT JOIN guasto g ON s.nome = g.satellite_nome;


-- Membri equipaggio
CREATE VIEW vista_membri_equipaggio AS
SELECT 
    c.nome AS membro_equipaggio_nome,
    c.data_di_creazione AS membro_equipaggio_data_creazione,
    m.nome AS missione_nome,
    m.data_inizio AS missione_data_inizio,
    m.data_fine AS missione_data_fine,
    r.valore AS rilevazione_valore,
    r.data AS rilevazione_data
FROM crew c
LEFT JOIN missione m ON c.nome = m.crew_nome
LEFT JOIN rilevazione r ON m.nome = r.strumento_di_bordo_nome AND m.data_inizio = r.data;


-- Tecnico manutenzione
CREATE VIEW vista_tecnici_manutenzione AS
SELECT 
    g.data_guasto,
    g.data_riparazione,
    g.tipo_guasto_tipo,
    s.nome AS satellite_nome,
    s.dimensioni AS satellite_dimensioni,
    s.periodo_orbitale AS satellite_periodo_orbitale,
    s.data_di_lancio AS satellite_data_lancio,
    s.peso AS satellite_peso,
    sd.nome AS strumento_di_bordo_nome,
    sd.funzionalita AS strumento_di_bordo_funzionalita
FROM guasto g
JOIN satellite s ON g.satellite_nome = s.nome
JOIN strumento_di_bordo_satellite sds ON s.nome = sds.satellite_nome
JOIN strumento_di_bordo sd ON sds.strumento_di_bordo_nome = sd.nome;

-- Ricercatore scientifico
CREATE VIEW vista_ricercatori_scientifici AS
SELECT 
    r.valore AS rilevazione_valore,
    r.data AS rilevazione_data,
    r.coordinate_orbitali_altitudine AS rilevazione_altitudine,
    r.coordinate_orbitali_inclinazione AS rilevazione_inclinazione,
    r.coordinate_orbitali_eccentricità AS rilevazione_eccentricità,
    r.strumento_di_bordo_nome AS strumento_di_bordo_nome,
    c.altitudine AS satellite_altitudine,
    c.inclinazione AS satellite_inclinazione,
    c.eccentricità AS satellite_eccentricità
FROM rilevazione r
JOIN coordinate_orbitali c ON r.coordinate_orbitali_altitudine = c.altitudine
    AND r.coordinate_orbitali_inclinazione = c.inclinazione
    AND r.coordinate_orbitali_eccentricità = c.eccentricità;
