CREATE TABLE angaralilar (
  isim VARCHAR(50),
  soyisim VARCHAR(50),
  CONSTRAINT pk_isim PRIMARY KEY (isim),
	CONSTRAINT uq_soyisim UNIQUE (soyisim)
);


INSERT INTO angaralilar (isim, soyisim)
VALUES('Hakan','Tanrıverdi');

INSERT INTO angaralilar (isim, soyisim)
VALUES('Azra','Can');

--Hakan Yılmaz'ı angaralilar tablosuna ekle
INSERT INTO angaralilar (isim, soyisim)
VALUES('Hakan','Yılmaz');
--Error verdi çünkü isim sütununda pk_isim PRIMARY KEY kısıtlamasoı var

--doğru kod
INSERT INTO angaralilar (isim, soyisim)
VALUES('Elif','Yılmaz');

--Mert Can'ı angaralilar tablosuna ekle
INSERT INTO angaralilar (isim, soyisim)
VALUES('Mert','Can');
--uq_soyisim UNIQUE kısıtlaması olduğu için error verdi.

--doğru kod
INSERT INTO angaralilar (isim, soyisim)
VALUES('Mert','Özkan');

--Korkmaz soyadlı kişiyi angaralilar tablosuna ekle
INSERT INTO angaralilar (isim, soyisim)
VALUES(null,'Korkmaz');
--Primary Key kısıtlamasından dolayı null değer girilemez.

--doğru kod
INSERT INTO angaralilar (isim, soyisim)
VALUES('Ayşe','Korkmaz');

CREATE TABLE arabalar(
	marka VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	CONSTRAINT pk_arabalar PRIMARY KEY (marka, model)
);
--Parantez içinde CONSTRAINT ayrıca tanımla avantajları
-- 1) CONSTRAINT ismini pk_arabalar şeklinde kendim belirleyebildim
-- 2) composite primary key tanımlayabildim.

SELECT * FROM arabalar;

INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Şahin');

INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Serçe');

INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Doğan');

--Tofaş marka Doğan model arabayı arabalar tablosuna ekle
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Doğan');
--Error verdi çünkü pk_arabalar PRIMARY KEY kısıtlaması var. Tablodaki değerler yan yana tekrar girilemez

--doğru kod
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Doğan S');

--Doğan SLX arabayı arabalar tablosuna ekle
INSERT INTO arabalar (marka, model)
VALUES (NULL,'Doğan SLX');
--Arabalar null değer alamaz. NOT NULL kısıtlaması var. Bir değer girmek zorundayız.

--doğru kod
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Doğan SLX');

--Tofaş marka arabayı arabalar tablosuna ekle
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş',NULL);
--Arabalar null değer alamaz. NOT NULL kısıtlaması var. Bir değer girmek zorundayız.

--doğru kod
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş','Murat 124');

--Renault marka Murat 124 model arabayı ekle
INSERT INTO arabalar (marka, model)
VALUES ('Renault','Murat 124');