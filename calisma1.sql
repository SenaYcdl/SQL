CREATE TABLE mart
(
    urun_id int,
    musteri_isim varchar(50),
    urun_isim varchar(50),
	maas int
);
CREATE TABLE nisan
(
    urun_id int ,
    musteri_isim varchar(50),
    urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda' ,3000);
INSERT INTO mart VALUES (20,null,  'Toyota',2000);
INSERT INTO mart VALUES (30, 'Amy', 'Ford',5000);
INSERT INTO mart VALUES (20, 'Mark', 'Toyota',5000);
INSERT INTO mart VALUES (10, 'Adam', 'Honda',6000);
INSERT INTO mart VALUES (40, 'John', 'Hyundai',2500);
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota',8000);


INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart

select * from nisan


--Mart ve nisan ayında aynı ürün_id ile satılan ürünlerin ürün_id lerini listeleyin
select urun_id from nisan where exists (select urun_id from mart where mart.urun_id=nisan.urun_id)


----Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan where exists 
( select musteri_isim from mart where mart.urun_isim=nisan.urun_isim )


----Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve   bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where not exists ( select urun_isim from mart where mart.urun_isim=nisan.urun_isim )


---null olmayanları listeleyelim
select*from mart where musteri_isim is not null


--null olan
select*from mart where musteri_isim is null


--isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
Update mart set musteri_isim='NO NAME'
where musteri_isim is null
update mart set musteri_isim=null
where musteri_isim = 'NO NAME'

--henuz isim girilmedi yapın null
update mart set musteri_isim = coalesce (musteri_isim, 'isim girilmedi')
select*from mart

----mart tablosundan ilk 5 veriyi listeleyiniz
select*from mart limit 5


----ilk iki veriden sonra 5 veriyi listeleyiniz
select*from mart limit 5 offset 2


-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select*from mart where urun_id>5 limit 2



--  urunid en yüksek 3 kişinin bilgilerini listeleyiniz
select*from mart order by urun_id desc limit 3 


-- en yüksek maaş değerini listeleyiniz
select max(maas)from mart


--maaşların toplamını listeleyiniz
select sum(maas)from mart


--mart tablosundaki maas ortalamalını listeleyiniz
select avg(maas)from mart
select round(avg(maas),3)from mart


--en düşük maası listeleyiniz
select min(maas)from mart


--En düşük ikinci maas değerini çağırın.
select min(maas) as ikinci from mart where maas>(select min(maas)from mart)


--musteri isim listele
select musteri_isim from mart group by musteri_isim


-- urun ismine göre ortalama maaşları listeleyiniz
select urun_isim,round (avg(maas)) from mart group by urun_isim


-- urun id ve musteri ismine göre gruplayarak sorgulayın
select urun_id,musteri_isim from mart group by urun_id,musteri_isim


