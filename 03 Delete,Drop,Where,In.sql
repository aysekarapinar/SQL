/*
=== DROP === DELETE === WHERE === IN === OR ===
*/
--DELETE; Tablodaki verileri siler (DML)
--DROP; Tabloyu tamamen siler (DDL)

CREATE TABLE cicekler(
	id INT,
	isim VARCHAR(100),
	renk VARCHAR(30),
	tur VARCHAR(100),
	boyut INT,
	mevsim VARCHAR(50),
	anlam VARCHAR(100)
);

SELECT * FROM cicekler;

INSERT INTO cicekler VALUES(1,'Gül','Kırmızı','Yapay',10,'Yaz','Aşk');
INSERT INTO cicekler VALUES(2,'Lale','Sarı','Kağıt',20,'Bahar','Dostluk');
INSERT INTO cicekler VALUES(3,'Papatya','Beyaz','Çiçek',5,'Yaz','Masumiyet');
INSERT INTO cicekler VALUES(4,'Karanfil','Pembe','Çiçek',15,'İlkbahar','Anne sevgisi');
INSERT INTO cicekler VALUES(5,'Orkide','Mor','Plastik',30,'Tropikal','Zarafet');
INSERT INTO cicekler VALUES(6,'Ayçiçek','Sarı','Yapay',40,'Sonbahar','Mutluluk');

--boyutu 10 olan satırı siliniz
DELETE FROM cicekler WHERE boyut=10;
--mevsimi bahar olan çiçekleri siliniz
DELETE FROM cicekler WHERE mevsim='Bahar';
SELECT * FROM cicekler WHERE mevsim='Bahar';
--ismi karanfil veya orkide olan çiçekleri sil
DELETE FROM cicekler WHERE isim='Karanfil' OR isim='Orkide';
DELETE FROM cicekler WHERE isim IN('Karanfil','Orkide');
SELECT * FROM cicekler WHERE isim='Karanfil' OR isim='Orkide';
--boyutu 40'dan küçük olan datayı siliniz
DELETE FROM cicekler WHERE boyut<40;
SELECT * FROM cicekler WHERE boyut<40;

INSERT INTO cicekler VALUES(4,'Karanfil','Pembe','Çiçek',15,'İlkbahar','Anne sevgisi');
INSERT INTO cicekler VALUES(5,'Orkide','Mor','Plastik',30,'Tropikal','Zarafet');

--Tüm verileri siliniz.
DELETE FROM cicekler;

--cicekler tablosunu siliniz
DROP TABLE cicekler;
