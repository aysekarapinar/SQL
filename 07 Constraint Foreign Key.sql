/* CONSTRAINT -- KISITLAMALAR 
1) UNIQUE -->  Sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Sütuna NULL değer girilmesini engeller
   (NOT NULL kısıtlaması veri türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sütunun birleşmesiyle elde edilen Primary Key'e Composite Primary Key denir.

4) CHECK --> Bir sütuna girilen verinin değer aralığını sınırlar.

5) FOREIGN KEY --> Başka bir tablodaki PRIMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
   1- PRIMARY KEY olan tablo parent olur.
   2- FOREIGN KEY olan tablo child olur.
   3- parent tabloda olmayan PRIMARY KEY ile child tabloya veri giremeyiz. 
   örnek: PRIMARY KEY tablosunda Ahmet, Ayşe,Veli varsa bunları child tabloya girebiliriz. Bunlar 
   dışındakiler girilemez. Hakan, child tabloya girilemez çünkü PRIMARY KEY tablosunda yok.
   4- veri silmede sıra önce child tablodan başlar. ardından parent tablodaki veri silinebilir.
   Yani child tablo Hakan ismini parent tablodan foreign key ile kullanıyorsa, parent tablodan bu data
   direk silinemez. önce child tabloda Hakan silinir, sonra parent tabloda silinir.
   5- tablo silmede de yukarıdaki sıra izlenir.
   Yani önce child tablo silinir, sonra parent silinebilir.
   6- parent tabloda null değer girilemez ama child tabloya girilebilir.
*/

CREATE TABLE peynirim(
    id int NOT null,
	isim varchar(50) UNIQUE,
	tur varchar(50) NOT NULL,
	koken varchar(50) PRIMARY KEY,
	sertlik int CHECK(sertlik BETWEEN 1 AND 5),
	fiyat decimal(5,2)
);

SELECT * FROM peynirim;

INSERT INTO peynirim values(1,'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50);
INSERT INTO peynirim values(2,'Kaşar Peyniri', 'Yumuşak', 'Çıldır', 5,350.50);
INSERT INTO peynirim values(3,'Çeçil Peyniri', 'Sert','Göle', 4, 175.50);
INSERT INTO peynirim values(4,'Tuluk Peyniri', 'Yarı Sert','Kars', 3, 479.50);


CREATE TABLE peynir_mayalari(
	id int,
	isim varchar(50) UNIQUE NOT NULL,
	tur VARCHAR(50) NOT NULL,
	marka VARCHAR(50) NOT NULL,
	uretim_yeri VARCHAR(50),
	fiyat DECIMAL(5,2) NOT NULL,
	peynir_tipi VARCHAR(50) NOT NULL,
	CONSTRAINT yore FOREIGN KEY(uretim_yeri) REFERENCES peynirim(koken)
    --Prımary Key olan sütun olmalı.
);

SELECT * FROM peynir_mayalari;

INSERT INTO peynir_mayalari VALUES (1,'Yöresel Beyaz Peynir Mayası','Sıcak','Yerli Marka','Ardahan',150.50,'Beyaz Peynir');
INSERT INTO peynir_mayalari VALUES (2,'Kaşar Peyniri Mayası','Sıcak','Lezzetli Marka','Göle',220.50,'Kaşar Peyniri');
INSERT INTO peynir_mayalari VALUES (3,'Cheddar Peyniri Mayası','Soğuk','Uluslararası Marka','Kars',190.99,'Cheddar Peyniri');



--peynir_mayalari tablosuna Mozzarella Peyniri ekle
INSERT INTO peynir_mayalari VALUES (4,'Mozzarella Peyniri Mayası','Soğuk','Uluslararası Marka','Artvin',190.99,'Mozzarella Peyniri');
--doğru kod
INSERT INTO peynir_mayalari VALUES (4,'Mozzarella Peyniri Mayası','Soğuk','Uluslararası Marka','Çıldır',190.99,'Mozzarella Peyniri');

--peynir_mayalari tablosuna Gouda Peyniri ekle.
INSERT INTO peynir_mayalari VALUES (4,'Gouda Peyniri Mayası','Sıcak','Uluslararası Marka','Göle',225.39,'Gouda Peyniri');

--peynir_mayalari tablosuna Parmesan Peyniri ekle
INSERT INTO peynir_mayalari VALUES  (6,'Parmesan Peyniri Mayası', 'Soğuk', 'Uluslararası Marka', null, 30.00, 'Parmesan Peyniri');
--Bu kod hata verdi çünkü parenttan önce aynı veri child'dan silinmeli

--peynirim tablosundan koken Ardahan olan veriyi sil
DELETE FROM peynirim WHERE koken='Ardahan';

--peynir_mayalari tablosundan koken Ardahan olan veriyi sil
DELETE FROM peynir_mayalari WHERE uretim_yeri='Ardahan';

--peynirim tablosunu sil
DROP TABLE peynirim;
--child tablo silinmediğinden bu kod hata verdi.
--child tablo silindiğinde bu kodda çalıştı.

--peynir_mayalari tablosunu sil
DROP TABLE peynir_mayalari;