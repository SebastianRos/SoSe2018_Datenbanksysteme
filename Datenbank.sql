spool ueb5_concept.log 
set echo on
set linesize 80
set pagesite 50

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
    ProduktNr NUMERIC(6),
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

ALTER TABLE tab_anschrift_von_person
ADD CONSTRAINT pk_anschrift_von_person
PRIMARY KEY (SozialversicherungsNr, Nr)
;

ALTER TABLE tab_mitarbeiter
ADD CONSTRAINT pk_mitarbeiter
PRIMARY KEY (MitarbeiterID)
;

ALTER TABLE tab_hat_exemplar
ADD CONSTRAINT pk_hat_exemplar
PRIMARY KEY (Name, ProduktNr)
;

ALTER TABLE tab_anschrift
ADD CONSTRAINT pk_anschrift
PRIMARY KEY (Nr)
;

ALTER TABLE tab_plz_ort
ADD CONSTRAINT pk_plz_ort
PRIMARY KEY (PLZ)
;

ALTER TABLE tab_arbeitet_in
ADD CONSTRAINT pk_arbeitet_in
PRIMARY KEY (Name, MitarbeiterID)
;

ALTER TABLE tab_anschrift_von_filiale
ADD CONSTRAINT pk_anschrift_von_filiale
PRIMARY KEY (Nr, Name)
;

ALTER TABLE tab_filiale
ADD CONSTRAINT pk_filiale
PRIMARY KEY (Name)
;

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

ALTER TABLE tab_anschrift_von_person
ADD CONSTRAINT fk_anschrift_v_p_person
FOREIGN KEY (SozialversicherungsNr)
REFERENCES tab_person
;

ALTER TABLE tab_anschrift_von_person
ADD CONSTRAINT fk_anschrift_v_p_anschrift
FOREIGN KEY (Nr)
REFERENCES tab_anschrift
;

ALTER TABLE tab_mitarbeiter
ADD CONSTRAINT fk_mitarbeiter_mitarbeiter
FOREIGN KEY (MitarbeiterID)
REFERENCES tab_mitarbeiter
;

ALTER TABLE tab_mitarbeiter
ADD CONSTRAINT fk_mitarbeiter_person
FOREIGN KEY (SozialversicherungsNr)
REFERENCES tab_person
;

ALTER TABLE tab_hat_exemplar
ADD CONSTRAINT fk_hat_exemplar_exemplar
FOREIGN KEY (ProduktNr)
REFERENCES tab_exemplar
;

ALTER TABLE tab_hat_exemplar
ADD CONSTRAINT fk_hat_exemplar_filiale
FOREIGN KEY (Name)
REFERENCES tab_filiale
;

ALTER TABLE tab_anschrift
ADD CONSTRAINT fk_anschrift_plz_ort
FOREIGN KEY (PLZ)
REFERENCES tab_plz_ort
;

ALTER TABLE tab_arbeitet_in
ADD CONSTRAINT fk_arbeitet_in_mitarbeiter
FOREIGN KEY (MitarbeiterID)
REFERENCES tab_mitarbeiter
;

ALTER TABLE tab_arbeitet_in
ADD CONSTRAINT fk_arbeitet_in_filiale
FOREIGN KEY (Name)
REFERENCES tab_filiale
;

ALTER TABLE tab_anschrift_von_filiale
ADD CONSTRAINT fk_anschrift_v_f_anschrift
FOREIGN KEY (Nr)
REFERENCES tab_anschrift
;

ALTER TABLE tab_anschrift_von_filiale
ADD CONSTRAINT fk_anschrift_v_f_filiale
FOREIGN KEY (Name)
REFERENCES tab_filiale
;

ALTER TABLE tab_kunde
	ADD CONSTRAINT fk_tab_kunde_tab_person
	FOREIGN KEY (SozialversicherungsNr)
	REFERENCES tab_person
;

ALTER TABLE tab_lizenzgeber
	ADD CONSTRAINT fk_tab_lizenzgeber_tab_person
	FOREIGN KEY (SozialversicherungsNr)
	REFERENCES tab_person
;

ALTER TABLE tab_leiht
	ADD CONSTRAINT fk_tab_leiht_tab_kunde
	FOREIGN KEY (KundenNr)
	REFERENCES tab_kunde
;

ALTER TABLE tab_leiht
	ADD CONSTRAINT fk_tab_leiht_tab_exemplar
	FOREIGN KEY (ProduktNr)
	REFERENCES tab_exemplar
;

ALTER TABLE tab_exemplar
	ADD CONSTRAINT fk_tab_exemplar_tab_video
	FOREIGN KEY (ProduktNr)
	REFERENCES tab_video
;

ALTER TABLE tab_video
	ADD CONSTRAINT fk_tab_video_tab_video
	FOREIGN KEY (VideoNr)
	REFERENCES tab_video
;

ALTER TABLE tab_video
	ADD CONSTRAINT fk_tab_video_tab_lizenzgeber
	FOREIGN KEY (Untenehmen)
	REFERENCES tab_lizenzgeber
;

ALTER TABLE tab_hat_genre
	ADD CONSTRAINT fk_tab_hat_genre_tab_video
	FOREIGN KEY (VideoNr)
	REFERENCES tab_video
;

ALTER TABLE tab_hat_genre
	ADD CONSTRAINT fk_tab_hat_genre_tab_genre
	FOREIGN KEY (Bezeichnung)
	REFERENCES tab_genre
;

set spool off