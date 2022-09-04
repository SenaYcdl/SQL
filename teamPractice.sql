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

--yuzme kursuna gelen ogrencilerin tum bilgilerini listele
select * from ogrenci
where course='Yüzme'

--Tenis kursuna gelen öğrenci yaş ortalamasını listele.
SELECT AVG(student_age) AS tenis_yas_ortalama
FROM ogrenci
WHERE course Like 'Tenis'

--öğretmenler tablosundan en yüksek 2. maaşı listele.
select salary
from ogretmen
order by salary desc
offset 1 row
fetch next 1 row only
--2. yol
select max(salary) as max_Salary
from ogretmen
where salary < (select max(salary)from ogretmen)