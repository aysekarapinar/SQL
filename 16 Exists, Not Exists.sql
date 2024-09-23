/*
EXIST ve NOT EXIST
Subquery'de kullanılır.
Subquery içinde en az 1 satır data var ise bize değer dönmesi için EXIST kullanılır
NOT EXIST ile değer yok ise kullanılır
*/

CREATE TABLE musteriler (
    musteri_id INT PRIMARY KEY,
    musteri_ad VARCHAR(100),
    adres VARCHAR(255)
);

CREATE TABLE pide_siparisleri (
    siparis_id INT PRIMARY KEY,
    siparis_tarihi DATE,
    musteri_id INT,
    pide_cesidi VARCHAR(100),
    FOREIGN KEY (musteri_id) REFERENCES musteriler(musteri_id)
);

INSERT INTO musteriler (musteri_id, musteri_ad, adres) VALUES
(1, 'Ali Veli', 'Karargah Sokak'),
(2, 'Ayşe Yılmaz', 'Elif Sokak'),
(3, 'Mehmet Kara', 'Abdülfeyyaz Sokak'),
(4, 'Tunç Saldı', 'Şen Sokak');

INSERT INTO pide_siparisleri (siparis_id, siparis_tarihi, musteri_id, pide_cesidi) VALUES
(1, '2024-04-01', 1, 'Kıymalı'),
(2, '2024-04-02', 2, 'Kaşarlı'),
(3, '2024-04-03', 3, 'Sucuklu'),
(4, '2024-04-04', 1, 'Kuşbaşılı'),
(5, '2024-04-05', 2, 'Kıymalı'),
(6, '2024-04-06', 3, 'Kuşbaşılı');

--En az 1 pide siparişi veren müşterileri listele
SELECT musteri_id, musteri_ad FROM musteriler
WHERE EXISTS(
SELECT 1
FROM pide_siparisleri
	WHERE pide_siparisleri.musteri_id=musteriler.musteri_id
)

--yumurtalı pide sipariş veren müsterileri listele
SELECT musteri_id, musteri_ad FROM musteriler M
WHERE EXISTS(
	SELECT 1
	FROM pide_siparisleri P
	WHERE p.musteri_id=M.musteri_id AND P.pide_cesidi='Yumurtalı'
)

--Hiç pide siparişi vermemiş müsterileri listeie
SELECT  musteri_ad FROM musteriler M
WHERE NOT EXISTS(
	SELECT 1
	FROM pide_siparisleri P
	WHERE P.musteri_id=M.musteri_id 
)	
	
--Kuşbaşılı pide siparişi etmiş müsterileri listele	
SELECT musteri_id, musteri_ad FROM musteriler M
WHERE EXISTS(
	SELECT 1
	FROM pide_siparisleri P
	WHERE P.musteri_id=M.musteri_id AND P.pide_cesidi='Kuşbaşılı'
)

--Hiç sipariş gelmemiş adresleri listele
SELECT musteri_id, musteri_ad, adres FROM musteriler M
WHERE NOT EXISTS(
	SELECT 1
	FROM pide_siparisleri P
	WHERE P.musteri_id=M.musteri_id
)

--Kuşbaşılı pideyi sipariş eden kişileri listele
SELECT musteri_id, musteri_ad FROM musteriler M
WHERE EXISTS(
	SELECT 1
	FROM pide_siparisleri P
	WHERE P.musteri_id=M.musteri_id AND P.pide_cesidi='Kuşbaşılı'

)