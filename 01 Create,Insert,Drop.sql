--CREATE ile tablo oluşturma/Header oluşturma
CREATE TABLE personel(
	personel_id INT,
	ad VARCHAR(40),
	soyad VARCHAR(50),
	TC_kimlik_no CHAR(11),
	dogum_tarihi DATE,
	cinsiyet CHAR(1),
	eposta VARCHAR(70),
	telefon_no CHAR(12),
	adres TEXT,
	ise_giris_tarihi DATE,
	pozisyon VARCHAR(30),
	maas DECIMAL(10,2),
	departman_id INT,
	yonetici_id INT
);

--Bu komuttan sonra schemas üzerinde sağ click ve refresh seçilince tablo görülür.

--DROP ile tablo silme
DROP TABLE personel;

-- SELECT ile tablodaki verileri listeleme
SELECT * FROM personel;

--INSERT ile veri ekleme.
INSERT INTO personel VALUES(
	1,'Ahmet','Yılmaz','12345678901','1980-02-01','E','ahmet@gmail.com','905555555555','Ankara','2020-05-21','QA Tester',50000,1,NULL
);

INSERT INTO personel VALUES(
	2,'Ayşe','Gül','12345678901','1970-06-18','K','ayse@gmail.com','905555555555','Ankara','2010-08-08','QA Tester',80000,1,1
);

CREATE TABLE ogrenciler(
	ogrenci_id INT,
	ogrenci_adi VARCHAR(50),
	ogrenci_soyad VARCHAR(50),
	ogrenci_not INT,
	ogrenci_bolumu VARCHAR(50),
	ogrenci_dogum_tarihi DATE,
	ogrenci_ortalama DECIMAL(4,2)
);

SELECT * FROM ogrenciler;

INSERT INTO ogrenciler VALUES(001,'Ayşe','Kara',75,'Bilgisayar','2000-01-02',96.45);
INSERT INTO ogrenciler VALUES(002,'Emre','Akdeniz',98,'Tarih','2001-05-27',81.70);
INSERT INTO ogrenciler VALUES(003,'İclal','Umut',43,'Tercümanlık','2002-04-21',87.35);
INSERT INTO ogrenciler VALUES(004,'Kübra','Akbalık',12,'İlahiyat','2000-07-29',76.45);


--ogrenciler tablosundan ogrenci_id sütununu listele
--Yıldız yerine sadece listelemesini istediğimiz sütunun ismi yazılacak.
SELECT ogrenci_id FROM ogrenciler;
SELECT ogrenci_adi FROM ogrenciler;
--ogrenciler tablosundan ogrenci_bolumu ve ogrenci_dogum_tarihi sütunlarını listele
SELECT ogrenci_bolumu,ogrenci_dogum_tarihi FROM ogrenciler;
SELECT ogrenci_soyad,ogrenci_not,ogrenci_ortalama FROM  ogrenciler;


DROP TABLE ogrenciler;