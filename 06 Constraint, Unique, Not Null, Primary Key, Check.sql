/* CONSTRAINT -- KISITLAMALAR; Tablolara belli şartlar koyma, o şartların dışına kullanıcıyı ve datayı çıkarmama. Tabloya bir çerçeve koyma. 
1) UNIQUE -->  Sütundaki verilerin BENZERSİZ olmasıdır. Aynı değerden bir daha yazılamaz.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Sütuna NULL değer girilmesini engeller. Değer girilmeden kayıt yapılamaz. Sütun boş bırakılamaz.
   (NOT NULL kısıtlaması veri türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sütunun birleşmesiyle elde edilen Primary Key'e Composite Primary Key denir. 

4) CHECK --> Bir sütuna girilen verinin değer aralığını sınırlar.

5) FOREIGN KEY --> Başka bir tablodaki PRIMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
*/



CREATE TABLE peynirler(
    id int PRIMARY KEY,
	isim varchar(50) UNIQUE,
	tur varchar(50) NOT NULL,
	koken varchar(50),
	sertlik int CHECK(sertlik BETWEEN 1 AND 5),
	fiyat decimal(5,2)
)

SELECT * FROM peynirler;

--ID girmeden data giriniz
INSERT INTO peynirler(isim, tur, koken, sertlik, fiyat) VALUES
('Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50)

--Doğru kod girişi
INSERT INTO peynirler(id, isim, tur, koken, sertlik, fiyat) VALUES
(1,'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50)

--İsim kısmına 'Beyaz Peynir' olan data ekleyin
INSERT INTO peynirler(isim, tur, koken, sertlik, fiyat) VALUES
(2,'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50)

--Doğru kod girişi
INSERT INTO peynirler(id, isim, tur, koken, sertlik, fiyat) VALUES
(2,'Kaşar Peyniri', 'Yumuşak', 'Ardahan', 5,350.50)

--Tür kısmını boş bırakarak data ekle
INSERT INTO peynirler(id, isim, tur, koken, sertlik, fiyat) VALUES
(3,'Çeçii Peyniri', 'Ardahan', 4,175.50)

--Doğru kod
INSERT INTO peynirler(id, isim, tur, koken, sertlik, fiyat) VALUES
(3,'Çeçil Peyniri', 'Sert', 'Ardahan', 4,175.50)

--check kisitlamasini ihlal eden data girin
INSERT INTO peynirler(id,isim, tur,koken, sertlik, fiyat) VALUES
(4,'Tuluk Peyniri', 'Yarı Sert','Kars', 9, 479.50)

--doğru kod
INSERT INTO peynirler(id,isim, tur,koken, sertlik, fiyat) VALUES
(4,'Tuluk Peyniri', 'Yarı Sert','Kars', 3, 479.50)


-- COMPOSİTE PRIMARY KEY

CREATE TABLE peynir(
    id int,
	isim varchar(50) UNIQUE,
	tur varchar(50) NOT NULL,
	koken varchar(50),
	sertlik int CHECK(sertlik BETWEEN 1 AND 5),
	fiyat decimal(5,2),
	CONSTRAINT composite_primarykey PRIMARY KEY(koken,fiyat)
)--kısıtlama tanımlanıp kısıtlamaya bir isim verilir, primary key kısıtlaması konulur(hangi datalar olduğu yazılır)
	
SELECT * FROM peynir;	

--check degerini ihlal eden data ekle
INSERT INTO peynir VALUES(1,'Beyaz Peynir', 'Sert', 'Ardahan',8,185.20)

--doğru kod
INSERT INTO peynir VALUES(1,'Beyaz Peynir', 'Sert', 'Ardahan',1,185.20)


--isim aynı olan data ekle
INSERT INTO peynir VALUES(2,'Beyaz Peynir', 'Yarı Sert', 'Çıldır',3,225.10)

--doğru kod
INSERT INTO peynir VALUES(2,'Kaşar Peyniri', 'Yarı Sert', 'Çıldır',3,225.10)

--tur not null bırakıp data ekle
INSERT INTO peynir VALUES(2,'Cheddar Peyniri', 'Kars',5,125.99)

--dogru kod
INSERT INTO peynir VALUES(2,'Cheddar Peyniri', 'Yarı Yumuşak', 'Kars',5,125.99)


--composite primary key ihlali yap. koken ve fiyat ayni değer gir
INSERT INTO peynir VALUES(4,'Gouda Peyniri', 'Yarı Yumuşak', 'Ardahan',5,185.20)

--doğru kod
INSERT INTO peynir VALUES(4,'Gouda Peyniri', 'Yarı Yumuşak', 'Hanak',5,185.20)

--composite primary key ihlali yap. koken ve fiyat ayni değer gir
INSERT INTO peynir VALUES(5,'Parmesan Peyniri', 'Sert', 'Kars',5,125.99)

-- doğru kod
INSERT INTO peynir VALUES(5,'Parmesan Peyniri', 'Sert', 'Kars',5,80.99)

SELECT * FROM peynir;