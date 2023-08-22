
# İSTATİSTİKSEL İŞLEMLER

x <- c(10,20,30,40)

# Toplam eleman sayısı
length(x)


# Tüm elemanların toplamının bulunması
toplam <- x[1] + x[2] + x[3] + x[4]
toplam  # uzun yoldan toplam hesabı

# vektör içindeki elemanların toplamı
sum(x)    # sum(...) ile toplam hesabı

?sum # sum fonksiyonunun nasıl kullanıldığıyla ilgili bilgi

sum(1,2,3,4)

sum(1:2, 3:5)

sum(1,2,NA,3,4,NA)  # na.rm = FALSE olduğu için, NA değerleri hatalı sonuç çıkartır.

sum(1,2,NA,3,4,NA, na.rm = T)  # na.rm = T olduğu için, NA değerleri yokmuş gibi işlem yapılır.


# Ortalama
ortalama <- toplam / length(x)
ortalama  # uzun yoldan ortalama hesabı

?mean     # mean(...) ile ortalama hesabı

mean(1:3) 
mean(x)   

y <- c(1,2,NA,3,NA,4)
mean(y)   # na.rm = FALSE olduğu için, NA değerleri hatalı sonuç çıkartır.

mean(y, na.rm=TRUE) # NA değerleri yokmuş gibi işlem yapılır.


# Standart Sapma
?sd

z <- c(10,20,30)
sd(z)

sd(c(1,NA,3,NA,4), na.rm=T) # NA değerleri yokmuş gibi işlem yapılır.


# Varyans
?var

t <- c(1,3,5,7)
sd(t)
sd(t)**2

var(t)

var(c(1,2,NA,4,5,NA,7,9)) # hatalı kullanım
var(c(1,2,NA,4,5,NA,7,9) , na.rm = T) # NA değerleri hesaba dahil edilmez!


# Değişim Aralığı
x <- c(1,5,10,20,45,80,93)
max(x) - min(x)

range(x)   # bir vektördeki (veya serideki) 
           # min ve max değerleri birlikte elde etmek için kullanılır.

r <- range(x)
r[2] - r[1]


# Çeyreklikler
x <- c(1,3,8,14,23,67,98)
quantile(x)

quantile(x, probs = c(0.25, 0.50, 0.75))      # özellikle belirli çeyreklikleri almak istiyoruz.
q <- quantile(x, probs = c(0.25, 0.50, 0.75))


# aykırı değer (uç değer) hesabı (örnek 1)
x1 <- c(13,25,38,72,109)
x1

q <- quantile(x1, probs=c(0.25, 0.5, 0.75), names=F)  # names=F yapınca etiketler kaldırılmış olur.
q                   # 1., 2. ve 3. çeyreklikler

iqr <- q[3] - q[1]  # çeyrekler açıklığı
iqr

z <- 1.5 * iqr      # 1. çeyrek öncesini ve 3. çeyrek sonrasını hesaplamak için kullanılacak.
z

maksimum <- q[3] + z  # verilerimizdeki bir değer, maksimum bu değer olmalı
minimum <- q[1] - z   # verilerimizdeki bir değer, minimum bu değer olmalı

minimum;maksimum      
# x1'deki değerlerin dağılımına göre, -45.5'tan az ve
# 142.5'tan büyük değerler, aykırı değer sayılır. 
# fakat vektörde bu değerler olmadığı için, vektördeki değerlerin
# HİÇBİRİSİ AYKIRI DEĞER DEĞİLdir.


# aykırı değer (uç değer) hesabı (örnek 2)
x2 <- c(3,18,35,38,62,99,256,980)
x2

q <- quantile(x2, probs=c(0.25, 0.5, 0.75), names=F) 
q

iqr <- q[3] - q[1] # çeyrekler açıklığı
iqr

z <- 1.5 * iqr
z

maksimum <- q[3] + z  # verilerimizdeki bir değer, maksimum bu değer olmalı
minimum <- q[1] - z   # verilerimizdeki bir değer, minimum bu değer olmalı

minimum;maksimum 
# x2'deki değerlerin dağılımına göre, -130.5'tan az ve
# 299.5'tan fazla olan değerler, aykırı gözlem olarak tespit edilir.

# bulunan aykırı değerleri yazdıralım.
x2[x2 < -130.5] # herhangi bir değer bulunamaz, bu değerden düşük bir değer yoktur.
x2[x2 > 299.5]  # x2 vektöründeki 980 değeri, aykırı değer olarak tespit edildi.


# farklı değerler ve frekans tablosu oluşturmak
x <- c(1,3,2,1,1,4,5,6,4)
unique(x)       # sadece farklı değerleri elde etmemizi sağlar.

table(x)        # frekans tablosunu oluşturmamızı sağlar.
t <- table(x)   # yani hangi değerden kaç tane olduğunu görebilmemizi sağlar.
t

names(t)        # frekans tablosundaki değerlerin isimlerini alabilmemizi sağlar.


# tablo elemanlarını ayrı ayrı seçmek
t[1]
t[[1]]
t["1"]
t[["1"]]

# yukarıdaki örnekleri şimdi de
# karakter verileriyle yapalım.
y <- c("istanbul","ankara","izmir","izmir","izmir")
y

unique(y)
table(y)
t <- table(y)
t

t[[3]]
t[["izmir"]]

names(t)



#KAYIP DEĞERLER İLE İLGİLİ İŞLEMLER

# unique(...) , table(...) ve names(...) ile ilgili dikkat edilmesi gerekenler
z <- c(1,1,2,NA,NA,3,3,2,1,5)
z

unique(z)       # NA değeri farklı bir değer olarak görülür.
table(z)        # fakat frekans tablosunda yer almaz!
names(table(z)) # dolayısıyla, isimler listesinde de yer alamaz!
                # o yüzden önce NA değerleri temizlemek, 
                # table(...) veya names(...)'i daha sonra kullanmak gerekir. 
                # (kullanılması gerekiyorsa)


# kayıp değerleri tespit etmek
# is.na(...) ile bir vektördeki kayıp değerler tespit edilebilir.

x <- c(1,2,3,NA,5,NA,6)
is.na(x)            # kayıp olan değerler, NA olarak döndürülür.

# kayıp değerlerin hangi indislerde olduğunu bulmak
which(is.na(x))  # 4. ve 6. değer NA olduğu için 4 6 değerleri döndürülür.

# kayıp değer var mı? yok mu? diye kontol etmek
# bunun için any(...) fonksiyonu kullanılır.
any(is.na(c(1,2,3))) # parametre olarak verilen vektörde, hiç NA değeri yok
                     # o yüzden FALSE döndürür.

any(is.na(c(NA,1,2,NA,5))) # parametredeki vektörde NA değeri var
                           # o yüzden TRUE döndürür.

# kayıp değerleri tek bir değerle doldurmak
k <- c(1,2,NA,5,NA,NA,7,NA,9)
k

is.na(k)
k[is.na(k)] 

k[is.na(k)] <- 0  # k vektörü içindeki tüm NA değerleri 0 yapıldı.
k


# KORELASYON ve KOVARYANS HESABI
install.packages("lsa")  # bu paket kurulu ise, yeniden bu satırı çalıştırmaya gerek yoktur.
library("lsa")

x <- c(1,1,2,2,0,1)
y <- c(1,1,1,1,2,1)

cor(x, y)  # x ile y arasındaki korelasyon değerini döndürür.
cov(x, y)  # x ile y arasındaki kovaryans değerini döndürür.



# YUVARLAMA İŞLEMLERİ
r = 3.14
round(r)   # en yakın tam sayıyı (yani 3'ü) döndürür.

r=3.5
round(r)   # yarıyı geçtikten sonra, bir üst tam sayıyı (yani 4'ü) döndürür.

r=3.5678
round(r,1) # ikinci parametre, ondalık kısmın, kaç basamak olacağını belirtir.
round(r,3) # ondalık kısımda ayrıca yuvarlama işlemi yapılır.

r=3.01
ceiling(r) # tüm ondalıklı sayıları SONRAKİ tam sayıya (yani 4'e) yuvarlar.
floor(r)   # tüm ondalıklı sayıları ÖNCEKİ tam sayıya (yani 3'e) yuvarlar.



# YAZDIRMA İŞLEMLERİ
# print(...), cat(...) ve paste(...) fonksiyonlarının kullanımı

x = 3
print(x) # konsola x'in değerini yazdırır. 
         # print(...) fonksiyonu sadece bir nesne yazdırabilir.

y = 4
print(x,y) # sadece x'i yazdırır. y yazdırılmaz!

cat(x,y)   # cat fonksiyonu ile birçok nesne yazdırılabilir.
cat(x, " = ", y)
cat(x,y,10,20,'A')

cat('\n',x,'\n',y,'\n',5) # \n ile alt satıra yazdırma işlemi yapılabilir.

a <- print(x) 
a              # değişkene değer ataması yapılabilir.

b <- cat(x,y) 
b              # değişkene değer ataması yapılamaz! NULL değer döndürür.


# paste(...) fonksiyonu ile 
# hem birçok nesneyi yazdırabilir, 
# hem de değişkene değer ataması yapabiliriz.
paste(x,y,5,10,"a","b")

p <- paste(x,y,5,10,"a","b")  # tüm nesneleri tek bir string ifade gibi birleştirir.
p

paste(x,y)
paste0(x,y)     # paste(...)'in otomatik eklediği boşlukların, eklenmemesini sağlar.
paste(x,'\n',y) # paste(...) ile alt satıra geçiş yapılamaz!



# IF-ELSE

if (5 == 4) {
  "Doğru"
} else {
  print("Yanlış")
}

# AND ve OR operatörlerinin kullanımı
x = 5; y = 3

if (x == 5 & y == 4) {
  print("Tamam")
} else {
  print("Tamam değil!")
}

x;y

if (x == 5 | y == 4) {
  print("Tamam")
}



# DÖNGÜLER
# for döngüsü

for (i in 1:10) {
  print(i)
}

x = ""
for (i in 1:10) {
  # x <- cat(x,i) # hatalı kullanım, çünkü atama işlemi yapılamaz!
  x <- paste(x,i)
}

print(x)


# vektörlerde gezinme
v <- c(11,22,33,44,55)
v

for (i in v) {
  print(i)    
}

for (i in 1:length(v)) {
  print(i)
  print(v[i])
}


# while döngüsü
i = 1
while (i < 10) {
  print(i)
  i = i + 1
}

# döngüden çıkma komutu: break

i = 1
while (i < 10) {
  if (i == 6) { 
    break
  } else {
    print(i)
  }
  
  i = i + 1
}


# iç içe döngüler de, 
# diğer programlama dillerindeki mantıkla çalışır.


# FONKSİYONLAR
# R dilinde fonksiyonlar, değişkene atama yapar gibi oluşturulur.

toplama <- function(x, y) {
  return(x + y)
}

toplama(3, 5)
toplama(x=3, y=6)    # dilersek, fonksiyonun parametrelerini de ayrıca belirtebiliriz.
toplama(y=10, x=20)  # parametrelerin isimlerini belirtirsek, dilediğimiz sırada yazabiliriz.


# fonksiyon içinde (= ve <- ile ) tanımlanan değişkenler, 
# fonksiyon dışında çalışmazlar!

deneme <- function() {
  test1 = 3
  test2 <- 5
  
  return(test1 + test2)
}

deneme()
test1;test2 # bu değişkenler, sadece deneme(...) fonksiyonunda çalışır.

# bir değişkenin her yerde çalışabilmesi için
# global değişken olarak oluşturulması gerekir.
# global değişken ataması yapmak için <<- operatörü kullanılır.

dene <- function() {
  test3 <<- 55
  test4 <<- 66
  
  return(test3 + test4)
}

dene()
test3 # <<- operatörü ile oluşturulduğu için, fonksiyon içinde ve dışında çalışır.
test4 # <<- operatörü ile oluşturulduğu için, fonksiyon içinde ve dışında çalışır.



# TÜR DÖNÜŞÜMLERİ
# numeric => character
x <- 3
x
class(x)    # class(...) fonksiyonu ile değişkenin veri türü sorgulanabilir.

x <- as.character(x)
x
class(x)


# character => numeric
y <- "3"
y
class(y)


y <- as.numeric(y)
y
class(y)

z <- "a"
z <- as.numeric(z) # nümerik olmayan bir karakter, sayıya çevrilemez!
z                  # hata verir.



# TÜR SORGULAMA KOMUTLARI
# is.*

x = 3
is.numeric(x)    # x'in nümerik olup-olmadığını sorgular.

y = "a"
is.character(y)  # y'nin karakter olup-olmadığını sorgular.

m <- matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)  # m'nin matris olup-olmadığını sorgular.
is.matrix(m)

n = NA
is.na(n) # n'nin NA (not available) olup-olmadığını sorgular.

n = NULL
is.null(n) # n'nin NULL olup-olmadığını sorgular.



# KULLANICIDAN VERİ ALMAK (INPUT)
# readline(...) fonksiyonu ile kullanıcıdan veri alınabilir.

?readline

# prompt=... parametresi ile konsola yazı yazıdırılır.

input <- readline(prompt = "lütfen bir sayı giriniz: ")
input

class(input) # kullanıcıdan alınan veri her zaman "character" olur.
             # matematiksel işlemlerde kullanılacaksa, tür dönüşümü yapılması gerekir.


