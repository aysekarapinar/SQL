/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  DROP: Tabloyu siler.
  ALTER: Tabloyu günceller. Tablonun üstüne ek yapılır. Yeni sütun eklenir.
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  DELETE:Tablodaki verileri siler
  UPDATE:Tablodaki verileri günceller

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/

CREATE TABLE tişörtler(
  id INT,
  marka VARCHAR(255),
  model VARCHAR(255),
  beden VARCHAR(25),
  fiyat DECIMAL(10,2)
);

INSERT INTO tişörtler VALUES (1, 'Nike', 'Dri-Fit', 'M', 150.25 );
INSERT INTO tişörtler VALUES (2, 'Adidas', 'Climacool',  'L', 180.50 );
INSERT INTO tişörtler VALUES (3, 'Puma', 'Active', 'XL', 200.75 );
INSERT INTO tişörtler VALUES (4, 'Under Armour', 'HeatGear',  'S', 120.10 );
INSERT INTO tişörtler VALUES(5, 'Champion', 'Reverse Weave',  'M', 130.35 );
INSERT INTO tişörtler VALUES(6, 'Hanes', 'Beefy-T',  'L', 100.60 );

SELECT * FROM tişörtler;

--Tişörtler tablosuna rengi varchar(50) şeklinde yeni sütun ekle
ALTER TABLE tişörtler ADD COLUMN renk VARCHAR(50);
SELECT * FROM tişörtler;

--Tişörtler tablosuna id sütununu ismini sıra_no olarak değiştir
ALTER TABLE tişörtler RENAME COLUMN id TO sıra_no;
SELECT sıra_no FROM tişörtler;

--Tişörtler tablosunda kargo_boyutu INT şeklinde yeni bir sütun ekle
ALTER TABLE tişörtler ADD COLUMN kargo_boyutu INT;
SELECT * FROM tişörtler;

--Tişörtler tablosuna malzeme VARCHAR(50) şeklinde yeni sütun ekle, default değeri 'Pamuk' olsun
ALTER TABLE tişörtler ADD COLUMN malzeme VARCHAR(50) DEFAULT 'Pamuk';
SELECT * FROM tişörtler;

--Tişörtler tablosunda marka sütununun ismini firma olarak değiştir
ALTER TABLE tişörtler RENAME COLUMN marka TO firma;

--Tişörtler tablosunun adını tshirt olarak değiştir
ALTER TABLE tişörtler RENAME TO tshirt;
SELECT * FROM tshirt;



