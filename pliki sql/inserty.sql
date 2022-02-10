INSERT INTO projekt.Konfederacja (ID_konfederacja, Nazwa, Pelna_nazwa, Kontynent, Siedziba, Data_zalozenia) VALUES
(1, 'UEFA', 'Union of European Football Associations', 'Europa', 'Nyon', '1954-06-15'),
(2, 'CAF', 'Confédération Africaine de Football', 'Afryka', 'Madinat as-Sadis min Uktubar', '1957-02-08'),
(3, 'CONCACAF', 'The Confederation of North, Central America and Caribbean Association Football', 'Ameryka Północna', 'Nowy Jork', '1961-09-18'),
(4, 'CONMEBOL', 'Confédéración Sudaméricana de Fútbol', 'Ameryka Południowa', 'Luque', '1916-07-09'),
(5, 'AFC', 'Asian Football Confederation', 'Azja', 'Kuala Lumpur', '1954-05-08'),
(6, 'OFC', 'Oceania Football Confederation', 'Oceania', 'Auckland', '1966-01-01');

INSERT INTO projekt.Kraj (ID_kraj, ID_konfederacja, Nazwa, Nazwa_federacji, Pelna_nazwa_federacji) VALUES
(1, 1, 'Polska', 'PZPN', 'Polski Związek Piłki Nożnej'),
(2, 1, 'Słowacja', 'SFZ', 'Slovenský futbalový zväz'),
(3, 1, 'Ukraina', 'UAF', 'Українська асоціація футболу'),
(4, 1, 'Czechy', 'FAČR', 'Fotbalová asociace České republiky'),
(5, 1, 'Bośnia i Hercegowina', 'N/FSBiH', 'Nogometni/Fudbalski Savez Bosne i Hercegovine'),
(6, 1, 'Holandia', 'KNVB', 'Koninklijke Nederlandse Voetbal Bond'),
(7, 1, 'Izrael', 'IFA', 'הַהִתְאַחֲדוּת לְכַּדּוּרֶגֶל בְּיִשְׂרָאֵל'),
(8, 1, 'Serbia', 'FSS', 'Фудбалски савез Србије'),
(9, 1, 'Austria', 'ÖFB', 'Österreichischer Fußball-Bund'),
(10, 2, 'Ghana', 'GFA', 'Ghana Football Association'),
(11, 1, 'Kazachstan', 'KFF', 'Қазақстанның Футбол Федерациясы'),
(12, 1, 'Portugalia', 'FPF', 'Federação Portuguesa de Futebol'),
(13, 3, 'Kostaryka', 'FCF', 'Federación Costarricense de Fútbol'),
(14, 1, 'Gruzja', 'GFF', 'საქართველოს ფეხბურთის ფედერაცია'),
(15, 1, 'Rumunia', 'FRF', 'Federația Română de Fotbal'),
(16, 1, 'Niemcy', 'DFB', 'Deutscher Fußball-Bund'),
(17, 1, 'Dania', 'DBU', 'Dansk Boldspil-Union'),
(18, 1, 'Kosowo', 'FFK', 'Federata e Futbollit të Kosovës'),
(19, 4, 'Brazylia', 'CBF', 'Confederação Brasileira de Futebol'),
(20, 5, 'Afganistan', 'AFF', 'فدراسيون فوتبال افغانستان'),
(21, 6, 'Nowa Zelandia', 'NZF', 'New Zealand Football');

INSERT INTO projekt.Liga (ID_liga, ID_kraj, Nazwa, Poziom_rozgrywkowy) VALUES
(1, 1, 'PKO BP Ekstraklasa', 1),
(2, 1, 'Fortuna 1. Liga', 2);

INSERT INTO projekt.Sedzia (ID_sedzia, ID_kraj, ID_liga, Imie, Nazwisko, Data_urodzenia) VALUES
(1, 1, 1, 'Tomasz', 'Wajda', '1980-05-17'),
(2, 1, 2, 'Dominik', 'Sulikowski', '1977-05-21');

INSERT INTO projekt.Klub (ID_klub, ID_kraj, ID_liga, Nazwa, Miasto) VALUES
(1, 1, 2, 'Odra Opole', 'Opole'),
(2, 1, 1, 'Cracovia', 'Kraków'),
(3, 1, 1, 'Wisła Kraków', 'Kraków');

INSERT INTO projekt.Trener (ID_trener, ID_klub, ID_kraj, Imie, Nazwisko, Data_urodzenia, Licencja_trenerska) VALUES
(1, 1, 1, 'Piotr', 'Plewnia', '1977-05-29', 'UEFA A'),
(2, 2, 1, 'Jacek', 'Zieliński', '1961-03-22', 'UEFA PRO'),
(3, 3, 2, 'Adrián', 'Guľa', '1975-06-29', 'UEFA PRO');

INSERT INTO projekt.Sztab (ID_sztab, ID_klub, ID_kraj, Imie, Nazwisko, Data_urodzenia, Rola) VALUES
(1, 1, 1, 'Tomasz', 'Copik', '1979-04-05', 'Asystent trenera'),
(2, 1, 1, 'Adam', 'Kania', '1983-03-23', 'Trener bramkarzy');

INSERT INTO projekt.Stadion (ID_stadion, ID_klub, Nazwa, Pojemnosc, Miejscowosc) VALUES
(1, 1, 'Stadion Opolski', 11600, 'Opole'),
(2, 1, 'Stadion Miejski "Odra"', 4560, 'Opole'),
(3, 1, 'Centrum Sportu', 452, 'Opole'),
(4, 2, 'Stadion Cracovii im. Józefa Piłsudskiego', 15114, 'Kraków'),
(5, 2, 'Cracovia Training Center', 500, 'Rączna'),
(6, 3, 'Stadion Miejski im. Henryka Reymana', 33130, 'Kraków'),
(7, 3, 'Sport Myślenice', 0, 'Myślenice');

INSERT INTO projekt.Zawodnik (ID_zawodnik, ID_klub, ID_kraj, Imie, Nazwisko, Data_urodzenia, Wzrost, Waga, Pozycja, Numer) VALUES
(1, 1, 1, 'Dominik', 'Kalinowski', '1998-03-29', 190, 78, 'bramkarz', 12),
(2, 1, 1, 'Mateusz', 'Kuchta', '1996-02-05', 190, 86, 'bramkarz', 96),
(3, 1, 1, 'Błażej', 'Sapielak', '2003-09-27', 195, 83, 'bramkarz', 90),
(4, 1, 1, 'Mateusz', 'Kamiński', '1988-04-27', 190, 79, 'obrońca', 27),
(5, 1, 1, 'Konrad', 'Kostrzycki', '1996-10-07', 196, 87, 'obrońca', 14),
(6, 1, 1, 'Mateusz', 'Maćkowiak', '2001-05-29', 175, 69, 'obrońca', 21),
(7, 1, 2, 'Bernard', 'Petrák', '1999-12-15', 178, 77, 'obrońca', 71),
(8, 1, 1, 'Mateusz', 'Spychała', '1998-01-28', 169, 63, 'obrońca', 22),
(9, 1, 1, 'Jakub', 'Szrek', '1997-08-25', 177, 66, 'obrońca', 24),
(10, 1, 1, 'Maksymilian', 'Tkocz', '2002-01-26', 187, 79, 'obrońca', 19),
(11, 1, 1, 'Piotr', 'Żemło', '1995-07-10', 190, 85, 'obrońca', 2),
(12, 1, 3, 'Stanislav', 'Hreben', '1999-08-18', 180, 75, 'pomocnik', 8),
(13, 1, 1, 'Krzysztof', 'Janus', '1986-03-25', 176, 73, 'pomocnik', 7),
(14, 1, 1, 'Kacper', 'Kaczka', '2003-07-22', 180, 77, 'pomocnik', 16),
(15, 1, 1, 'Antoni', 'Klimek', '2002-08-04', 173, 71, 'pomocnik', 47),
(16, 1, 1, 'Mateusz', 'Marzec', '1994-08-13', 178, 70, 'pomocnik', 17),
(17, 1, 2, 'Tomáš', 'Mikinič', '1992-11-22', 172, 72, 'pomocnik', 9),
(18, 1, 1, 'Rafał', 'Niziołek', '1989-03-19', 178, 68, 'pomocnik', 5),
(19, 1, 1, 'Konrad', 'Nowak', '1994-11-07', 175, 69, 'pomocnik', 94),
(20, 1, 1, 'Michał', 'Pawlik', '1995-05-08', 185, 79, 'pomocnik', 6),
(21, 1, 1, 'Cezary', 'Sauczek', '1998-11-11', 182, 75, 'pomocnik', 77),
(22, 1, 1, 'Miłosz', 'Trojak', '1994-05-05', 191, 81, 'pomocnik', 66),
(23, 1, 1, 'Maciej', 'Wróbel', '2003-05-05', 179, 71, 'pomocnik', 32),
(24, 1, 1, 'Dawid', 'Czapliński', '1992-07-20', 186, 80, 'napastnik', 11),
(25, 1, 1, 'Arkadiusz', 'Piech', '1985-06-07', 171, 72, 'napastnik', 28),
(26, 1, 1, 'Kacper', 'Stępień', '2001-07-24', 184, 73, 'napastnik', 99),
(27, 1, 1, 'Adam', 'Żak', '1994-12-23', 184, 80, 'napastnik', 20),

(28, 3, 1, 'Mikołaj', 'Biegański', '2002-04-05', 190, 84, 'bramkarz', 31),
(29, 3, 1, 'Michał', 'Buchalik', '1989-02-03', 190, 83, 'bramkarz', 22),
(30, 3, 1, 'Miłosz', 'Jaskuła', '2003-12-23', 193, 82, 'bramkarz', 51),
(31, 3, 1, 'Paweł', 'Kieszek', '1984-04-16', 187, 82, 'bramkarz', 1),
(32, 3, 1, 'Kacper', 'Rosa', '1994-08-13', 191, 88, 'bramkarz', 99),
(33, 3, 4, 'Michal', 'Frydrych', '1990-02-27', 187, 80, 'obrońca', 25),
(34, 3, 1, 'Kamil', 'Głogowski', '2004-07-22', 184, 76, 'obrońca', 56),
(35, 3, 1, 'Konrad', 'Gruszkowski', '2001-01-27', 183, 74, 'obrońca', 20),
(36, 3, 4, 'Matěj', 'Hanousek', '1993-06-02', 182, 74, 'obrońca', 15),
(37, 3, 1, 'Paweł', 'Koncewicz-Żyłka', '2003-10-29', 191, 82, 'obrońca', 32),
(38, 3, 5, 'Adi', 'Mehremić', '1992-04-26', 189, 85, 'obrońca', 3),
(39, 3, 1, 'Maciej', 'Sadlok', '1989-06-29', 186, 80, 'obrońca', 4),
(40, 3, 1, 'Dawid', 'Szot', '2001-04-29', 183, 75, 'obrońca', 43),
(41, 3, 1, 'Serafin', 'Szota', '1999-03-04', 186, 80, 'obrońca', 17),
(42, 3, 1, 'Alan', 'Uryga', '1994-02-19', 191, 85, 'obrońca', 6),
(43, 3, 1, 'Krystian', 'Wachowiak', '2001-10-19', 175, 67, 'obrońca', 2),
(44, 3, 1, 'Jakub', 'Błaszczykowski', '1985-12-14', 175, 67, 'pomocnik', 16),
(45, 3, 6, 'Aschraf', 'El Mahdioui', '1996-05-24', 182, 71, 'pomocnik', 8),
(46, 3, 1, 'Dorian', 'Gądek', '2004-01-02', 183, 67, 'pomocnik', 35),
(47, 3, 7, 'Dor', 'Hugi', '1995-07-10', 180, 78, 'pomocnik', 7),
(48, 3, 8, 'Nikola', 'Kuveljić', '1997-04-06', 194, 85, 'pomocnik', 21),
(49, 3, 1, 'Mateusz', 'Młyński', '2001-01-02', 178, 67, 'pomocnik', 11),
(50, 3, 1, 'Patryk', 'Plewka', '2000-01-02', 174, 70, 'pomocnik', 80),
(51, 3, 9, 'Stefan', 'Savić', '1994-01-09', 169, 72, 'pomocnik', 77),
(52, 3, 2, 'Michal', 'Škvarka', '1992-08-19', 173, 66, 'pomocnik', 92),
(53, 3, 1, 'Piotr', 'Starzyński', '2004-01-22', 173, 67, 'pomocnik', 54),
(54, 3, 10, 'Yaw', 'Yeboah', '1997-03-28', 175, 70, 'pomocnik', 40),
(55, 3, 11, 'Gieorgij', 'Żukow', '1994-11-19', 172, 70, 'pomocnik', 10),
(56, 3, 13, 'Felicio', 'Brown Forbes', '1991-08-28', 188, 82, 'napastnik', 91),
(57, 3, 4, 'Jan', 'Kliment', '1993-09-01', 185, 76, 'napastnik', 9),
(58, 3, 1, 'Hubert', 'Sobol', '2000-06-25', 183, 80, 'napastnik', 19),
(59, 3, 1, 'Przemysław', 'Zdybowicz', '2000-01-10', 185, 70, 'napastnik', 59),

(60, 2, 2, 'Lukáš', 'Hroššo', '1987-04-19', 195, 90, 'bramkarz', 31),
(61, 2, 1, 'Filip', 'Kramarz', '2004-06-22', 188, 78, 'bramkarz', 40),
(62, 2, 1, 'Norbert', 'Łuczak', '2003-08-11', 190, 80, 'bramkarz', 40),
(63, 2, 1, 'Karol', 'Niemczycki', '1999-07-05', 190, 84, 'bramkarz', 23),
(64, 2, 1, 'Adam', 'Wilk', '1997-11-21', 196, 87, 'bramkarz', 30),
(65, 2, 1, 'Krystian', 'Bracik', '2001-03-18', 184, 76, 'obrońca', 14),
(66, 2, 1, 'Jakub', 'Góralczyk', '2002-09-14', 188, 85, 'obrońca', 81),
(67, 2, 1, 'Oliwier', 'Hyla', '2004-08-24', 184, 68, 'obrońca', 27),
(68, 2, 4, 'Jakub', 'Jugas', '1992-05-05', 186, 79, 'obrońca', 24),
(69, 2, 14, 'Otar', 'Kakabadze', '1995-06-27', 186, 79, 'obrońca', 25),
(70, 2, 12, 'Luís', 'Rocha', '1993-06-27', 174, 70, 'obrońca', 18),
(71, 2, 1, 'Kamil', 'Pestka', '1998-08-22', 187, 76, 'obrońca', 33),
(72, 2, 1, 'Mateusz', 'Pieńczak', '2003-01-09', 189, 74, 'obrońca', 15),
(73, 2, 15, 'Cornel', 'Râpă', '1990-01-16', 180, 72, 'obrońca', 2),
(74, 2, 5, 'Matej', 'Rodin', '1996-02-13', 193, 80, 'obrońca', 88),
(75, 2, 2, 'Michal', 'Sipľak', '1996-02-02', 184, 80, 'obrońca', 3),
(76, 2, 1, 'Oskar', 'Wójcik', '2003-07-21', 188, 75, 'obrońca', 71),
(77, 2, 1, 'Jan', 'Ziewiec', '2004-05-13', 186, 79, 'obrońca', 29),
(78, 2, 16, 'Marcos', 'Álvarez', '1991-09-30', 179, 77, 'pomocnik', 9),
(79, 2, 15, 'Sergiu', 'Hanca', '1992-04-04', 182, 80, 'pomocnik', 4),
(80, 2, 17, 'Mathias', 'Hebo Rasmussen', '1995-08-02', 190, 75, 'pomocnik', 8),
(81, 2, 1, 'Radosław', 'Kanach', '1999-04-03', 181, 73, 'pomocnik', 13),
(82, 2, 1, 'Karol', 'Knap', '2001-09-12', 180, 71, 'pomocnik', 20),
(83, 2, 18, 'Florian', 'Loshaj', '1996-08-13', 174, 71, 'pomocnik', 22),
(84, 2, 1, 'Sylwester', 'Lusiusz', '1999-09-18', 185, 80, 'pomocnik', 6),
(85, 2, 1, 'Maciej', 'Mrozik', '2005-05-05', 173, 60, 'pomocnik', 35),
(86, 2, 1, 'Jakub', 'Myszor', '2002-06-07', 175, 66, 'pomocnik', 38),
(87, 2, 1, 'Kamil', 'Ogorzały', '2000-09-05', 178, 70, 'pomocnik', 17),
(88, 2, 1, 'Robert', 'Ożóg', '2000-01-08', 175, 63, 'pomocnik', 61),
(89, 2, 1, 'Michał', 'Rakoczy', '2002-03-30', 175, 71, 'pomocnik', 11),
(90, 2, 5, 'Damir', 'Sadiković', '1995-04-07', 188, 84, 'pomocnik', 19),
(91, 2, 19, 'Thiago', 'Rodrigues', '1997-03-18', 177, 60, 'pomocnik', 21),
(92, 2, 6, 'Pelle', 'van Amersfoort', '1996-04-01', 193, 77, 'pomocnik', 10),
(93, 2, 1, 'Michał', 'Wiśniewski', '1999-05-02', 181, 75, 'pomocnik', 64),
(94, 2, 1, 'Patryk', 'Zaucha', '2000-04-19', 175, 67, 'pomocnik', 73),
(95, 2, 2, 'Filip', 'Balaj', '1997-08-02', 192, 81, 'napastnik', 45),
(96, 2, 1, 'Przemysław', 'Kapek', '2003-05-07', 177, 68, 'napastnik', 16),
(97, 2, 1, 'Filip', 'Piszczek', '1995-05-26', 190, 85, 'napastnik', 26),
(98, 2, 19, 'Rivaldo', 'Rivaldinho', '1995-04-29', 186, 85, 'napastnik', 7);

CREATE SEQUENCE kraj_id_seq
    start 22
    increment 1;

CREATE SEQUENCE liga_id_seq
    start 3
    increment 1;

CREATE SEQUENCE sedzia_id_seq
    start 3
    increment 1;

CREATE SEQUENCE klub_id_seq
    start 4
    increment 1;

CREATE SEQUENCE zawodnik_id_seq
    start 99
    increment 1;

CREATE SEQUENCE trener_id_seq
    start 4
    increment 1;

CREATE SEQUENCE sztab_id_seq
    start 3
    increment 1;

CREATE SEQUENCE stadion_id_seq
    start 8
    increment 1;
