/*
GROUP BY

GROUP BY cümleciği bir SELECT ifadesinde satırları, sütunların değerlerine göre 
verileri özetlemek ve analiz etmek için GRUPLAMAK için kullanılır.

GROUP BY cümleciği her grup başına bir satır döndürür.

GROUP BY genelde, AVG(), COUNT(), MAX(), MIN() ve SUM() gibi aggregate fonksiyonları ile birlikte kullanılır.

GROUP BY cümleciği, SELECT cümleciğinin FROM ve WHERE kısımlarından sonra gelir.
GROUP BY cümleciğinde, gruplama işleminin yapılacağı sütunların adları belirtilir.
Birden fazla sütuna göre gruplama yapmak için sütun adları virgülle ayrılır.
Bir sütuna göre gruplama yaparken, o sütunun değerleri benzersiz olmalıdır.
GROUP BY cümleciği ile birlikte aggregate fonksiyonları kullanılmadığında, her grup için her sütunun değeri ayrı ayrı listelenir.

*/


CREATE TABLE ogrenci_bilgileri(
    ingilizce_notu INT PRIMARY KEY,
	not_ortalamasi REAL not null,
	kulup_calismasi VARCHAR(50 ) not null,
	cinsiyet VARCHAR(5) not null,
	bolum VARCHAR(50 ) not null
);



INSERT INTO ogrenci_bilgileri (ingilizce_notu ,not_ortalamasi ,kulup_calismasi ,cinsiyet ,bolum)
VALUES
(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
(39, 89, 'Ebru', 'Erkek', 'Matematik'),
(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
(1595, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
(65, 85, 'Gitar', 'Kadın', 'Matematik'),
(74, 99, 'Gitar', 'Erkek', 'Elektrik Mühendisliği'),
(89, 67, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
(91, 38, 'Ebru', 'Kadın', 'Bilgisayar Mühendisliği'),
(85, 85, 'Havacılık', 'Erkek', 'Elektrik Mühendisliği'),
(90, 79, 'Maket', 'Kadın', 'Matematik'),
(36, 67, 'Maket', 'Erkek', 'Elektrik Mühendisliği');


SELECT * FROM ogrenci_bilgileri;,


--öğrencilerin okudukları bölümlerin not ortalamasını listele
SELECT bolum,AVG(not_ortalamasi) FROM ogrenci_bilgileri GROUP BY bolum

--Öğrencilerin okudukları bölümlerin ingilizce not ortalamasını listele
SELECT bolum, ROUND(AVG(ingilizce_notu)) AS ingilizce_not_ortalamasi FROM ogrenci_bilgileri GROUP BY bolum

--Öğrencilerin kulüp çalışmalarına göre ingilizce not ortalaması
SELECT kulup_calismasi, ROUND(AVG(ingilizce_notu),2) AS ingilizce_not_ortalamasi  FROM ogrenci_bilgileri GROUP BY kulup_calismasi

--Öğrencilerin cinsiyetlerine göre hangi bölümde kaç kişi olduğunu listele
SELECT cinsiyet, bolum, COUNT(cinsiyet) AS kisi_sayisi FROM ogrenci_bilgileri GROUP BY cinsiyet, bolum

--Öğrencilerden hangi kulüp çalışmalarına hangi bölüm öğrencilerinin kaç kişi olarak katıldığını cinsiyete göre listele
SELECT kulup_calismasi, bolum, cinsiyet, COUNT(*) AS katilan_ogrenci_sayisi
FROM ogrenci_bilgileri
GROUP BY kulup_calismasi, bolum, cinsiyet

--Kulüp çalışmasına ve bölüme göre ingilizce not ortalamasını ve not ortalamasını listele
SELECT kulup_calismasi, bolum, ROUND(AVG(ingilizce_notu),2) AS ingilizce_not_ortalamasi,
AVG(not_ortalamasi) AS ders_not_ortalamasi
FROM ogrenci_bilgileri
GROUP BY kulup_calismasi, bolum

--İngilizce notu 70'ten büyük olanların cinsiyetine göre kulüp çalışmalarına katılanların sayısını alalım
SELECT cinsiyet, kulup_calismasi, COUNT(cinsiyet) FROM ogrenci_bilgileri 
WHERE ingilizce_notu>70
GROUP BY cinsiyet, kulup_calismasi

--Kulüp ve bölüme göre öğrencilerinin not ortalaması ve ingilizce notunu ortalaması listele
SELECT kulup_calismasi, bolum, AVG (not_ortalamasi) AS ortalama_not,
ROUND(AVG(ingilizce_notu)) AS ingilizce_not_ortalamasi FROM ogrenci_bilgileri
GROUP BY kulup_calismasi, bolum

