/*
HAVING
GROUP BY yapıldıktan sonra filtrelemede şart koşulması durumunda kullanılır.
Yani WHERE komutu GROUP BY yapılmadan önce şart koşmada kullanılırken,
HAVING komutu GROUP BY yapıldıktan sonra şart koşulma durumunda kullanılır.
*/

CREATE TABLE ogrenci_bilgiler(
    ingilizce_notu INT not null,
	not_ortalamasi REAL not null,
	kulup_calismasi VARCHAR(50 ) not null,
	cinsiyet VARCHAR(5) not null,
	bolum VARCHAR(50 ) not null
);

INSERT INTO ogrenci_bilgiler (ingilizce_notu ,not_ortalamasi ,kulup_calismasi ,cinsiyet ,bolum)
VALUES
(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
(39, 89, 'Ebru', 'Erkek', 'Matematik'),
(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
(95, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
(39, 89, 'Ebru', 'Erkek', 'Matematik'),
(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
(39, 89, 'Ebru', 'Erkek', 'Matematik'),
(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
(95, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
(39, 89, 'Ebru', 'Erkek', 'Matematik');


SELECT * FROM ogrenci_bilgiler

--Öğrenci kulüp çalışmalarına göre ingilizce not ortalamasını bulup ingilizce not ortalaması 502nin üstünde olanları listele
SELECT kulup_calismasi, AVG(ingilizce_notu) AS ingilizce_not_ortalamasi
FROM ogrenci_bilgiler
GROUP BY kulup_calismasi
HAVING AVG(ingilizce_notu)>50

--Öğrencilerin bölüm ve not ortalamasına göre grupladıktan sonra ingilizce notu 50'den aşağı olanlari listele
SELECT bolum, not_ortalamasi, ingilizce_notu
FROM ogrenci_bilgiler
GROUP BY bolum, not_ortalamasi, ingilizce_notu
HAVING ingilizce_notu<50


/*
UNION ve UNION ALL
iki ya da daha fazla sorguda sonuçları birleştirmede kullanılır
UNION benzersiz verilerde kullanılır
UNION ALL benzerli verilerde de kullanılabilir
Sorgu birleştirmede veri türleri uyumlu olmalı
*/

--not ortalaması 60'ın üstünde olan öğrencilerin cinsiyeti ve
--not ortalaması 80'in üstünde olan öğrencilerin bölümünü tekrarsız olarak listele
SELECT not_ortalamasi, cinsiyet FROM ogrenci_bilgiler WHERE not_ortalamasi>60
UNION
SELECT not_ortalamasi, bolum FROM ogrenci_bilgiler WHERE not_ortalamasi>80

--Elektrik Mühendisliği'ndeki öğrencilerin not ortalamalarını ve
--not ortalaması 70'in üstünde olanların bölümlerini tekrarsız
--büyükten küçüğe doğru sıralayan kodu yaz
SELECT bolum, not_ortalamasi FROM ogrenci_bilgiler WHERE bolum='Elektrik Mühendisliği'
UNION 
SELECT bolum, not_ortalamasi FROM ogrenci_bilgiler WHERE not_ortalamasi>70
ORDER BY bolum DESC

/*
kulüp çalışmalarına katılanların Bilgisayar Mühendisliği öğrencisi olmayanların  ingilizce notu ortalaması ile
kulüp çalışmalarına katılanlardan Matematik bölümü öğrencisi olmayanların ingilizce notunu ortalamasını listeleyin
*/
SELECT kulup_calismasi, ROUND(AVG(ingilizce_notu)) AS ortalama 
FROM ogrenci_bilgiler WHERE bolum !='Bilgisayar Mühendisliği'
GROUP BY kulup_calismasi
UNION ALL
SELECT kulup_calismasi, ROUND(AVG(ingilizce_notu)) AS ORTALAMA 
FROM ogrenci_bilgiler WHERE bolum !='Matematik'
GROUP BY kulup_calismasi

/*
Kadınların not ortalaması, ingilizce notu ve bölümlerini
erkeklerin not ortalaması, ingilizce notu ve bölümlerini
tekrarsız olarak listele
*/
SELECT cinsiyet, not_ortalamasi, ingilizce_notu, bolum FROM ogrenci_bilgiler 
GROUP BY cinsiyet, not_ortalamasi, ingilizce_notu, bolum
HAVING cinsiyet='Kadın'
UNION
SELECT cinsiyet, not_ortalamasi, ingilizce_notu, bolum FROM ogrenci_bilgiler
GROUP BY cinsiyet, not_ortalamasi, ingilizce_notu, bolum
HAVING cinsiyet='Erkek'

/*
katıldığı kulüp çalışması 'Ebru', 'Havacılık' ve 'Maket' olan öğrencilerin
ingilizce notlarını 85'ten büyük olanları listele
*/

SELECT kulup_calismasi, ingilizce_notu FROM ogrenci_bilgiler WHERE kulup_calismasi='Ebru'
UNION ALL
SELECT kulup_calismasi, ingilizce_notu FROM ogrenci_bilgiler WHERE kulup_calismasi='Havacılık'
UNION ALL
SELECT kulup_calismasi, ingilizce_notu FROM ogrenci_bilgiler WHERE kulup_calismasi='Maket'
GROUP BY kulup_calismasi, ingilizce_notu
HAVING ingilizce_notu>85

/* ingilizce notu 15 olan öğrencilerin cinsiyet ve bölümlerini
ingilizce notu 46 olan öğrencilerin kulüp faaliyeti ve bölümlerini listeleyin
*/
SELECT ingilizce_notu, cinsiyet AS cinsiyet_kulüp, bolum FROM ogrenci_bilgiler WHERE ingilizce_notu=15
UNION ALL
SELECT ingilizce_notu,kulup_calismasi, bolum FROM ogrenci_bilgiler WHERE ingilizce_notu=46