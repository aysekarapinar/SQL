/*
JOIN 

JOIN, iki veya daha fazla tabloyu ortak bir sütuna veya başka bir bağlantı kriterine göre birleştirmek için kullanılır. 
Bu işlemler, karmaşık veritabanı sorgularında veri kümelerini birleştirmek ve analiz etmek için oldukça önemlidir.

INNER JOIN: Bu işlem, her iki tabloda da ortak bir değere sahip olan kayıtları birleştirir.
LEFT JOIN: Bu işlem, sol tablodan tüm kayıtları, sağ tablodan ise ortak değere sahip olan kayıtları birleştirir.
Eğer soldaki tabloda eşleşmeyen satırlar varsa, bu satırların yerinde NULL değerler döner.
RIGHT JOIN: Bu işlem, sağ tablodan tüm kayıtları, sol tablodan ise ortak değere sahip olan kayıtları birleştirir.
Eğer soldaki tabloda eşleşmeyen satırlar varsa, bu satırların yerinde NULL değerler döner.
FULL JOIN: Bu işlem, her iki tablodan da tüm kayıtları birleştirir, ortak değere sahip olmayan kayıtlar için boş değerler gösterir
*/

CREATE TABLE musteri (
    musteri_id INT PRIMARY KEY,
    musteri_ad VARCHAR(50) NOT NULL,
    adres VARCHAR(255) NOT NULL
);

CREATE TABLE siparisler (
    siparis_adedi INT NOT NULL,
    siparis_tarihi DATE NOT NULL,
    musteri_id INT NOT NULL,
    pide_cesidi VARCHAR(50) NOT NULL,
    FOREIGN KEY (musteri_id) REFERENCES musteriler(musteri_id)
);

INSERT INTO musteri (musteri_id,musteri_ad, adres) VALUES
(1,'Ali Veli', 'Karargah Sokak'),
(2,'Ayşe Yılmaz', 'Elif Sokak'),
(3,'Mehmet Kara', 'Abdülfeyyaz Sokak'),
(4,'Tunç Saldı', 'Şen Sokak');

INSERT INTO siparisler ( siparis_adedi, siparis_tarihi, musteri_id, pide_cesidi) VALUES
(4,'2024-04-01', 1, 'Kıymalı'),
(6,'2024-04-02', 2, 'Kaşarlı'),
(3,'2024-04-03', 3, 'Sucuklu'),
(7,'2024-04-04', 1, 'Kuşbaşılı'),
(12,'2024-04-05', 2, 'Kıymalı'),
(3,'2024-04-06', 3, 'Kuşbaşılı'),
(9,'2024-04-07', 1, 'Kaşarlı');

--Hiç sipariş vermemiş müşterilerin isimlerini ve adreslerini listele
SELECT M.musteri_ad, M.adres FROM musteri M
LEFT JOIN siparisler S ON M.musteri_id=S.musteri_id
WHERE S.musteri_id IS NULL;

--7'den fazla sipariş veren müşterinin adını ve sipariş sayısını listele
SELECT M.musteri_ad, M.musteri_id, S.siparis_adedi FROM musteri M
INNER JOIN siparisler AS S ON M.musteri_id=S.musteri_id
WHERE siparis_adedi>7;

--2 seferden fazla sipariş veren tüm müşterileri listele
SELECT M.musteri_ad, COUNT(*) AS siparis_sayisi FROM musteri M
JOIN siparisler S ON M.musteri_id=S.musteri_id
GROUP BY M.musteri_id, M.musteri_ad
HAVING COUNT(*)>2;

--Her müşterinin adresini ve sipariş verdiği son tarihi gösteren bir sorgu yazınız
SELECT M.musteri_ad, M.adres, MAX(S.siparis_tarihi) AS son_siparis_tarihi
FROM musteri M
RIGHT JOIN siparisler s ON M.musteri_id= S.musteri_id
GROUP BY M.musteri_id, M.adres
ORDER BY M.musteri_id;

--Her müşterinin adını, adresini, sipariş verdiği pide türünü ve sipariş tarihlerini listele
SELECT M.musteri_ad, M.adres, S.siparis_tarihi, S.pide_cesidi
FROM musteri M
FULL JOIN siparisler S ON M.musteri_id= S.musteri_id
ORDER BY M.musteri_id, S.siparis_tarihi;