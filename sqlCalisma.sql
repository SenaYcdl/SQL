 --   1) FULL JOIN:  Tablodaki tum sonuclari gosterir
  --  2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
  --  3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
  --  4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir
  
  CREATE TABLE company (
        company_id INT,
        name_id VARCHAR(20),
	   name VARCHAR(50)
   );
    
    INSERT INTO company VALUES(100, 'Toyota','John Walker');
    INSERT INTO company VALUES(101, 'Ford','Brad Pitt');
    INSERT INTO company VALUES(101, 'Ford','Mark Stone');
    INSERT INTO company VALUES(103, 'Hyundai','Julia Roberts');
	INSERT INTO company VALUES(104, 'Honda','Kate Moss');
	INSERT INTO company VALUES(106, 'Ford','Katy Moss');
	
CREATE TABLE delivery(
delivery_id INT,
company_id INT,
salary INT
);

INSERT INTO delivery VALUES(11,101,3000);
INSERT INTO delivery VALUES(22,102,2000);
INSERT INTO delivery VALUES(33,103,1500);
INSERT INTO delivery VALUES(44,104,5500);
INSERT INTO delivery VALUES(55,105,6500);


SELECT * FROM delivery;


SELECT * FROM company;


--1)company ve delivery adındaki tablolarda yer alan company_id,
--delivery_id ve salary listeleyen bir sorgu yaziniz.
select mc.company_id,o.delivery_id,salary from company mc inner join delivery o
on mc.company_id=o.company_id



--2)company table'ındaki company_id ler için delivery_id ve salary değerlerini çağırın.
select mc.company_id,
o.delivery_id,
o.salary
from company mc left join delivery o
on mc.company_id=o.company_id




--3)delivery table'ındaki company'ler için company_id,delivery_id  ve salary değerlerini çağırın.
--Right Join’de ikinci tablodaki tum record’lar gosterilir.
--Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar 
--icin gosterilir ancak ortak 
--olmayan datalar icin o kisimlar bos kalir
select mc.company_id,o.delivery_id,o.salary
from company mc right join delivery o
on mc.company_id=o.company_id



--4)İki table'dan da company_id, delivery_id ve salary değerlerini çağırın.
select mc.company_id,o.delivery_id,o.salary
from delivery o full join company mc
on mc.company_id=o.company_id



--5)Toplam salary değeri 2500 üzeri olan her bir delivery_id için salary toplamını bulun.
--group by dan sonra where kullanilmaz, having kullanilir
select delivery_id,sum(salary)as total_salary from delivery
group by delivery_id having sum(salary)>2500

--6)Her bir delivery_id için değeri 2000'den fazla olan minimum salary değerlerini bulun
select delivery_id,min(salary)as min_salary from delivery
group by delivery_id having min(salary)>2000

--7)company den Tekrarsız name_id çağırın.
select distinct name_id from company


--8)Name değerlerini name_id kelime uzunluklarına göre sıralayın.
select name,name_id from company
order by length(name_id)


--9)Tüm name ve name_id değerlerini aynı 
--sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
--concat birden fazla sutun veya string degerini birlestirmek icin kullanilir
select concat(name, ' ', name_id) as name_table from company
order by length(concat(name,name_id))


--10)company_id 102'den yüksek olan name_id değerlerini ve company_id 104 küçük olan name değerlerinin hepsini bulun.
select name_id as "name and name_id",company_id from company
where company_id between 102 and 104
union 
select name,company_id from company
where company_id between 102 and 104

select*from company

--11)Iki Tabloda company_id’si ayni olanlarin name, delivery_id ve name_id ile yeni 
--bir tablo olusturun
select company.company_id,delivery.delivery_id , company.name_id,company.name
from company inner join delivery
on company.company_id=delivery.company_id 
--Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali

--12)Iki Tabloda company_id’si ayni olanlarin salary ile getirirn
select company.company_id,delivery.company_id,delivery.salary
from delivery left join company
on company.company_id=delivery.company_id

--Left Join’de ilk tablodaki tum record’lar gosterilir.
--Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar 
--icin gosterilir ancak ortak olmayan 
--datalar icin o kisimlar bos kalir
--Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz




--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. 
--Unique(tekrarsız) recordları verir.
--13)company_id 105'den az ve ford'da çalışmayan name değerlerini bulun
select name,company_id,name_id from company
where company_id<105
except
select name,company_id,name_id from company where name_id=('Ford')

--14)company_id 104'den az olan ve name_id  
--Ford olan name değerlerini bulun.
--INTERSECT Operator: İki sorgu
--(query) sonucunun ortak(common) değerlerini verir.
select name,company_id,name_id from company
where company_id<104
intersect 
select name,company_id,name_id from company 
where name_id=('Ford')





	