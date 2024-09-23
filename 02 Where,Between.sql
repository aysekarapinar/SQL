-- Belli şartlara bağlı olarak istenen verileri listeleme

CREATE TABLE biskuvi(
	biskuvi_id INT,
	biskuvi_adi VARCHAR(50),
	biskuvi_turu VARCHAR(50),
	biskuvi_agirligi REAL,
	biskuvi_fiyati DECIMAL(4,2),
	biskuvi_stok_miktari INT,
	biskuvi_uretim_tarihi DATE
);

DROP TABLE biskuvi;
SELECT * FROM biskuvi;

INSERT INTO biskuvi(
    biskuvi_id,
	biskuvi_adi,
	biskuvi_turu,
	biskuvi_agirligi,
	biskuvi_fiyati,
	biskuvi_stok_miktari,
	biskuvi_uretim_tarihi) VALUES
    (001,'sütlü bisküvi','sütlü',100,12.50,100,'2024-09-10'),
	(002,'kakaolu bisküvi','kakaolu',100,13.90,100,'2024-09-10'),
	(003,'kaymaklı bisküvi','kaymaklı',100,17.50,100,'2024-09-10'),
	(004,'yulaflı bisküvi','yulaflı',100,20.50,100,'2024-09-10'),
	(005,'çavdarlı bisküvi','çavdarlı',100,18.95,100,'2024-09-10');
	
	
	
--fiyatı 13 liradan fazla olan ürünleri listeleyin
SELECT * FROM biskuvi WHERE biskuvi_fiyati>13;
--Türü sütlü ürünleri listeleyin
SELECT * FROM biskuvi WHERE biskuvi_turu='sütlü';
--biskuvi_adi 2'den büyük olan ve stok miktarı 50'den fazla olan ütünleri listele
SELECT * FROM biskuvi WHERE biskuvi_id>2 AND biskuvi_stok_miktari>50;
--ağırlığı 100 veya 175 olan ürünleri listele
SELECT * FROM biskuvi WHERE biskuvi_agirligi=100 OR biskuvi_agirligi=175;
SELECT * FROM biskuvi WHERE biskuvi_agirligi IN(100,175);
--stok miktarı 25 olmayan tüm ürünleri listele
SELECT * FROM biskuvi WHERE biskuvi_stok_miktari NOT IN(25);
--IN, birden fazla değeri listelemeye yarıyor.
--bisküvi id 1 ile 4 arasındaki ürünleri listele
SELECT * FROM biskuvi WHERE biskuvi_id>=2 AND biskuvi_id<=4;
SELECT * FROM biskuvi WHERE biskuvi_id BETWEEN 2 AND 4;
--bisküvi stok miktarı 40 ile 80 arasında olmayan ürünlerin bisküvi adı ve bisküvü üretim tarihini listele
SELECT biskuvi_adi,biskuvi_uretim_tarihi FROM biskuvi WHERE biskuvi_stok_miktari NOT BETWEEN 40 AND 80;
