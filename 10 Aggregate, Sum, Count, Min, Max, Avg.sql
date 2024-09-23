/*
AGGREGATE METHODU

AGGREGATE METHODLARI: Database'de birden çok değer içinden tek bir değer elde etmek istediğimizde kullanılır.
Özet halde rapor almaya benzetilebilir. Bir bilgi yığını için özet bir rapor isteyip almak gibi.

SUM() ==> Verilerin toplamını alır.
COUNT() ==> Verilerin sayısını alır.

MIN() ==> Verilerden en küçük değeri alır.
MAX() ==> Verilerden en büyük değeri alır.

AVG() ==> Verilerin ortalamasını alır.

*/


CREATE TABLE parfumler(
	urun_id INT PRIMARY KEY,
    urun_adi VARCHAR (50) NOT NULL,
    fiyat DECIMAL (10,2) NOT NULL,
    stok_adedi INT  NOT NULL
);

SELECT * FROM parfumler;

INSERT INTO parfumler(urun_id,urun_adi, fiyat, stok_adedi)
VALUES
(1, 'Chanel', 420.00, 10),
(2, 'Dior Sauvage', 150.00, 5),
(3, 'Gucci Guilty', 90.40, 20),
(4, 'Armani Si', 570.60, 15),
(5, 'Versace Eros', 290.00, 8);

--Tablodaki parfumlerin toplam stok adedini listele
SELECT SUM(stok_adedi) FROM parfumler;

--Tabloda kaç adet ürün adı olduğunu listele
SELECT COUNT(urun_adi) FROM parfumler;

--Tablodaki en düşük fiyatı listele
SELECT MIN(fiyat) FROM parfumler;

--Tablodaki en yüksek fiyatı listele
SELECT MAX(fiyat) FROM parfumler;

--Tablodaki en ucuz ürün fiyatını en_dusuk_urun_fiyatı olarak listele
SELECT MIN(fiyat) AS en_dusuk_urun_fiyatı FROM parfumler;
--AS ile verdiğimiz isim olarak listelenir

--Tablodaki en pahalı ürünü en_yuksek_urun_fiyatı olarak listele
SELECT MAX(fiyat) AS en_yuksek_urun_fiyatı FROM parfumler;

--Tablodaki ürünlerin ortalama fiyatını listele
SELECT AVG(fiyat) FROM parfumler;
SELECT ROUND(AVG(fiyat),2) FROM parfumler;
SELECT ROUND(AVG(fiyat)) FROM parfumler;

/*
-------------------------------
*/

CREATE TABLE yogurtlar(
yogurt_id INT UNIQUE,
	marka VARCHAR (50) PRIMARY KEY,
	agirlik REAL NOT NULL,
	yasama_suresi INT  NOT NULL,
	fiyat DECIMAL(7,2)  NOT NULL
);

INSERT INTO yogurtlar VALUES(1, 'İçim', 250, 2, 56.00);
INSERT INTO yogurtlar VALUES(2, 'Pınar', 300, 3, 96.00);
INSERT INTO yogurtlar VALUES(3, 'Deva', 200, 2, 46.70);
INSERT INTO yogurtlar VALUES(4, 'Eker', 400, 4, 99.00);
INSERT INTO yogurtlar VALUES(5, 'İtimat', 150, 1, 36.11);
INSERT INTO yogurtlar VALUES(6, 'Sütaş', 2500, 2, 146.00);
INSERT INTO yogurtlar VALUES(7, 'Yörem', 3500, 25, 246.10);
INSERT INTO yogurtlar VALUES(8, 'Çayırova', 1000, 2, 116.05);
INSERT INTO yogurtlar VALUES(9, 'Kebir', 400, 1, 89.00);
INSERT INTO yogurtlar VALUES(10, 'Kırköy', 1500, 3, 126.00);

SELECT * FROM yogurtlar;

--Tablodaki  ürünlerin toplam ağırlığı
SELECT SUM(agirlik) FROM yogurtlar;

--Tablodaki en düşük ağırlığı listele
SELECT MIN(agirlik) FROM yogurtlar;

--Tablodaki ürünlerin ortalama ağırlık
SELECT AVG(agirlik) FROM yogurtlar;
SELECT ROUND(AVG(agirlik)) FROM yogurtlar;

--Tabloda kaç tane marka bulunduğunu listele
SELECT COUNT(marka) FROM yogurtlar;
SELECT COUNT(yogurt_id) FROM yogurtlar;

--Tablodaki en düşük fiyatı listele
SELECT MIN(fiyat) FROM yogurtlar;

--Tablodaki en düşük fiyatı en_dusuk_urun_fiyati olarak listele
SELECT MIN(fiyat) AS en_dusuk_urun_fiyati FROM yogurtlar;

--Tablodaki en yüksek fiyatı listele
SELECT MAX(fiyat) FROM yogurtlar;

--Tablodaki en yüksek fiyatı en_yuksek_urun_fiyatı olarak listele
SELECT MAX(fiyat) AS en_yuksek_urun_fiyatı FROM yogurtlar;

--Tablodaki ürünlerin ortalama fiyatını listele
SELECT AVG(fiyat) FROM yogurtlar;
SELECT ROUND(AVG(fiyat),2) FROM yogurtlar;
SELECT ROUND(AVG(fiyat)) FROM yogurtlar;

--Tablodaki ürünlerin ortalama yaşam süresini listele
SELECT ROUND(AVG(yasama_suresi)) FROM yogurtlar;

--Tablodaki en yüksek yaşam süresini listele
SELECT MAX(yasama_suresi) FROM yogurtlar;




