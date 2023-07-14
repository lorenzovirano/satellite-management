-- Tipo operatore
INSERT INTO tipo_operatore (tipo) 
VALUES 
    ("Operatore Governativo"),
    ("Operatore Commerciale"),
    ("Operatore Di Ricerca");

-- Operatore
INSERT INTO operatore (nome, nazionalita, data_di_fondazione, tipo_operatore_tipo) 
VALUES 
    ("SpaceX", "USA", "2002-03-14", "Operatore Commerciale"),
    ("Boeing", "USA", "1916-07-15", "Operatore Commerciale"),
    ("MIT", "USA", "1861-04-10", "Operatore Di Ricerca"),
    ("Japan Aerospace Exploration Agency", "Giappone", "2003-10-01", "Operatore Governativo"),
    ("United Launch Alliance", "USA", "2006-12-01", "Operatore Commerciale"),
    ("Arianespace", "Francia", "1980-03-26", "Operatore Commerciale"),
    ("Roscosmos", "Russia", "1992-01-01", "Operatore Governativo"),
    ("China National Space Administration", "Cina", "1993-04-22", "Operatore Governativo"),
    ("Standford University", "USA", "1885-10-01", "Operatore Di Ricerca"),
    ("Blue Origin", "USA", "2000-09-08", "Operatore Commerciale"),
    ("Airbus Defence and Space", "Francia", "2000-07-01", "Operatore Commerciale"),
    ("European Space Agency", "Organizzazione internazionale con membri europei", "1975-05-30", "Operatore Governativo"),
    ("Rocket Lab", "Nuova Zelanda", "2006-03-01", "Operatore Commerciale"),
    ("National Aeronautics and Space Administration", "USA", "1958-07-29", "Operatore Governativo"),
    ("Politecnico di Torino", "Italia", "1859-11-09", "Operatore Di Ricerca");

-- Satelliti
INSERT INTO satellite (nome, dimensioni, periodo_orbitale, data_di_lancio, peso, operatore_nome, tipo_operatore_tipo)
VALUES
    ('GOES-16', 100, '01:30:00', '2022-03-12 08:00:00', 2000, 'SpaceX', 'Operatore Commerciale'),
    ('Hubble Space Telescope', 80, '02:15:00', '2021-11-20 12:30:00', 1500, 'Boeing', 'Operatore Commerciale'),
    ('ISS', 100, '03:45:00', '2022-05-30 16:45:00', 1800, 'MIT', 'Operatore Di Ricerca'),
    ('Landsat 8', 100, '01:30:00', '2022-08-25 09:15:00', 2500, 'Japan Aerospace Exploration Agency', 'Operatore Governativo'),
    ('GPS IIF-12', 100, '02:45:00', '2022-09-18 14:00:00', 1900, 'United Launch Alliance', 'Operatore Commerciale'),
    ('Galileo 17', 90, '01:00:00', '2022-06-10 06:30:00', 1700, 'Arianespace', 'Operatore Commerciale'),
    ('Chandra X-ray Observatory', 102, '02:30:00', '2022-07-18 10:45:00', 2200, 'Roscosmos', 'Operatore Governativo'),
    ('TerraSAR-X', 16, '03:15:00', '2023-01-05 13:15:00', 2700, 'China National Space Administration', 'Operatore Governativo'),
    ('Iridium 6', 14, '02:00:00', '2022-09-10 07:30:00', 2300, 'Standford University', 'Operatore Di Ricerca'),
    ('Venus Express', 109, '01:30:00', '2022-12-10 08:00:00', 2000, 'Blue Origin', 'Operatore Commerciale'),
    ('XMM-Newton', 102, '02:15:00', '2022-02-01 12:30:00', 1800, 'Airbus Defence and Space', 'Operatore Commerciale'),
    ('RADARSAT-2', 90, '01:00:00', '2023-04-05 06:30:00', 1500, 'European Space Agency', 'Operatore Governativo'),
    ('NOAA-19', 11, '02:45:00', '2022-07-14 14:00:00', 2100, 'Rocket Lab', 'Operatore Commerciale'),
    ('Spitzer Space Telescope', 13, '02:30:00', '2022-10-15 10:45:00', 2400, 'National Aeronautics and Space Administration', 'Operatore Governativo'),
    ('Tiangong-2', 15, '03:15:00', '2022-09-02 13:15:00', 2800, 'Politecnico di Torino', 'Operatore Di Ricerca');

-- Stazioni terrestri
INSERT INTO stazione_terrestre (nome, longitudine, latitudine, tipo_operatore_tipo, operatore_nome)
VALUES
    ('Goldstone Deep Space Communications Complex', -116.895, 35.400, 'Operatore Commerciale', 'SpaceX'),
    ('European Space Operations Centre', 8.422, 50.000, 'Operatore Commerciale', 'Boeing'),
    ('Guiana Space Centre', -52.768, 5.236, 'Operatore Di Ricerca', 'MIT'),
    ('John F. Kennedy Space Center', -80.605, 28.392, 'Operatore Governativo', 'Japan Aerospace Exploration Agency'),
    ('Baikonur Cosmodrome', 63.344, 45.965, 'Operatore Commerciale', 'United Launch Alliance'),
    ('Tianhe Space Station', 110.467, 40.958, 'Operatore Commerciale', 'Arianespace'),
    ('Wallops Flight Facility', -75.483, 37.940, 'Operatore Governativo', 'Roscosmos'),
    ('Jiuquan Satellite Launch Center', 100.286, 40.958, 'Operatore Governativo', 'China National Space Administration'),
    ('Tanegashima Space Center', 130.987, 30.378, 'Operatore Di Ricerca', 'Standford University'),
    ('Satish Dhawan Space Centre', 80.234, 13.733, 'Operatore Commerciale', 'Blue Origin'),
    ('Vandenberg Space Force Base', -120.600, 34.756, 'Operatore Commerciale', 'Airbus Defence and Space'),
    ('Taiyuan Satellite Launch Center', 112.550, 38.848, 'Operatore Governativo', 'European Space Agency'),
    ('Kourou Spaceport', -52.768, 5.236, 'Operatore Commerciale', 'Rocket Lab'),
    ('Xichang Satellite Launch Center', 102.034, 28.246, 'Operatore Governativo', 'National Aeronautics and Space Administration'),
    ('Alcântara Launch Center', -44.396, -2.370, 'Operatore Di Ricerca', 'Politecnico di Torino');

-- Crew
INSERT INTO crew (nome, data_di_creazione, numero_membri, stazione_terrestre_nome)
VALUES
    ('Apollo 11', '1969-07-20', 10, 'Goldstone Deep Space Communications Complex'),
    ('Discovery 7', '1991-11-26', 12, 'European Space Operations Centre'),
    ('Expedition 1', '2000-11-02', 10, 'Guiana Space Centre'),
    ('Endeavour 5', '2002-07-26', 14, 'John F. Kennedy Space Center'),
    ('Soyuz 7', '2010-06-16', 9, 'Baikonur Cosmodrome'),
    ('Shenzhou 9', '2012-06-18', 10, 'Tianhe Space Station'),
    ('Galaxy 4', '1989-06-15', 11, 'Wallops Flight Facility'),
    ('Chang Zheng 4', '2002-12-29', 13, 'Jiuquan Satellite Launch Center'),
    ('Hayabusa 2', '2014-12-03', 12, 'Tanegashima Space Center'),
    ('Mars Orbiter Mission', '2013-11-05', 11, 'Satish Dhawan Space Centre'),
    ('Falcon 9', '2010-06-04', 9, 'Vandenberg Space Force Base'),
    ('Long March 7', '2016-06-25', 11, 'Taiyuan Satellite Launch Center'),
    ('Vostok 1', '1961-04-12', 7, 'Kourou Spaceport'),
    ('Tiangong 2', '2016-09-15', 10, 'Xichang Satellite Launch Center'),
    ('Amazonia-1', '2021-02-28', 8, 'Alcântara Launch Center');

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
    ('Apollo 11', '1969-07-20 08:00:00', '1969-07-24 16:00:00', 'Esplorazione', 'Apollo 11', 'GOES-16'),
    ('Discovery 7', '1991-11-26 12:00:00', '1991-11-30 18:00:00', 'Ricerca scientifica', 'Discovery 7', 'Hubble Space Telescope'),
    ('Expedition 1', '2000-11-02 10:00:00', '2000-11-06 16:00:00', 'Telecomunicazioni', 'Expedition 1', 'ISS'),
    ('Endeavour 5', '2002-07-26 14:00:00', '2002-07-30 20:00:00', 'Osservazione terrestre', 'Endeavour 5', 'Landsat 8'),
    ('Soyuz 7', '2010-06-16 09:00:00', '2010-06-20 15:00:00', 'Meteorologia', 'Soyuz 7', 'GPS IIF-12'),
    ('Shenzhou 9', '2012-06-18 11:00:00', '2012-06-22 17:00:00', 'Navigazione', 'Shenzhou 9', 'Galileo 17'),
    ('Galaxy 4', '1989-06-15 07:00:00', '1989-06-19 13:00:00', 'Rifornimento spaziale', 'Galaxy 4', 'Chandra X-ray Observatory'),
    ('Chang Zheng 4', '2002-12-29 13:00:00', '2003-01-02 19:00:00', 'Test tecnologici', 'Chang Zheng 4', 'TerraSAR-X'),
    ('Hayabusa 2', '2014-12-03 15:00:00', '2014-12-07 21:00:00', 'Mappatura', 'Hayabusa 2', 'Iridium 6'),
    ('Mars Orbiter Mission', '2013-11-05 11:00:00', '2013-11-09 17:00:00', 'Studio dell''atmosfera', 'Mars Orbiter Mission', 'Venus Express'),
    ('Falcon 9', '2010-06-04 09:00:00', '2010-06-08 15:00:00', 'Studio dell''ambiente spaziale', 'Falcon 9', 'XMM-Newton'),
    ('Long March 7', '2016-06-25 13:00:00', '2016-06-29 19:00:00', 'Studio del clima', 'Long March 7', 'RADARSAT-2'),
    ('Vostok 1', '1961-04-12 06:00:00', '1961-04-16 12:00:00', 'Studio delle risorse naturali', 'Vostok 1', 'NOAA-19'),
    ('Tiangong 2', '2016-09-15 10:00:00', '2016-09-19 16:00:00', 'Missioni umane', 'Tiangong 2', 'Spitzer Space Telescope'),
    ('Amazonia-1', '2021-02-28 08:00:00', '2021-03-04 14:00:00', 'Missioni robotiche', 'Amazonia-1', 'Tiangong-2');

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
INSERT INTO rilevazione (valore, data, coordinate_orbitali_altitudine, coordinate_orbitali_inclinazione, coordinate_orbitali_eccentricità, strumento_di_bordo_nome)
VALUES
    (150, '2012-05-10 08:00:00', 800, 30, 0.2, 'Radar Altimeter'),
    (220, '2002-06-12 09:30:00', 1500, 75, 0.8, 'Multispectral Imager'),
    (180, '2021-07-14 11:15:00', 1200, 60, 0.6, 'Thermal Infrared Sensor'),
    (300, '2022-08-16 13:45:00', 2800, 165, 2.0, 'Synthetic Aperture Radar'),
    (250, '2007-09-18 15:30:00', 1800, 90, 1.0, 'Global Navigation Satellite System'),
    (170, '2023-01-20 17:00:00', 1000, 45, 0.4, 'Scatterometer'),
    (190, '2020-02-22 18:45:00', 3400, 210, 2.6, 'Radiometer'),
    (260, '2023-03-24 20:15:00', 2200, 120, 1.4, 'Spectrometer'),
    (240, '2023-05-26 22:00:00', 2600, 150, 1.8, 'Lidar'),
    (280, '2003-07-28 23:30:00', 2000, 105, 1.2, 'Hyperspectral Imager'),
    (210, '2023-09-30 01:15:00', 3000, 180, 2.2, 'Magnetometer'),
    (270, '1997-11-01 02:45:00', 3200, 195, 2.4, 'X-ray Spectrometer'),
    (230, '2023-12-03 04:30:00', 2400, 135, 1.6, 'Visible and Infrared Imaging Spectrometer'),
    (200, '2004-02-04 06:00:00', 3600, 225, 2.8, 'Cloud Profiling Radar'),
    (290, '2006-03-07 07:45:00', 3800, 240, 3.0, 'Microwave Radiometer');

-- Tipo guasto
INSERT INTO tipo_guasto (tipo) 
VALUES 
    ("Alimentazione Elettrica"),
    ("Propulsione"),
    ("Comunicazione"),
    ("Controllo dell'Assetto"),
    ("Navigazione"),
    ("Termico"),
    ("Carico Utile"),
    ("Raccolta Dati"),
    ("Telemetria e Telecontrollo"),
    ("Protezione dalle Radiazioni"),
    ("Apertura/Chiusura Pannelli Solari"),
    ("Distribuzione dell'Energia"),
    ("Navigazione Stellare"),
    ("Protezione dai Detriti Spaziali"),
    ("Controllo di Volo");

-- Guasto
INSERT INTO guasto (data_guasto, data_riparazione, satellite_nome, tipo_guasto_tipo) 
VALUES 
    ("2023-12-01 01:46:11", "2024-01-08 03:56:32", "GOES-16", "Alimentazione Elettrica"),
    ("2022-12-31 03:16:51", NULL, "Hubble Space Telescope", "Propulsione"),
    ("2022-03-30 18:11:34", "2023-07-18 03:39:01", "ISS", "Comunicazione"),
    ("2023-06-08 19:15:57", "2023-08-23 18:24:54", "Landsat 8", "Controllo dell'Assetto"),
    ("2023-06-10 01:41:30", "2023-09-29 19:39:17", "GPS IIF-12", "Navigazione"),
    ("2023-09-27 12:21:19", "2023-10-31 01:54:50", "Galileo 17", "Termico"),
    ("2023-05-11 23:18:36", "2023-12-19 12:34:39", "Chandra X-ray Observatory", "Alimentazione Elettrica"),
    ("2023-03-25 22:53:30", "2024-02-02 23:31:56", "TerraSAR-X", "Controllo di Volo"),
    ("2023-05-24 12:24:29", NULL, "Iridium 6", "Telemetria e Telecontrollo"),
    ("2022-11-07 10:24:16", "2023-08-14 12:37:49", "Venus Express", "Protezione dalle Radiazioni"),
    ("2023-04-12 07:52:37", "2023-02-28 10:37:36", "XMM-Newton", "Comunicazione"),
    ("2023-02-10 01:22:38", NULL, "RADARSAT-2", "Distribuzione dell'Energia"),
    ("2023-06-07 11:21:37", "2023-05-01 01:35:58", "NOAA-19", "Telemetria e Telecontrollo"),
    ("2022-10-22 05:07:36", "2023-09-28 11:34:57", "Spitzer Space Telescope", "Protezione dai Detriti Spaziali"),
    ("2023-11-16 20:50:33", "2024-01-13 05:20:56", "Tiangong-2", "Controllo di Volo");

-- Strumento di bordo satellite
INSERT INTO strumento_di_bordo_satellite (satellite_nome, strumento_di_bordo_nome)
VALUES
    ('GOES-16', 'Radar Altimeter'),
    ('Hubble Space Telescope', 'Multispectral Imager'),
    ('ISS', 'Thermal Infrared Sensor'),
    ('Landsat 8', 'Synthetic Aperture Radar'),
    ('GPS IIF-12', 'Global Navigation Satellite System'),
    ('Galileo 17', 'Scatterometer'),
    ('Chandra X-ray Observatory', 'Radiometer'),
    ('TerraSAR-X', 'Spectrometer'),
    ('Iridium 6', 'Lidar'),
    ('Venus Express', 'Hyperspectral Imager'),
    ('XMM-Newton', 'Magnetometer'),
    ('RADARSAT-2', 'X-ray Spectrometer'),
    ('NOAA-19', 'Visible and Infrared Imaging Spectrometer'),
    ('Spitzer Space Telescope', 'Cloud Profiling Radar'),
    ('Tiangong-2', 'Microwave Radiometer');

-- Rilevazione_satellite
INSERT INTO rilevazione_satellite (satellite_nome, strumento_di_bordo_nome, rilevazione_data)
VALUES
    ('GOES-16', 'Radar Altimeter', '2012-05-10 08:00:00'),
    ('Hubble Space Telescope', 'Multispectral Imager', '2002-06-12 09:30:00'),
    ('ISS', 'Thermal Infrared Sensor', '2021-07-14 11:15:00'),
    ('Landsat 8', 'Synthetic Aperture Radar', '2022-08-16 13:45:00'),
    ('GPS IIF-12', 'Global Navigation Satellite System', '2007-09-18 15:30:00'),
    ('Galileo 17', 'Scatterometer', '2023-01-20 17:00:00'),
    ('Chandra X-ray Observatory', 'Radiometer', '2020-02-22 18:45:00'),
    ('TerraSAR-X', 'Spectrometer', '2023-03-24 20:15:00'),
    ('Iridium 6', 'Lidar', '2023-05-26 22:00:00'),
    ('Venus Express', 'Hyperspectral Imager', '2003-07-28 23:30:00'),
    ('XMM-Newton', 'Magnetometer', '2023-09-30 01:15:00'),
    ('RADARSAT-2', 'X-ray Spectrometer', '1997-11-01 02:45:00'),
    ('NOAA-19', 'Visible and Infrared Imaging Spectrometer', '2023-12-03 04:30:00'),
    ('Spitzer Space Telescope', 'Cloud Profiling Radar', '2004-02-04 06:00:00'),
    ('Tiangong-2', 'Microwave Radiometer', '2006-03-07 07:45:00');


