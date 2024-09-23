/*
INTERSECT
iki ayrı sorgunun kesişim değerini elde etmek istersek kullanılır

EXCEPT
ilk sorguda olan ancak ikinci sorguda olmayan değeri elde etmek için kullanılır
*/

CREATE TABLE ustalar(
    isim VARCHAR(30) NOT NULL,
	meslek VARCHAR(30) NOT NULL,
	saatlik_ucret INT NOT NULL,
	ustalik_yili INT NOT NULL,
	sehir VARCHAR(30) NOT NULL
);


INSERT INTO ustalar VALUES
('Ahmet Yorgun', 'Tesisatçı', 50, 15, 'İstanbul'),
('Vural Solgun', 'Elektrikçi', 45, 10, 'İstanbul'),
('Murat Öz', 'Marangoz', 40, 8, 'Ankara'),
('Harun Sarsılmaz', 'Marangoz', 21, 7, 'İstanbul'),
('Vural Solgun', 'Marangoz', 41, 9, 'Ankara'),
('Ahmet Yorgun', 'Motorcu', 75, 17, 'Bursa'),
('Murat Öz', 'Doğalgazcı', 40, 8, 'Ankara'),
('Ahmet Yorgun', 'Doğalgazcı', 60, 12, 'İzmir'),
('Ahmet Yorgun', 'Tesisatçı', 75, 12, 'Bursa'),
('Vural Solgun', 'Elektrikçi', 59, 34, 'Ankara'),
('Harun Sarsılmaz', 'Tesisatçı', 42, 7, 'İzmir'),
('Murat Öz', 'Doğalgazcı', 34, 5, 'İzmir'),
('Harun Sarsılmaz', 'Tesisatçı', 43, 9, 'Bursa');

SELECT * FROM ustalar;

/*
ismi murat öz olanların saatlik ücretlerin ve ustalık yıllarını ve
ili izmir olanların ücretlerini ve ustalık yılların bulup
iki sorgunun kesişim kümesini listele
*/
SELECT saatlik_ucret, ustalik_yili FROM ustalar WHERE isim='Murat Öz'
INTERSECT
SELECT saatlik_ucret, ustalik_yili FROM ustalar WHERE sehir='İzmir'

/*
marangozların ustalık yılları ile şehirlerini ve
saatlik ücret 39 üzerinde olanların ustalık yılları ve şehirlerini bul
iki sorgunun kesişimini listele
*/
SELECT ustalik_yili, sehir FROM ustalar WHERE meslek='Marangoz'
INTERSECT
SELECT ustalik_yili, sehir FROM ustalar WHERE saatlik_ucret>39

/*
ustalık yılı 10 dan yukarı olanların isim ve meslekleri ile
şehri istanbul olanların isim ve mesleklerini bul
iki sorgunun kesişimini listele
*/
SELECT isim, meslek FROM ustalar WHERE ustalik_yili>10
INTERSECT
SELECT isim, meslek FROM ustalar WHERE sehir='İstanbul'

/*
ismi Harun Sarsılmaz olanların meslek ve şehir bilgilerini
şehri Bursa olanların meslek ve şehir bilgilerini bul
ilk sorguda olup ikinci sorguda olmayacak şekilde listele
*/

SELECT meslek, sehir FROM ustalar WHERE isim='Harun Sarsılmaz'
EXCEPT
SELECT meslek, sehir FROM ustalar WHERE sehir='Bursa'

/*
şehri Ankara ve İstanbul olanların isim ve meslek bilgilerini
saatlik ücreti 45'in altında olanların isim ve meslek bilgilerini
ilk sorguda olup ikinci sorguda olmayacak şekilde listele
*/

SELECT isim, meslek FROM ustalar WHERE sehir IN('Ankara', 'İstanbul')
EXCEPT
SELECT isim, meslek FROM ustalar WHERE saatlik_ucret<45

/*
mesleği marangoz olanların isim ve ustalık yılları
şehri Ankara ve İzmir olanların isim ve ustalık yılları
ilk sorguda olup ikinci sorguda olmayacak şekilde listele
*/
SELECT isim, ustalik_yili, sehir FROM ustalar WHERE meslek='Marangoz'
EXCEPT
Select isim, ustalik_yili, sehir FROM ustalar WHERE sehir= 'Ankara' OR sehir='İzmir'