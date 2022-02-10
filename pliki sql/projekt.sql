
CREATE TABLE projekt.Konfederacja (
                ID_konfederacja INTEGER NOT NULL,
                Nazwa VARCHAR(10) NOT NULL,
                Pelna_nazwa CHAR(80) NOT NULL,
                Kontynent VARCHAR(20) NOT NULL,
                Siedziba VARCHAR(30) NOT NULL,
                Data_zalozenia DATE NOT NULL,
                CONSTRAINT id_konfederacja PRIMARY KEY (ID_konfederacja)
);


CREATE TABLE projekt.Kraj (
                ID_kraj INTEGER NOT NULL,
                ID_konfederacja INTEGER NOT NULL,
                Nazwa VARCHAR(30) NOT NULL,
                Nazwa_federacji VARCHAR(20) NOT NULL,
                Pelna_nazwa_federacji VARCHAR(60) NOT NULL,
                CONSTRAINT id_kraj PRIMARY KEY (ID_kraj)
);


CREATE TABLE projekt.Liga (
                ID_liga INTEGER NOT NULL,
                ID_kraj INTEGER NOT NULL,
                Nazwa VARCHAR(40) NOT NULL,
                Poziom_rozgrywkowy INTEGER NOT NULL,
                CONSTRAINT id_liga PRIMARY KEY (ID_liga)
);


CREATE TABLE projekt.Sedzia (
                ID_sedzia INTEGER NOT NULL,
                ID_kraj INTEGER NOT NULL,
                ID_liga INTEGER NOT NULL,
                Imie VARCHAR(20) NOT NULL,
                Nazwisko VARCHAR(40) NOT NULL,
                Data_urodzenia DATE NOT NULL,
                CONSTRAINT id_sedzia PRIMARY KEY (ID_sedzia)
);


CREATE TABLE projekt.Klub (
                ID_klub INTEGER NOT NULL,
                ID_kraj INTEGER NOT NULL,
                ID_liga INTEGER NOT NULL,
                Nazwa VARCHAR(70) NOT NULL,
                Miasto VARCHAR(40) NOT NULL,
                CONSTRAINT id_klub PRIMARY KEY (ID_klub)
);


CREATE TABLE projekt.Trener (
                ID_trener INTEGER NOT NULL,
                ID_klub INTEGER NOT NULL,
                ID_kraj INTEGER NOT NULL,
                Imie VARCHAR(20) NOT NULL,
                Nazwisko VARCHAR(40) NOT NULL,
                Data_urodzenia DATE NOT NULL,
                Licencja_trenerska VARCHAR(20) NOT NULL,
                CONSTRAINT id_trener PRIMARY KEY (ID_trener)
);


CREATE TABLE projekt.Sztab (
                ID_sztab INTEGER NOT NULL,
                ID_klub INTEGER NOT NULL,
                ID_kraj INTEGER NOT NULL,
                Imie VARCHAR(20) NOT NULL,
                Nazwisko VARCHAR(40) NOT NULL,
                Data_urodzenia DATE NOT NULL,
                Rola VARCHAR(30) NOT NULL,
                CONSTRAINT id_sztab PRIMARY KEY (ID_sztab)
);


CREATE TABLE projekt.Stadion (
                ID_stadion INTEGER NOT NULL,
                ID_klub INTEGER NOT NULL,
                Nazwa VARCHAR(70) NOT NULL,
                Pojemnosc INTEGER NOT NULL,
                Miejscowosc VARCHAR(40) NOT NULL,
                CONSTRAINT id_stadion PRIMARY KEY (ID_stadion)
);


CREATE TABLE projekt.Zawodnik (
                ID_zawodnik INTEGER NOT NULL,
                ID_klub INTEGER NOT NULL,
                ID_kraj INTEGER NOT NULL,
                Imie VARCHAR(20) NOT NULL,
                Nazwisko VARCHAR(40) NOT NULL,
                Data_urodzenia DATE NOT NULL,
                Wzrost INTEGER NOT NULL,
                Waga INTEGER NOT NULL,
                Pozycja VARCHAR(20) NOT NULL,
                Numer INTEGER NOT NULL,
                CONSTRAINT id_zawodnik PRIMARY KEY (ID_zawodnik)
);


ALTER TABLE projekt.Kraj ADD CONSTRAINT konfederacja_kraj_fk
FOREIGN KEY (ID_konfederacja)
REFERENCES projekt.Konfederacja (ID_konfederacja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Liga ADD CONSTRAINT kraj_liga_fk
FOREIGN KEY (ID_kraj)
REFERENCES projekt.Kraj (ID_kraj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Sedzia ADD CONSTRAINT kraj_sedzia_fk
FOREIGN KEY (ID_kraj)
REFERENCES projekt.Kraj (ID_kraj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Klub ADD CONSTRAINT kraj_klub_fk
FOREIGN KEY (ID_kraj)
REFERENCES projekt.Kraj (ID_kraj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Trener ADD CONSTRAINT kraj_trener_fk
FOREIGN KEY (ID_kraj)
REFERENCES projekt.Kraj (ID_kraj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Sztab ADD CONSTRAINT kraj_sztab_fk
FOREIGN KEY (ID_kraj)
REFERENCES projekt.Kraj (ID_kraj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Zawodnik ADD CONSTRAINT kraj_zawodnik_fk
FOREIGN KEY (ID_kraj)
REFERENCES projekt.Kraj (ID_kraj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Klub ADD CONSTRAINT liga_klub_fk
FOREIGN KEY (ID_liga)
REFERENCES projekt.Liga (ID_liga)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Sedzia ADD CONSTRAINT liga_sedzia_fk
FOREIGN KEY (ID_liga)
REFERENCES projekt.Liga (ID_liga)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Zawodnik ADD CONSTRAINT klub_zawodnik_fk
FOREIGN KEY (ID_klub)
REFERENCES projekt.Klub (ID_klub)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Stadion ADD CONSTRAINT klub_stadion_fk
FOREIGN KEY (ID_klub)
REFERENCES projekt.Klub (ID_klub)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Sztab ADD CONSTRAINT klub_sztab_fk
FOREIGN KEY (ID_klub)
REFERENCES projekt.Klub (ID_klub)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projekt.Trener ADD CONSTRAINT klub_trener_fk
FOREIGN KEY (ID_klub)
REFERENCES projekt.Klub (ID_klub)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
