create table ogrenci
(student_number int,
 student_name varchar (50),
 student_age int,
 course varchar(15)
);
insert into ogrenci values (1,'Nurullah',30,'Futbol');
insert into ogrenci values (2,'Müzeyyen',25,'Yüzme');
insert into ogrenci values (3,'Furkan',27,'Tenis');
insert into ogrenci values (4,'Hayriye',28,'Basketbol');
insert into ogrenci values (5,'Güneş',1,'Futbol');
insert into ogrenci values (6,'Emine',51,'Tenis');
insert into ogrenci values (7,'Gülay',50,'Tenis');
insert into ogrenci values (8,'Mehmet',56,'Basketbol');
insert into ogrenci values (9,'Serdar',56,'Yüzme');
insert into ogrenci values (10,'Ahmet',18,'Yüzme');
select * from ogrenci
--ogrenci tablosu oluşturuldu.
create table ogretmen
(teacher_number int,
 teacher_name varchar(30),
 salary int,
 lesson varchar(30)
);
insert into ogretmen values (121,'Abidin',4000,'Futbol');
insert into ogretmen values (122,'Ahmet',3000,'Basketbol');
insert into ogretmen values (123,'Deniz',3500,'Tenis');
insert into ogretmen values (124,'Cengiz',2500,'Yüzme');
select * from ogretmen
--öğretmen table'ı oluşturuldu.
create table kurs_ucreti
(course varchar(30),
 fee int
);
insert into kurs_ucreti values ('Futbol',200);
insert into kurs_ucreti values ('Yüzme',400);
insert into kurs_ucreti values ('Basketbol',300);
insert into kurs_ucreti values ('Tenis',350);
select * from kurs_ucreti
--kurs ücreti tablosu oluşturuldu.
--1)yuzme kursuna gelen ogrencilerin tum bilgilerini listele
select * from ogrenci
where course='Yüzme'
--2)tenis kursuna gelen öğrenci yaş ortalamasını listele.
SELECT AVG(student_age) AS tenis_yas_ortalama
FROM ogrenci
WHERE course Like 'Tenis'

--3)student_number'ı 5'den büyük olduğu student_name,course değerlerini çağırın.JDBC ILE YAP


--4)Ismi G harfi ile baslayan student_name listele


--5)course ismi L harfi ile biten course ları listele


--6)student_name 2. harfi e olan isimleri listeleyiniz
--LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
--ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir



-- 7)İçerisinde 'ol' veya 'ut' bulunan course listeleyiniz
-- Veya işlemi için | karakteri kullanılır
--SIMILAR TO ile



--8)'me' veya 'nu' ile başlayan isimleri listeleyeniz
--SIMILAR TO ile



--9)kurs_ucreti tablosundaki fee sutununa 200 dan büyük rakam girilebilsin
--CHECK kısıtlaması ile tablodaki istediğimiz sutunu sınırlandırabiliriz
--yukarıdakı sını 200 oldugu icin bunu eklemeyecek




--10)student_name emine olan ogrencinin tüm bilgilerini getirin




--11)ogrenci tablosuna cinsiyet Varchar(20) seklinde yeni sutun ekleyiniz




--12) ogrenci tablosundaki 'serdar' değerlerini 'mustafa' olarak güncelleyiniz.JDBC ILE YAP



--13)student_age değeri en düşük olan satırın tüm değerlerini çağırın.JDBC ILE YAP

