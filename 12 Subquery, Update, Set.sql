/*
SUBQUERY
Sorgulamalar içinde ikinci bir sorgulama yaparken kullanılır.
Ayrıca update gibi metotlarda kullanılır
*/

CREATE TABLE salon_takimlari(
    marka_id int,
	marka_adi varchar(50),
	model_adi varchar(50),
	stok int
);

INSERT INTO salon_takimlari(marka_id ,	marka_adi,	model_adi ,	stok) 
VALUES
(1, 'İstikbal', 'Luna Salon Takımı', 10),
(2, 'Enza Home', 'City Salon Takımı', 15),
(3, 'Doğtaş', 'Modern Salon Takımı', 8),
(4, 'Kelebek Mobilya', 'Klasik Salon Takımı', 5),
(5, 'Enza Home', 'Avantgarde Salon Takımı', 3),
(6, 'Doğtaş', 'Comfort Salon Takımı', 12),
(7, 'İstikbal', 'Elegance Salon Takımı', 6),
(8, 'Doğtaş', 'Trend Salon Takımı', 14);


SELECT * FROM salon_takimlari;

CREATE TABLE musteriler(
    musteri_adi varchar(50),
	marka_id real,
	marka_adi varchar(50),
	model_adi varchar(50),
	adet real
);


INSERT INTO musteriler(musteri_adi ,marka_id ,	marka_adi ,	model_adi ,	adet)
VALUES
('Ayşe Yılmaz', 1, 'İstikbal', 'Luna Salon Takımı', 1),
('Mehmet Öztürk', 2, 'Enza Home', 'Modern Salon Takımı', 2),
('Elif Karataş', 3, 'Doğtaş', 'Comfort Salon Takımı', 1),
('Berat Yıldırım', 4, 'Kelebek Mobilya', 'Trend Salon Takımı', 1);

SELECT * FROM musteriler;

/* musteriler tablosunda adı Berat Yıldırım olanın marka adını salon_takimlari 
tablosundan model adı City Salon Takımı olan marka ile güncelle
*/
UPDATE musteriler SET marka_adi=(SELECT marka_adi FROM salon_takimlari WHERE model_adi='City Salon Takımı' ) WHERE musteri_adi='Berat Yıldırım'

/* musteriler tablosunda marka adı Enza Home olan marka adlarını 
salon_takimlari tablosundan marka id si 8 olan marka ile güncelle
*/

UPDATE musteriler SET marka_adi=(SELECT marka_adi FROM salon_takimlari WHERE marka_id=8 ) WHERE marka_adi='Enza Home'

/* musteriler tablosunda 1 adet ürün isteyen müşterilerin model adlarını 
salon_takimlari tablosundan stok adedi 14'ten büyük model adı ile güncelle
*/
UPDATE musteriler SET model_adi=(SELECT model_adi FROM salon_takimlari WHERE stok>14) WHERE adet=1


/* musteriler tablosunda marka adı Doğtaş olan ürünlerin  adetlerini
salon_takimlari tablosundan model adı Klasik Salon Takımı olan ürünün stok değeri ile güncelle
*/
UPDATE musteriler SET adet=(SELECT stok FROM salon_takimlari WHERE model_adi='Klasik Salon Takımı') WHERE marka_adi='Doğtaş'

/* musteriler tablosunda müşteri adı Elif Karataş olan ürünün markasını
salon_takimlari tablosundan marka id si 1 olan ürünün marka adı ile güncelle
*/
UPDATE musteriler SET marka_adi=(SELECT marka_adi FROM salon_takimlari WHERE marka_id=1) WHERE musteri_adi='Elif Karataş'

/* musteriler tablosunda marka id'si 2'den büyük ürünlerin model adını
salon_takimlari tablosundan stok değeri 4'ten küçük ürünün model adı ile güncelle
*/
UPDATE musteriler SET model_adi=(SELECT model_adi FROM salon_takimlari WHERE stok<4) WHERE marka_id>2