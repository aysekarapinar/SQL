CREATE TABLE ogretmenler (
 ogretmen_id INT NOT NULL,
 isim VARCHAR(50) NOT NULL,
 soyisim VARCHAR(50) NOT NULL,
 ders VARCHAR(50) PRIMARY KEY

);

INSERT INTO ogretmenler (ogretmen_id, isim, soyisim, ders)
VALUES
  (1, 'Ayşe', 'Yılmaz', 'Matematik'),
  (2, 'Mehmet', 'Öztürk', 'Fizik'),
  (3, 'Elif', 'Demir', 'Biyoloji'),
  (4, 'Ahmet', 'Kaya', 'Kimya'),
  (5, 'Fatma', 'Çelik', 'Türkçe');


SELECT * FROM ogretmenler


CREATE TABLE okullar (
 ders_id INT PRIMARY KEY,
 ders_adi VARCHAR(50) NOT NULL,
 okul VARCHAR(50) NOT NULL,
	 CONSTRAINT fk_ders FOREIGN KEY (ders_adi) REFERENCES ogretmenler(ders) 
	ON DELETE CASCADE
);


INSERT INTO okullar (ders_id, ders_adi, okul)
VALUES
  (1, 'Matematik', 'Ankara Üniversitesi'),
  (2, 'Fizik', 'İstanbul Teknik Üniversitesi'),
  (3, 'Kimya', 'Orta Doğu Teknik Üniversitesi');


SELECT * FROM okullar

--ogretmenler tablosundaki butun verileri sil
DELETE FROM ogretmenler;

--ogretmenler tablosunu sil
DROP TABLE ogretmenler CASCADE;

SELECT * FROM ogretmenler

--okullar tablosunu sil
DROP TABLE okullar;

SELECT * FROM okullar

/*
-----------------------------------------------------------
-------------------------------------------------------------
*/

CREATE TABLE giderler (
  gider_id INT UNIQUE,
  tutar DECIMAL(10,2) PRIMARY KEY,
  harcama_kalemi VARCHAR(50) NOT NULL
);

INSERT INTO giderler (gider_id, tutar, harcama_kalemi)
VALUES
  (1, 150.00, 'Kırtasiye Malzemesi'),
  (2, 200.00, 'Ofis Kirası'),
  (3, 300.00, 'Maaş');


CREATE TABLE genel_muhasebe(
	donem INT,
    tarih DATE NOT NULL,
	gelir DECIMAL(10,2) NOT NULL,
	gider DECIMAL(10,2) NOT NULL,
	gider_toplami DECIMAL(10,2) NOT NULL,
	kar_zarar DECIMAL(10,2),
	FOREIGN KEY (gider) REFERENCES giderler(tutar)
);


SELECT * FROM genel_muhasebe;

INSERT INTO genel_muhasebe(donem, tarih,gelir, gider, gider_toplami, kar_zarar) 
VALUES
(1, '2024-04-24', 10000.00, 150.00, 8500.00,150.00),
(2, '2024-04-24', 10000.00, 200.00, 8500.00,150.00),
(3, '2024-04-24', 10000.00, 300.00, 8500.00,150.00);


--giderler tablosundaki verileri sil
DELETE FROM giderler;
--error verir çünkü child tablodan veri silmeden parent tablodan veri silinemez.