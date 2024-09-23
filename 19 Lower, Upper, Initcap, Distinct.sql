/*
UPPER: Sütundaki verileri büyük harfle listeler.
LOWER: Sütundaki verileri küçük harfle listeler.
INITCAP: Sütundaki verilerin ilk harfini büyük, diğer harflerini ise küçük harfle listeler.
DISTINCT: Sütundaki verileri tekrarsız listeler.
*/

CREATE TABLE cep_telefonlari (
  marka VARCHAR(50) NOT NULL,
  model VARCHAR(100) NOT NULL
);

INSERT INTO cep_telefonlari (marka, model)
VALUES
  ('Samsung', 'Galaxy S22'),
  ('Apple', 'iPhone 13 Pro Max'),
  ('Huawei', 'P50 PRO'),
  ('Xiaomi', '12S Ultra'),
  ('Oppo', 'FIND X5 Pro'),
  ('OnePlus', '10 Pro'),
  ('Google', 'Pixel 6 Pro'),
  ('Motorola', 'Edge 30 Ultra'),
  ('Realme', 'GT Neo 3'),
  ('Vivo', 'X80 Pro'),
  ('Samsung', 'GALAXY S22 Ultra'),
  ('Apple', 'iPhone 14 Pro'),
  ('Huawei', 'P60 PRO'),
  ('Xiaomi', '13 Pro'),
  ('Oppo', 'Find X6 Pro'),
  ('OnePlus', '11 Pro'),
  ('Google', 'Pixel 7 Pro'),
  ('Motorola', 'EDGE 40 Ultra'),
  ('Realme', 'GT Neo 4');
  
--Cep telefonu markalarını büyük harfle listele
SELECT UPPER(marka) FROM cep_telefonlari;

--Cep telefonu modellerini küçük harfle listele
SELECT LOWER(model) FROM cep_telefonlari;

--Cep telefonu modellerini büyük harf, markalarını küçük harfle listele
SELECT LOWER(marka) AS Marka, UPPER(model) AS model FROM cep_telefonlari;

--Cep telefonu modellerinin ilk harfleri büyük sonrası küçük, markalarını küçük harfle listele
SELECT LOWER(marka) AS Marka, INITCAP(model)  AS model FROM cep_telefonlari;

--Cep telefonu marka ve modellerini ilk harfleri büyük sonrasi küçük olarak listele
SELECT INITCAP(marka) AS Marka, INITCAP(model) AS Model FROM cep_telefonlari;

--Cep telefonu marka ve modellerini ilk harfleri büyük sonrasi küçük olarak listele
SELECT INITCAP(marka) || ' - ' || INITCAP(model) AS Telefonlar FROM cep_telefonlari;
-- || ' - ' || -> ikili yapıdan tekli yapıya yarıyor. Tek sütuna düşürmeye yarıyor.

--Farklı tüm cep telefon markalarını listele
SELECT DISTINCT(marka) FROM cep_telefonlari;

--Farklı tüm cep telefonu modellerini büyük harf ile listele
SELECT DISTINCT UPPER (model) FROM cep_telefonlari;