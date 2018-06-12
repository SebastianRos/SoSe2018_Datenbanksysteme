CREATE TABLE tab_person
(
	SozialversicherungsNr NUMERIC(20),
	Vorname VARCHAR(50),
	Nachname VARCHAR(50),
	Geschlecht CHAR(1),
	TelfonNr NUMERIC(20),
	EMail VARCHAR(50)
);

CREATE TABLE tab_kunde
(
	KundenNr NUMERIC(5),
	SozialversicherungsNr NUMERIC(20),
	Bemerkung VARCHAR(500)
);

CREATE TABLE tab_lizenzgeber
(
	SozialversicherungsNr NUMERIC(20),
	Unternehmen VARCHAR(30)
);

CREATE TABLE tab_leiht
(
	ProduktNr NUMERIC(6),
	KundenNr NUMERIC(5),
	Datum VARCHAR(14)
);

CREATE TABLE tab_exemplar
(
	Titel VARCHAR(40),
	Auflage NUMERIC(2)
);

CREATE TABLE tab_video
(
	VideoNr NUMERIC(4),
	Untenehmen VARCHAR(30),
	Titel VARCHAR(40),
	Laufzeit NUMERIC(3),
	Schauspieler VARCHAR(50),
	Regisseur VARCHAR(50)
);

CREATE TABLE tab_hat_genre
(
	Bezeichnung VARCHAR(30),
	VideoNr NUMERIC(4)
);

CREATE TABLE tab_genre
(
	Bezeichnung VARCHAR(30)	
);

CREATE TABLE tab_mitarbeiter
(
    MitarbeiterID NUMERIC(5),
    SozialversicherungsNr NUMERIC(20),
    Stelle VARCHAR(20),
    Gehalt NUMERIC(7,2)
);

CREATE TABLE tab_anschrift
(
    Nr NUMERIC(5),
    PLZ VARCHAR(5),
    Straße VARCHAR(50),
    Hausnummer VARCHAR(4)
);

CREATE TABLE tab_plz_ort
(
    PLZ VARCHAR(5),
    Ort VARCHAR(30)
);

CREATE TABLE tab_anschrift_von_person
(
    SozialversicherungsNr NUMERIC(5),
    Nr NUMERIC(5)
);

CREATE TABLE tab_anschrift_von_filiale
(
    Nr NUMERIC(5),
    Name VARCHAR(50)
);

CREATE TABLE tab_filiale
(
    Name VARCHAR(50),
    Kapazität NUMERIC(5)
);

CREATE TABLE tab_arbeitet_in
(
    Name VARCHAR(50),
    MitarbeiterID NUMERIC(5)
);

CREATE TABLE tab_hat_exemplar
(
    Name VARCHAR(50),
    ProduktNr NUMERIC(6)
);

ALTER TABLE tab_person
	ADD CONSTRAINT pk_tab_person
	PRIMARY KEY (SozialversicherungsNr)
;

ALTER TABLE tab_kunde
	ADD CONSTRAINT pk_tab_kunde
	PRIMARY KEY (KundenNr)
;

ALTER TABLE tab_lizenzgeber
	ADD CONSTRAINT pk_tab_lizenzgeber
	PRIMARY KEY (Unternehmen)
;

ALTER TABLE tab_leiht
	ADD CONSTRAINT pk_tab_leiht
	PRIMARY KEY (ProduktNr, KundenNr, Datum)
;

ALTER TABLE tab_exemplar
	ADD CONSTRAINT pk_tab_exemplar
	PRIMARY KEY (ProduktNr)
;

ALTER TABLE tab_video
	ADD CONSTRAINT pk_tab_video
	PRIMARY KEY (VideoNr)
;

ALTER TABLE tab_hat_genre
	ADD CONSTRAINT pk_tab_hat_genre
	PRIMARY KEY (VideoNr)
;
ALTER TABLE tab_genre
	ADD CONSTRAINT pk_tab_genre
	PRIMARY KEY (Bezeichnung)
;