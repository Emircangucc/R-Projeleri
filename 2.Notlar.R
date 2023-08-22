
# VEKTÖRDE BİR ELEMANI DEĞİŞTİRME/GÜNCELLEME
x <- c(12,34,56,67,89,29,42,77)
x[3] <- 55 # üçüncü eleman değiştirildi.
x

x[5] <- 88
x



# VEKTÖRDE ÇOKLU ELEMAN DEĞİŞTİRME/GÜNCELLEME
x <- c(12,34,56,67,89,29,42,77)
x[c(1,3)] <- 0 # aynı elemanı, verilen indisteki sayılarla değiştirmek
x

x <- c(12,34,56,67,89,29,42,77)
x[c(1,3)] <- c(100,1000) # birçok elemanı, verilen indisteki sayılarla değiştirmek
x

x <- c(NA,NA,NA,NA,NA,29,42,77) # NA olan verileri değiştirmek
x

x[1:5] <- 101:105 # her iki taraftaki toplam eleman adedi aynı olmalı (5=5)
x

x[c(1,2,3,4,5)] <- 101:105 # yöntemler arttırılabilir.
x



# VEKTÖRE BİR ELEMAN EKLEME
x <- c(13,45,28,56,87,33)
x

length(x)

x[7] <- 100
x



# VEKTÖRE ÇOKLU ELEMAN EKLEME
x <- c(13,45,28,56,87,33)

length(x)

x[7:10] <- 100 # aynı elemanı, verilen "yeni" indislere eklemek
x

x[15] <- 15 # arada tanımlı olmayan indisler NA değeri alırlar.
x

x[16:19] <- c(200,300,400,500) # 4 tane elemanı, tanımlanmış olan 4 indise ekliyoruz.
x



# TEMEL MATEMATİKSEL İŞLEMLER
x <- 5
y <- 3

# toplama 
x + y

# çıkartma 
x - y

# çarpma
x * y

# bölme
x/y

# mod alma
x %% 3
y %% 2

# üs alma
x <- 2
x
x ** 2
x ** 3
x ** 30
x ** 500

# kök alma
sqrt(9)
sqrt(x)



# VEKTÖREL MATEMATİKSEL İŞLEMLER
# vektöre yapılan işlem, tüm vektör elemanlarına uygulanır.

x <- c(12,13,15,10)
x + 5 # tüm elemanlar 5 ile toplanır, fakat x değişmedi!
x

x <- x+5 # şimdi x değişti
x

# aynı mantık; çıkartma, çarpma, bölme vs. için de geçerlidir.

x
x - 3
x * 2
x / 3
x %% 2
x ** 2
sqrt(x)


z <- x + 10
z

# toplamdaki iki operand da vektör ise,
# karşılıklı aynı indise sahip elemanları toplanır.
x
z
x + z  # x vektörünün 1. elemanı ile z vektörünün 1. elemanı toplanır vs...

# diğer işlemler de, aynı mantıkla yapılabilir.
x-z
x*z
x/z

# buraya kadarki örneklerde, vektörlerin eleman sayıları eşitti
# farklı eleman sayıları olan vektörlerde durum biraz değişiyor.

a <- c(1,2,3,4) # eleman sayısı: 4
b <- c(10,20)   # eleman sayısı: 2

a + b  # eleman sayısı az olan vektörde ihtiyacı kadar tur atar.

# peki birbirinin katı olmayan durumda ne olacak?

x <- c(1,2,3,4,5) # eleman sayısı: 5
y <- c(10,20)     # eleman sayısı: 2

x + y  # eleman sayıları birbirinin katı olmadığı için uyarı verir ama işlemi yapar.

# aynı mantık; çıkartma, çarpma, bölme vs. işlemleri için de geçerlidir.



# VEKTÖRDEKİ MAX VE MIN DEĞERLERİN TESPİTİ
x <- c(-3,-2,0,10,23,31,14,85)

# elemanları sayı olan vektörlerde max-min, sayısal olarak belirlenir.
max(x)
min(x)

# elemanları karakter olan vektörlerde max-min, alfabetik sıraya göre belirlenir.
x <- c('sen',"ben",'o')
max(x)
min(x)


# yeri gelmişken söyleyelim: 
# < , > , <= ve >= operatörleri de alfabetik sıralamayı dikkate alır.
x <- c("arçelik","bosch","regal","profilo","vestel")

x[x > 'b'] # a harfi ile başlayanları getirmiyor.
x[x == "vestel"]
x[x > 'regal']
x[x >= 'regal']

'zeki' > 'ali'  # neden TRUE? öğrenciye sor.
"1923" > '1453'
'1993' > 'zeki' # rakamlar < küçük harfler < büyük harfler
'0' > 'A'
'A' > 'a' # TRUE çünkü, büyük harfler BÜYÜKtür. (aynı harf için geçerli)
'A' > 'z' # 
'zEki' > 'zeki'  # ilk harfler aynı olduğu için, ikinci harfe göre sonuç belirlenir.



# VEKTÖRDEKİ ELEMANIN İNDİSİNİ BULMAK
x <- c(22,33,44,55)

x == 33  # TRUE ve FALSE'lardan oluşan bir seri çıkarıyordu.
which(x == 33) # 33 elemanının indisini döndürür.

x <- c(11,22,33,22,44,55)
which(x == 22) # x vektöründeki hangi indislerin 22 olduğunu döndürür.

# karakter vektöründe deneyelim
k <- c("beş","beşik","beşiktaş")
k[k > "beş"]

which(k > "beş")  # "beşik" ve "beşiktaş" elemanlarının indislerini döndürür.



# ARDIŞIK DEĞERLERDEN OLUŞAN VEKTÖRLER OLUŞTURMAK
# bunun için seq(...) fonksiyonunu kullanacağız.

# : karakteri ile oluşturulan yapıya benzer, bazı farklılıkları vardır.
1:10      # 1'den 10'a kadar 1'er 1'er artan değerlerde bir vektör oluşturur.
seq(1,10) # 1'den 10'a kadar 1'er 1'er artan değerlerde bir vektör oluşturur.

seq(1,10,3) # 1'den 10'a kadar 3'er 3'er artan değerlerde bir vektör oluşturur.

v <- seq(1,100,4) # 1'den 100'e kadar 4'er 4'er artan değerlerde vektör oluşturur.
v

# seq(...) fonksiyonunda parametrelerin sırasını hatırlamayabiliriz.
seq(from=1,to=10,by=3)
seq(by=3,from=1,to=10) # isimli parametre kullanınca istediğimiz sırada yazabiliriz.

seq(from=0.01,to=1.0,by=0.01)

# seq(...) ile sabit eleman sayısında vektör oluşturabiliriz.
seq(from=1, to=100, length.out=30)

# hem by=... hem length.out=... parametreleri kullanılacaksa dikkat edilmelidir!
seq(from=1, to=30, by=1, length.out=50) # mantıksızdır! sebebini öğrenciye sor.
# en iyisi, bu iki parametreden "sadece birini" kullanmaktır.



# RASTGELE DEĞERLERDEN OLUŞAN VEKTÖRLER OLUŞTURMAK
x <- c(seq(1,100,5))
x

# sample(...) fonksiyonu bir vektördeki elemanların yerlerini/indislerini 
# karıştırarak değiştirir.
sample(x) # bu işlemle x vektörü yine değişmez!

x <- sample(x) # x vektörü ancak bu atama ile değişir.
x

# sample(...) fonksiyonu tekrar tekrar çalıştırılırsa, 
# yeniden karıştırma işlemi yapılmış olur.
x <- sample(x)
x

x <- sample(x)
x

# sample(...) fonksiyonundaki replace=... parametresi TRUE olursa, 
# aynı değerler yeniden kullanılabilecek şekilde karıştırma işlemi yapılır.
# bazı değerler de hiç kullanılmayabilir.
sample(x, replace=TRUE)

# size=... parametresi ile bir vektörden 
# rastgele bir veya birden fazla eleman seçebiliriz.
x <- 1:30
x
sample(x, size=1) # her çalıştırdığımızda farklı bir elemanı döndürür.

sample(x, size=5) # rastgele çoklu eleman da seçebiliriz.

sample(x, size=40) # x vektörü 30 olduğu için 40 eleman seçemeyiz.

# fakat replace=TRUE dersek, 
# vektörde var olan eleman sayısından daha fazla eleman seçebiliriz.
sample(x, size=40, replace=TRUE)

# rastgeleliği sabitlemek
# set.seed(...) kullanıldıktan hemen sonra, 
# sample(...) fonksiyonu kullanılırsa, hep aynı rastgele değeri döndürür.
x
set.seed(42)        # parametre olarak öylesine bir sayı yazılır.
sample(x, size=1) 

set.seed(42)
sample(x, size=20)



# TEKRARLI DEĞERLERDEN OLUŞAN VEKTÖRLER OLUŞTURMAK
# Bunun için rep(...) fonksiyonunu kullanabiliriz.

x <- c(11,22,33)
rep(x, 3)       # x vektörünü 3 defa art arda dizerek döndürür.

# each=... parametresi ile her bir elemanı belirli bir değer kadar tekrarlı döndürür.
rep(x, each=3)  # x vektöründeki her eleman, 3 defa art arda döndürülür.



# VEKTÖR ELEMANLARINI SIRALAMAK
x <- c(12,3,45,26,34,79,62,21)
x

# sort(...) fonksiyonu ile bunu yapabiliriz.
sort(x) # küçükten büyüğe doğru sıralama yapar.

# decreasing=... parametresini TRUE yaparsak, büyükten küçüğe sıralama yapar.
sort(x, decreasing = T) # TRUE yerine kısaca T de yazılabiliyor.

# karakter vektöründe sıralama
y <- c("Berk", "Ali","Osman","Cemil","Kemal","Zeki")
sort(y) 
sort(y, decreasing = T)

# içinde NA değerleri olan vektörlerde sıralama işlemleri
v <- c(12,3,45,26,34,79, NA, NA)
v
sort(v)                  # NA değerlerini dikkate almadan sıralama yapar.
sort(v, decreasing = T)  # NA değerlerini dikkate almadan sıralama yapar.

# NA değerlerinin konumu
sort(v, decreasing = T, na.last=NA) # bir üstteki kullanımla aynı sonucu döndürür.
sort(v, decreasing = T, na.last=T)  # NA değerlerini sona atar.
sort(v, decreasing = T, na.last=F)  # NA değerlerini başa atar.

# NOT: 
# sort(...) fonksiyonunda index.return=... parametresi kullanımına 
# listeler konusuna geçince değineceğiz.

