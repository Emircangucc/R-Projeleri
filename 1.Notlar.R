
# ÇALIŞMA ALANININ (WORKSPACE) AYARLANMASI
getwd() # tanımlı olan çalışma alanım (workspace'im)
setwd("C:/Users/Zeki/Desktop/R Dersleri")
getwd()



# R YARDIM 
?getwd # yardım alınmak istenen komutun başına ? konularak çalıştırılır.



# DÖRT İŞLEM VE MOD ALMAK
5 +   3   # istediğimiz kadar boşluk olsun, yine de çalışır.
5-2
5*7
10/2
11%%2



# YORUMLAR
# Hashtag işaretli ile oluşturulur.
3 + 7 # Bu bir yorumdur.
5 - 1 # Yorum satırları kod olarak çalıştırılmaz!



# DEĞİŞKEN OLUŞTURMAK
x = 5
x

x <- 7   # normalde <- kullanılır, sadece fonksiyon parametrelerinde = kullanılır.
x



# NOKTALI VİRGÜL KULLANIMI
x <- 3
y <- 5
x;y   # ";" sonrası, yeni bir komut olduğu varsayılır.



# ATAMA İŞLEMLERİNDE HATALAR
h <- 10 # sağdan sola doğru atama yapılır.
h

g <- 5 # hatasız
10 <- g # hatalı kullanım

u # daha önceden tanımlanmadığı için hata verir.
y = 10
y



# HAZIR TANIMLI YAPILAR
1 == 3 # FALSE yerine F de kullanılabilir.
3 == 3 # TRUE yerine T de kullanılabilir.

5 <  2
7>5
3 <= 5 # < =
7 >= 7 # > =
3 != 6 # ! =

1:10 # 1den 10a kadar sayıları belirten tanımlı bir yapı
-20:-28 # negatif olarak da kullanılabilir.



# VEKTÖRLER
# Vektörü excel tablosundaki sütunlara benzetebiliriz.
# Vektör oluşturmak için c(...) fonksiyonu kullanılır.

c(1,2,3,4) # herhangi bir değişkene kaydedilmediği için sadece konsola yazılır.

z <- c(1,2,3,4)
z



# KARAKTER VEKTÖRÜ
# Yukarıda nümerik bir vektör oluşturduk, karakter vektör de oluşturabiliriz.
k <- c("A","B",'C') # tek veya çift tırnak fark etmez.
k

# Bir vektörde hem nümerik, hem karakter verileri bulunamaz!
x <- c(1,2,"Üç","Dört") # vektör elemanlarından biri karakterse, hepsi karakter olur.
x # hepsi karaktere dönüştü. Sebebi nedir?

# y <- c(13,4,35,67, ,28) # elemanlar arasında boşluk bırakılamaz, hata oluşur.



# VEKTÖRDEN BİR ELEMAN SEÇMEK
# Vektör indisleri 0'dan değil, 1'den başlar.
# Vektörden eleman seçimi köşeli parantez içerisinde yapılır.
x <- c(3,7,11,13,16,19)
x[1]  # vektörün birinci elemanını döndürür.
x[5]  # vektörün beşinci elemanını döndürür.

x[0] # hiçbir eleman döndürülmez!



# VEKTÖRDEN ÇOKLU ELEMAN SEÇİMİ
1:3
c(1,2,3)
c(1:3)

x[1:3]        # 1. 2. ve 3. indise sahip elemanlar: 3 7 11
x[c(1,2,3)]   # 1. 2. ve 3. indise sahip elemanlar: 3 7 11
x[c(1:3)]     # 1. 2. ve 3. indise sahip elemanlar: 3 7 11
x

# hatalı kullanımlar
# x[1,2,3]
# x[1 2 3]

# c(...) fonksiyonunun, f:t yapısından farkı
x <- c(11,23,45,56,78,15,6,77,83,90)
x[1:4]
x[c(3,5,6,10)]

x <- c("İstanbul","Ankara","İzmir","Adana","Konya","Sivas","Bursa")
x[1:2]
x[c(3,5,7)]

# Elemanları seçmek, vektörü değiştirmez!
# Ancak seçilen kısım kaydedilirse, eski vektör değişmiş olur.
x[1:4]
x

x <- x[1:4]  # bu durumda, x vektörü seçilen elemanlar ile değişir.
x



# VEKTÖRÜN TOPLAM ELEMAN SAYISINI BULMAK
length(x)



# VEKTÖRDE OLMAYAN ELEMANI SEÇMEK
# Vektörde olmayan bir eleman seçilirse/çağırılırsa, NA değeri döner.
x[100]
x[5:10]



# VEKTÖRDEN BELLİ ŞARTLARA GÖRE ELEMAN SEÇMEK
x <- c(11,22,33,44,55,66,77,88,99)

# Aşağıdaki kullanımlarda, vektör içindeki tüm değerler dolaşılıyor.
x > 77   # TRUE ve FALSE değerlerinden oluşan bir seri döndürür.
x < 77   
x <= 77
x >= 77
x == 33
x != 33

# Yukarıda TRUE ve FALSE değerlerinden oluşan seriyi, 
# çoklu eleman seçme işleminde kullanabiliriz.

x[x>77] # 77'den büyük değerleri döndürür.
x[x != 33] # 33 hariç hepsini döndürür.



# VEKTÖRDEN BİR ELEMANI ÇIKARTMAK
x <- c(4,5,6,7,8,9)
x

x[-1] # birinci eleman haricinde diğer elemanları seçer. (sadece gösterim yapılır)
# x vektörü değişmez!!!
x

# birinci elemanı çıkartmak
x <- x[-1]
x

# üçüncü elemanı çıkartmak
x <- x[-3]
x



# VEKTÖRDEN ÇOKLU ELEMAN ÇIKARTMA
x <- c(23,45,67,89,91)
x

x[-c(1,2,3)] # sadece bunu yazmak vektörü değiştirmez!
x

# 1. yöntem
x <- x[-c(1,2,3)] # yeniden setlemek gerekir.
x

# 2. yöntem
x <- c(23,45,67,89,91)
x <- x[c(-1,-2,-3)]
x

# 3. yöntem
x <- c(23,45,67,89,91)
cikart <- c(1,2,3)  # cikart = 1 2 3
x <- x[-cikart]
x

# 4. yöntem
x <- c(23,45,67,89,91)
cikart <- c(-1,-2,-3)  # cikart = -1 -2 -3
x <- x[cikart]
x

# 5. yöntem
x <- c(23,45,67,89,91)
sirali <- 1:3
x <- x[-sirali]

# 6. yöntem
x <- c(23,45,67,89,91)
sirali <- -1:-3
x <- x[sirali]
x

# 7. ve 8. yöntemler
x <- c(23,45,67,89,91)
x <- x[-c(1:3)]
x

x <- c(23,45,67,89,91)
x <- x[c(-1:-3)]
x


# NOT: Bu farklı yöntemler sadece "eleman çıkartmada" değil,
# ekleme ve değiştirme işlemlerinde de kullanılabilir.


