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

-- Satelliti
INSERT INTO satellite (nome, dimensioni, periodo_orbitale, data_di_lancio, peso, operatore_nome, tipo_operatore_tipo)
VALUES
    ('GOES-16', 1000, '01:30:00', '2022-03-12 08:00:00', 2000, 'NASA', 'Operatore Governativo'),
    ('Hubble Space Telescope', 800, '02:15:00', '2021-11-20 12:30:00', 1500, 'NASA', 'Operatore Governativo'),
    ('ISS', 1200, '03:45:00', '2023-05-30 16:45:00', 1800, 'ESA', 'Operatore Di Ricerca'),
    ('Landsat 8', 1500, '01:30:00', '2022-08-25 09:15:00', 2500, 'NASA', 'Operatore Governativo'),
    ('GPS IIF-12', 1100, '02:45:00', '2023-09-18 14:00:00', 1900, 'NOAA', 'Operatore Di Ricerca'),
    ('Galileo 17', 900, '01:00:00', '2022-06-10 06:30:00', 1700, 'NASA', 'Operatore Governativo'),
    ('Chandra X-ray Observatory', 1300, '02:30:00', '2022-07-18 10:45:00', 2200, 'NASA', 'Operatore Di Ricerca'),
    ('TerraSAR-X', 1600, '03:15:00', '2023-01-05 13:15:00', 2700, 'ESA', 'Operatore Governativo'),
    ('Iridium 6', 1400, '02:00:00', '2022-09-10 07:30:00', 2300, 'NASA', 'Operatore Di Ricerca'),
    ('Venus Express', 1000, '01:30:00', '2022-12-10 08:00:00', 2000, 'NASA', 'Operatore Governativo'),
    ('XMM-Newton', 1200, '02:15:00', '2022-02-01 12:30:00', 1800, 'NASA', 'Operatore Governativo'),
    ('RADARSAT-2', 900, '01:00:00', '2023-04-05 06:30:00', 1500, 'NASA', 'Operatore Governativo'),
    ('NOAA-19', 1100, '02:45:00', '2023-07-25 14:00:00', 2100, 'NASA', 'Operatore Commerciale'),
    ('Spitzer Space Telescope', 1300, '02:30:00', '2022-10-15 10:45:00', 2400, 'NASA', 'Operatore Commerciale'),
    ('Tiangong-2', 1500, '03:15:00', '2023-09-02 13:15:00', 2800, 'ESA', 'Operatore Commerciale');

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

-- rilevazione
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
