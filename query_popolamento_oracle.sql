-- Operatore
INSERT INTO operatore (nome, nazionalita, data_di_fondazione, tipo)
VALUES
    ('SpaceX', 'USA', TO_DATE('2002-03-14', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('Boeing', 'USA', TO_DATE('1916-07-15', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('MIT', 'USA', TO_DATE('1861-04-10', 'YYYY-MM-DD'), 'Operatore Di Ricerca'),
    ('Japan Aerospace Exploration Agency', 'Giappone', TO_DATE('2003-10-01', 'YYYY-MM-DD'), 'Operatore Governativo'),
    ('United Launch Alliance', 'USA', TO_DATE('2006-12-01', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('Arianespace', 'Francia', TO_DATE('1980-03-26', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('Roscosmos', 'Russia', TO_DATE('1992-01-01', 'YYYY-MM-DD'), 'Operatore Governativo'),
    ('China National Space Administration', 'Cina', TO_DATE('1993-04-22', 'YYYY-MM-DD'), 'Operatore Governativo'),
    ('Standford University', 'USA', TO_DATE('1885-10-01', 'YYYY-MM-DD'), 'Operatore Di Ricerca'),
    ('Blue Origin', 'USA', TO_DATE('2000-09-08', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('Airbus Defence and Space', 'Francia', TO_DATE('2000-07-01', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('European Space Agency', 'Organizzazione internazionale con membri europei', TO_DATE('1975-05-30', 'YYYY-MM-DD'), 'Operatore Governativo'),
    ('Rocket Lab', 'Nuova Zelanda', TO_DATE('2006-03-01', 'YYYY-MM-DD'), 'Operatore Commerciale'),
    ('National Aeronautics and Space Administration', 'USA', TO_DATE('1958-07-29', 'YYYY-MM-DD'), 'Operatore Governativo'),
    ('Politecnico di Torino', 'Italia', TO_DATE('1859-11-09', 'YYYY-MM-DD'), 'Operatore Di Ricerca');

-- Satelliti
INSERT INTO satellite (nome, dimensioni, periodo_orbitale, data_di_lancio, peso, operatore_nome)
VALUES
    ('GOES-16', 100, INTERVAL '1 30:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-03-12 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2000, 'SpaceX'),
    ('Hubble Space Telescope', 80, INTERVAL '2 15:00' HOUR TO MINUTE, TO_TIMESTAMP('2021-11-20 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1500, 'Boeing'),
    ('ISS', 100, INTERVAL '3 45:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-05-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 1800, 'MIT'),
    ('Landsat 8', 100, INTERVAL '1 30:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-08-25 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2500, 'Japan Aerospace Exploration Agency'),
    ('GPS IIF-12', 100, INTERVAL '2 45:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-09-18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1900, 'United Launch Alliance'),
    ('Galileo 17', 90, INTERVAL '1 00:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-06-10 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1700, 'Arianespace'),
    ('Chandra X-ray Observatory', 102, INTERVAL '2 30:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-07-18 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 2200, 'Roscosmos'),
    ('TerraSAR-X', 16, INTERVAL '3 15:00' HOUR TO MINUTE, TO_TIMESTAMP('2023-01-05 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2700, 'China National Space Administration'),
    ('Iridium 6', 14, INTERVAL '2 00:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-09-10 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2300, 'Standford University'),
    ('Venus Express', 109, INTERVAL '1 30:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-12-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2000, 'Blue Origin'),
    ('XMM-Newton', 102, INTERVAL '2 15:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-02-01 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1800, 'Airbus Defence and Space'),
    ('RADARSAT-2', 90, INTERVAL '1 00:00' HOUR TO MINUTE, TO_TIMESTAMP('2023-04-05 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1500, 'European Space Agency'),
    ('NOAA-19', 11, INTERVAL '2 45:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-07-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2100, 'Rocket Lab'),
    ('Spitzer Space Telescope', 13, INTERVAL '2 30:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-10-15 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 2400, 'National Aeronautics and Space Administration'),
    ('Tiangong-2', 15, INTERVAL '3 15:00' HOUR TO MINUTE, TO_TIMESTAMP('2022-09-02 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2800, 'Politecnico di Torino');

-- Stazioni terrestri
INSERT INTO stazione_terrestre (nome, longitudine, latitudine, operatore_nome)
VALUES
    ('Goldstone Deep Space Communications Complex', -116.895, 35.400, 'SpaceX'),
    ('European Space Operations Centre', 8.422, 50.000, 'Boeing'),
    ('Guiana Space Centre', -52.768, 5.236, 'MIT'),
    ('John F. Kennedy Space Center', -80.605, 28.392, 'Japan Aerospace Exploration Agency'),
    ('Baikonur Cosmodrome', 63.344, 45.965, 'United Launch Alliance'),
    ('Tianhe Space Station', 110.467, 40.958, 'Arianespace'),
    ('Wallops Flight Facility', -75.483, 37.940, 'Roscosmos'),
    ('Jiuquan Satellite Launch Center', 100.286, 40.958, 'China National Space Administration'),
    ('Tanegashima Space Center', 130.987, 30.378, 'Standford University'),
    ('Satish Dhawan Space Centre', 80.234, 13.733, 'Blue Origin'),
    ('Vandenberg Space Force Base', -120.600, 34.756, 'Airbus Defence and Space'),
    ('Taiyuan Satellite Launch Center', 112.550, 38.848, 'European Space Agency'),
    ('Kourou Spaceport', -52.768, 5.236, 'Rocket Lab'),
    ('Xichang Satellite Launch Center', 102.034, 28.246, 'National Aeronautics and Space Administration'),
    ('Alcântara Launch Center', -44.396, -2.370, 'Politecnico di Torino');

-- Crew
INSERT INTO crew (nome, data_di_creazione, numero_membri, stazione_terrestre_nome)
VALUES
    ('Apollo 11', TO_DATE('1969-07-20', 'YYYY-MM-DD'), 10, 'Goldstone Deep Space Communications Complex'),
    ('Discovery 7', TO_DATE('1991-11-26', 'YYYY-MM-DD'), 12, 'European Space Operations Centre'),
    ('Expedition 1', TO_DATE('2000-11-02', 'YYYY-MM-DD'), 10, 'Guiana Space Centre'),
    ('Endeavour 5', TO_DATE('2002-07-26', 'YYYY-MM-DD'), 14, 'John F. Kennedy Space Center'),
    ('Soyuz 7', TO_DATE('2010-06-16', 'YYYY-MM-DD'), 9, 'Baikonur Cosmodrome'),
    ('Shenzhou 9', TO_DATE('2012-06-18', 'YYYY-MM-DD'), 10, 'Tianhe Space Station'),
    ('Galaxy 4', TO_DATE('1989-06-15', 'YYYY-MM-DD'), 11, 'Wallops Flight Facility'),
    ('Chang Zheng 4', TO_DATE('2002-12-29', 'YYYY-MM-DD'), 13, 'Jiuquan Satellite Launch Center'),
    ('Hayabusa 2', TO_DATE('2014-12-03', 'YYYY-MM-DD'), 12, 'Tanegashima Space Center'),
    ('Mars Orbiter Mission', TO_DATE('2013-11-05', 'YYYY-MM-DD'), 11, 'Satish Dhawan Space Centre'),
    ('Falcon 9', TO_DATE('2010-06-04', 'YYYY-MM-DD'), 9, 'Vandenberg Space Force Base'),
    ('Long March 7', TO_DATE('2016-06-25', 'YYYY-MM-DD'), 11, 'Taiyuan Satellite Launch Center'),
    ('Vostok 1', TO_DATE('1961-04-12', 'YYYY-MM-DD'), 7, 'Kourou Spaceport'),
    ('Tiangong 2', TO_DATE('2016-09-15', 'YYYY-MM-DD'), 10, 'Xichang Satellite Launch Center'),
    ('Amazonia-1', TO_DATE('2021-02-28', 'YYYY-MM-DD'), 8, 'Alcântara Launch Center');

    -- Tipo missione
INSERT INTO tipo_missione (tipo)
VALUES
    ('Esplorazione'),
    ('Ricerca scientifica'),
    ('Telecomunicazioni'),
    ('Osservazione terrestre'),
    ('Meteorologia'),
    ('Navigazione'),
    ('Rifornimento spaziale'),
    ('Test tecnologici'),
    ('Mappatura'),
    ('Studio dell''atmosfera'),
    ('Studio dell''ambiente spaziale'),
    ('Studio del clima'),
    ('Studio delle risorse naturali'),
    ('Missioni umane'),
    ('Missioni robotiche');

    
-- Missioni
INSERT INTO missione (nome, data_inizio, data_fine, tipo_missione_tipo, crew_nome, satellite_nome)
VALUES
    ('Apollo 11', TO_DATE('2022-05-12 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-12 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Esplorazione', 'Apollo 11', 'GOES-16'),
    ('Discovery 7', TO_DATE('2021-11-25 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-25 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ricerca scientifica', 'Discovery 7', 'Hubble Space Telescope'),
    ('Expedition 1', TO_DATE('2022-07-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Telecomunicazioni', 'Expedition 1', 'ISS'),
    ('Endeavour 5', TO_DATE('2022-08-30 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-30 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Osservazione terrestre', 'Endeavour 5', 'Landsat 8'),
    ('Soyuz 7', TO_DATE('2022-10-18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Meteorologia', 'Soyuz 7', 'GPS IIF-12'),
    ('Shenzhou 9', TO_DATE('2022-06-15 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-10 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Navigazione', 'Shenzhou 9', 'Galileo 17'),
    ('Galaxy 4', TO_DATE('2022-08-18 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-18 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Rifornimento spaziale', 'Galaxy 4', 'Chandra X-ray Observatory'),
    ('Chang Zheng 4', TO_DATE('2023-01-05 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Test tecnologici', 'Chang Zheng 4', 'TerraSAR-X'),
    ('Hayabusa 2', TO_DATE('2022-10-10 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-10 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Mappatura', 'Hayabusa 2', 'Iridium 6'),
    ('Mars Orbiter Mission', TO_DATE('2022-12-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Studio dell''atmosfera', 'Mars Orbiter Mission', 'Venus Express'),
    ('Falcon 9', TO_DATE('2022-03-10 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-01 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Studio dell''ambiente spaziale', 'Falcon 9', 'XMM-Newton'),
    ('Long March 7', TO_DATE('2023-04-05 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Studio del clima', 'Long March 7', 'RADARSAT-2'),
    ('Vostok 1', TO_DATE('2022-07-16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Studio delle risorse naturali', 'Vostok 1', 'NOAA-19'),
    ('Tiangong 2', TO_DATE('2022-11-15 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Missioni umane', 'Tiangong 2', 'Spitzer Space Telescope'),
    ('Amazonia-1', TO_DATE('2022-10-02 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Missioni robotiche', 'Amazonia-1', 'Tiangong-2');

-- Strumenti di bordo
INSERT INTO strumento_di_bordo (nome, funzionalita)
VALUES
    ('Radar Altimeter', 'Misura l''altezza sopra la superficie terrestre utilizzando i segnali radar'),
    ('Multispectral Imager', 'Acquisisce immagini in diverse bande dello spettro elettromagnetico'),
    ('Thermal Infrared Sensor', 'Rileva la radiazione termica emessa dagli oggetti'),
    ('Synthetic Aperture Radar', 'Genera immagini ad alta risoluzione utilizzando segnali radar'),
    ('Global Navigation Satellite System', 'Permette la determinazione precisa delle coordinate e del tempo'),
    ('Scatterometer', 'Misura la velocità e la direzione dei venti attraverso l''analisi dei segnali radar'),
    ('Radiometer', 'Misura l''emissione elettromagnetica di un oggetto o di una regione'),
    ('Spectrometer', 'Analizza lo spettro di radiazione per identificare le caratteristiche di un oggetto'),
    ('Lidar', 'Utilizza un raggio laser per misurare la distanza e le caratteristiche di un oggetto'),
    ('Hyperspectral Imager', 'Acquisisce immagini in molte bande dello spettro elettromagnetico'),
    ('Magnetometer', 'Misura l''intensità e la direzione del campo magnetico'),
    ('X-ray Spectrometer', 'Analizza lo spettro di raggi X per determinare la composizione di un oggetto'),
    ('Visible and Infrared Imaging Spectrometer', 'Acquisisce immagini in bande visibili e infrarosse'),
    ('Cloud Profiling Radar', 'Stima le proprietà delle nuvole, come altezza, spessore e struttura'),
    ('Microwave Radiometer', 'Misura la radiazione elettromagnetica nelle frequenze delle microonde'),
    ('UV-Visible Spectrometer', 'Analizza lo spettro ultravioletto e visibile per identificare le caratteristiche di un oggetto');

-- Coordinate orbitali
INSERT INTO coordinate_orbitali (altitudine, inclinazione, eccentricità, satellite_nome)
VALUES
    (800, 30, 0.2, 'GOES-16'),
    (1500, 75, 0.8, 'Hubble Space Telescope'),
    (1200, 60, 0.6, 'ISS'),
    (2800, 165, 2.0, 'Landsat 8'),
    (1800, 90, 1.0, 'GPS IIF-12'),
    (1000, 45, 0.4, 'Galileo 17'),
    (3400, 210, 2.6, 'Chandra X-ray Observatory'),
    (2200, 120, 1.4, 'TerraSAR-X'),
    (2600, 150, 1.8, 'Iridium 6'),
    (2000, 105, 1.2, 'Venus Express'),
    (3000, 180, 2.2, 'XMM-Newton'),
    (3200, 195, 2.4, 'RADARSAT-2'),
    (2400, 135, 1.6, 'NOAA-19'),
    (3600, 225, 2.8, 'Spitzer Space Telescope'),
    (3800, 240, 3.0, 'Tiangong-2');

-- Rilevazione
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (150, TO_TIMESTAMP('2022-05-12 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 800, 30, 0.2, 'Radar Altimeter', 'GOES-16');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (220, TO_TIMESTAMP('2021-12-25 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1500, 75, 0.8, 'Multispectral Imager', 'Hubble Space Telescope');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (180, TO_TIMESTAMP('2022-07-30 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), 1200, 60, 0.6, 'Thermal Infrared Sensor', 'ISS');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (300, TO_TIMESTAMP('2022-09-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2800, 165, 2.0, 'Synthetic Aperture Radar', 'Landsat 8');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (250, TO_TIMESTAMP('2022-10-19 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1800, 90, 1.0, 'Global Navigation Satellite System', 'GPS IIF-12');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (170, TO_TIMESTAMP('2022-08-15 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1000, 45, 0.4, 'Scatterometer', 'Galileo 17');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (190, TO_TIMESTAMP('2022-10-18 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 3400, 210, 2.6, 'Radiometer', 'Chandra X-ray Observatory');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (260, TO_TIMESTAMP('2023-02-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2200, 120, 1.4, 'Spectrometer', 'TerraSAR-X');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (240, TO_TIMESTAMP('2022-10-10 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2600, 150, 1.8, 'Lidar', 'Iridium 6');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (280, TO_TIMESTAMP('2022-12-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2000, 105, 1.2, 'Hyperspectral Imager', 'Venus Express');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (210, TO_TIMESTAMP('2022-05-10 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3000, 180, 2.2, 'Magnetometer', 'XMM-Newton');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (270, TO_TIMESTAMP('2023-05-05 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3200, 195, 2.4, 'X-ray Spectrometer', 'RADARSAT-2');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (230, TO_TIMESTAMP('2022-08-16 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2400, 135, 1.6, 'Visible and Infrared Imaging Spectrometer', 'NOAA-19');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (200, TO_TIMESTAMP('2022-12-15 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 3600, 225, 2.8, 'Cloud Profiling Radar', 'Spitzer Space Telescope');
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome, satellite_nome) VALUES (290, TO_TIMESTAMP('2022-10-05 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 3800, 240, 3.0, 'Microwave Radiometer', 'Tiangong-2');

-- Tipo guasto
INSERT INTO tipo_guasto (tipo) VALUES ('Alimentazione Elettrica');
INSERT INTO tipo_guasto (tipo) VALUES ('Propulsione');
INSERT INTO tipo_guasto (tipo) VALUES ('Comunicazione');
INSERT INTO tipo_guasto (tipo) VALUES ('Controllo dell''Assetto');
INSERT INTO tipo_guasto (tipo) VALUES ('Navigazione');
INSERT INTO tipo_guasto (tipo) VALUES ('Termico');
INSERT INTO tipo_guasto (tipo) VALUES ('Carico Utile');
INSERT INTO tipo_guasto (tipo) VALUES ('Raccolta Dati');
INSERT INTO tipo_guasto (tipo) VALUES ('Telemetria e Telecontrollo');
INSERT INTO tipo_guasto (tipo) VALUES ('Protezione dalle Radiazioni');
INSERT INTO tipo_guasto (tipo) VALUES ('Apertura/Chiusura Pannelli Solari');
INSERT INTO tipo_guasto (tipo) VALUES ('Distribuzione dell''Energia');
INSERT INTO tipo_guasto (tipo) VALUES ('Navigazione Stellare');
INSERT INTO tipo_guasto (tipo) VALUES ('Protezione dai Detriti Spaziali');
INSERT INTO tipo_guasto (tipo) VALUES ('Controllo di Volo');

-- Guasto
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-12-01 01:46:11', '2024-01-08 03:56:32', 'GOES-16', 'Alimentazione Elettrica');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2022-12-31 03:16:51', NULL, 'Hubble Space Telescope', 'Propulsione');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2022-03-30 18:11:34', '2023-07-18 03:39:01', 'ISS', 'Comunicazione');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-06-08 19:15:57', '2023-08-23 18:24:54', 'Landsat 8', 'Controllo dell''Assetto');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-06-10 01:41:30', '2023-09-29 19:39:17', 'GPS IIF-12', 'Navigazione');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-09-27 12:21:19', '2023-10-31 01:54:50', 'Galileo 17', 'Termico');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-05-11 23:18:36', '2023-12-19 12:34:39', 'Chandra X-ray Observatory', 'Alimentazione Elettrica');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-03-25 22:53:30', '2024-02-02 23:31:56', 'TerraSAR-X', 'Controllo di Volo');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-05-24 12:24:29', NULL, 'Iridium 6', 'Telemetria e Telecontrollo');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2022-11-07 10:24:16', '2023-08-14 12:37:49', 'Venus Express', 'Protezione dalle Radiazioni');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-04-12 07:52:37', '2023-02-28 10:37:36', 'XMM-Newton', 'Comunicazione');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-02-10 01:22:38', NULL, 'RADARSAT-2', 'Distribuzione dell''Energia');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-06-07 11:21:37', '2023-05-01 01:35:58', 'NOAA-19', 'Telemetria e Telecontrollo');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2022-10-22 05:07:36', '2023-09-28 11:34:57', 'Spitzer Space Telescope', 'Protezione dai Detriti Spaziali');
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) VALUES ('2023-11-16 20:50:33', '2024-01-13 05:20:56', 'Tiangong-2', 'Controllo di Volo');

