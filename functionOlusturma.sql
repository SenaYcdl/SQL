--function olusturma
--Intelijde {} suslu parantez kullanirdik SQL(pgadmin4) ise $$ isareti kullanilir acma kapatma islemi icin 
--1. Örnek: İki parametre ile çalışıp bu parametreleri toplayarak return yapan bir fonksiyon oluşturun
Create or Replace function toplamaF(x numeric, y numeric)
returns numeric 
Language plpgsql
As 
$$
Begin

Return x+y;

End
$$

select * from toplamaF(15,25) As toplam;