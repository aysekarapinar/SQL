/*
================== DML ==================

=== UPDATE === SET === WHERE ===
*/

CREATE TABLE ayakkabılar(
	id INT,
	marka VARCHAR(100),
	model VARCHAR(100),
	renk  VARCHAR(50),
	boyut INT,
	mevsim VARCHAR(50),
	fiyat REAL
);

SELECT * FROM ayakkabılar;

INSERT INTO ayakkabılar(id, marka, model, renk, boyut, mevsim, fiyat) 
VALUES (1, 'New Balance', '574','Gri',44,'Spor',1100),
(2, 'Adidas', 'Superstar','Beyaz',40,'Günlük',1500),
(3, 'Converse', 'Chuck Taylor','Siyah',36,'Yürüyüş',1990),
(4, 'Nike', 'Air Force','Kırmızı',32,'Yaz',2001),
(5, 'Adidas', 'San Smith','Mor',41,'Kış',3109),
(6, 'Puma', 'Suede','Pembe',42,'Sonbahar',1560);

--Markası Adidas olan ürünün modelini Hadidas olarak güncelle
UPDATE ayakkabılar SET model='Hadidas' WHERE marka='Adidas';
SELECT * FROM ayakkabılar WHERE model='Hadidas';

--Rengi siyah olan verileri pembe olarak güncelle
UPDATE ayakkabılar SET renk='Pembe' WHERE renk='Siyah';
SELECT * FROM ayakkabılar WHERE renk='Pembe';

--Puma markalı ürünleri ÖzhakikiPuma olarak güncelle
UPDATE ayakkabılar SET marka='ÖzHakikiPuma' WHERE marka='Puma';
SELECT * FROM ayakkabılar WHERE marka='ÖzHakikiPuma';

--Fiyatı 1600'den aşağı olan ayakkabıları fiyatını 1758 olarak güncelle
UPDATE ayakkabılar SET fiyat=1758 WHERE fiyat<1600;
SELECT * FROM ayakkabılar WHERE fiyat=1600;

