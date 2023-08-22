
# DATAFRAME
# Excel veri tabloları gibi, verileri kontrol etmemizi sağlayan yapılardır.
# Matrislere çok benzerler. Matrislerde sütunlar, sayıyla ifade edilirken,
# DataFrame'lerde isimle ifade edilebilirler ve birçok açıdan matrislerden farkı vardır.
# Ayrıca vektör, liste ve matrislerin birçok özelliğini bir arada barındırırlar.

x <- c(1,2,3,4,5)
y <- c("İstanbul","Ankara","İzmir","Bursa","Konya")
z <- c(100,80,91,72,54)

df <- data.frame(x,y,z)
df

# dataframe'de daha şık bir görünüm için 
# View(...) fonksiyonu kullanılabilir.
View(df)

# DataFrame içerisinde verilen vektörlerin eleman sayıları eşit olmalıdır.
# aksi halde hata meydana gelir.

t <- c(10,20,30,40,50,60,70) # diğer vektörlerden daha fazla elemanı var.
df2 <- data.frame(x,y,z,t)   # hata meydana gelir.



# DATAFRAME SÜTUNLARINI İSİMLENDİRMEK
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

View(df)



# DATAFRAME'DEN ELEMAN SEÇMEK
# Matrislerde eleman seçerken kullanılan yöntemler, burada da kullanılabilir.
df
df[1,2] # 1. satır, 2. sütun elemanını seçmek

# sütun seçmek

# hepsi ikinci sütunu seçme işlemi yapar 
# ama dönen verilerin türleri farklıdır.

df[ , 2]      # vektör verisi döndürür. (bu yöntemi matriste kullanmıştık)
df$Şehir      # vektör verisi döndürür. ($ operatörünü listede kullanmıştık)
df[['Şehir']] # vektör verisi döndürür. (çift köşeli parantezi listede kullanmıştık)

df['Şehir']   # data.frame verisi döndürür.
df[2]         # data.frame verisi döndürür. 

# virgüllü yapı kullanılmıyorsa, ör: df[satır, sütun] gibi...
# kesinlikle "sütun işlemi" yapılıyor demektir.

# üstteki kullanımların hangi tipte veri döndürdüğünü 
# class(...) fonksiyonu ile kontrol edebiliriz.

class(c('a','b')) # vektör (character, numeric vs.)
class(df)         # data.frame

df[,3]        # vektör verisi
df[,2:3]      # data.frame verisi
df[,c(1,2)]   # data.frame verisi
df[c(1,2)]    # data.frame verisi

# satır seçmek
df[3,]        # dataframe içindeki 3. satırı döndürür.
df[2:4,]      # dataframe içindeki 2., 3. ve 4. satırı döndürür.
df[c(1,3),]   # dataframe içindeki 1. ve 3. satırı döndürür.

# NOT: seçme işlemlerinin hiçbirisi dataframe'i değiştirmez, 
# ekstra atama yapılması gerekir.

df <- df[3,] # şimdi df değişir.
df



# DATAFRAME'DEN SATIR/SÜTUN ÇIKARTMAK
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

# tek sütun çıkartmak
df[-1]         # 1. sütunu çıkartır. df değişmez!
df[,-1]        # 1. sütunu çıkartır. df değişmez!

df[1] <- NULL  # 1. sütunu çıkartır. df değişir.
df

# df değiştiği için, yeniden oluşturalım.
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

df['ID'] <- NULL    # 1. sütunu çıkartır. df değişir.
df

df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

# çoklu sütun çıkartmak
df[-c(1,3)]           # 1. ve 3. sütunları çıkartır, df değişmez.
df[ , -c(1,3)]        # 1. ve 3. sütunları çıkartır, df değişmez, sonucu vektördür.

df[c('ID','Puan')] <- NULL  # df değişir.
df

# satır çıkartmak
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

df[-4,]       # 4. satırı çıkartır, df değişmez!
df[-c(4,5),]  # 4. ve 5. satırı çıkartır, df değişmez!
df[-2:-4,]    # 2.,3. ve 4. satıtı çıkartır, df değişmez!

df <- df[-4,] # 4. satırı çıkartır, df değişir. 
df



# DATAFRAME'DEKİ ELEMANIN DEĞERİNİ DEĞİŞTİRMEK
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

df[1,3] <- 80       # 1. satır 3. sütundaki elemanın değeri değişir.
df

df[3] <- 91         # 3. sütunun tüm elemanlarının değeri değişir.
df

df[c(3,4), 3] <- 0  # 3. sütunun, 3. ve 4. satırları değişir.
df

df[2, c(1,3)] <- 1  # 2. satırın, 1. ve 3. sütunarı değişir.
df

df[c(3,4), 3] <- c(111,333)  # 3. sütunun, 3. ve 4. satırları değişir.
df



#DATAFRAME'E YENİ SATIR/SÜTUN EKLEMEK
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

# sütun eklemek
# 1. yöntem
df <- cbind(df, "Yeni" = c(11,22,33,44,55))
df

# 2. yöntem
df$Yeni2 <- c(10,20,30,40,50)
df

# 3. yöntem
df[6] <- c(100,200,300,400,500) # sütun ismi belirtilmediği için otomatik isim alır.
df

# 4. yöntem
df['Yeni 3'] <- c(101,202,303,404,505)  # sütuna, özellikle boşluklu isim verirken, kullanılabilir.
df

# satır eklemek
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

df <- rbind(df, data.frame("ID"=6, "Şehir"="Sivas", "Puan"=77)) # tek satır ekleme
df

df <- rbind(df, data.frame('ID'= c(7,8),
                           'Şehir'=c("Sakarya","Rize"),
                           'Puan'=c(88,99)
                           )
            ) # çoklu satır ekleme
df

# değişken vektör kullanarak, çoklu satır eklemek
eklenecekIDler <- c(9:13)
eklenecekSehirler <- c("Tekirdağ","Muğla","Aydın","Antalya","Diyarbakır")
eklenecekPuanlar <- 87:91

df <- rbind(df, data.frame('ID'=eklenecekIDler, 
                           "Şehir"=eklenecekSehirler,
                           "Puan"=eklenecekPuanlar))

df
View(df)



# DATAFRAME SÜTUNLARININ İSİMLERİNİ DEĞİŞTİRMEK
names(df)

# df sütunlarındaki V6'yı "Altıncı" kelimesi ile değiştirelim.
names(df) <- c("ID","Şehir","Puan", "Yeni",  "Yeni2", "Altıncı" , "Yeni3")
df



# DATAFRAME BOYUTLARINI ELDE ETMEK
df

nrow(df)   # sadece satır sayısı
ncol(df)   # sadece sütun sayısı
dim(df)    # satır ve sütun sayısı



# DATAFRAME'DE BELLİ ŞARTLARA GÖRE ELEMAN SEÇMEK
df <- data.frame('ID'=x, 'Şehir'=y, 'Puan'=z)
df

df$Puan > 80    # Puan değeri 80 üstü olan satırlar, T-F vektörü olarak döndürülür.
satirlar <- which(df$Puan > 80)  # hangi satırların 80 üstü olduğunu kaydedelim.

df[satirlar,]  # Puan değeri 80 üstü olan tüm sütunları yazdıralım.

df[satirlar, c("Şehir","Puan")] # Puan değeri 80 üstü ve sütunlardan seçili olanlar döndürüldü.

df2 <- df[satirlar, c("Şehir","Puan")]  # df2, df'nin alt bir kümesi olarak kaydedilebilir.
df2

View(df2)

# belli bir değişkenin ortalamasını almak
df
puan_ortalama <- mean(df$Puan)
puan_ortalama

# Puan sütununda ortalama üstü değerleri gösterebilmek
ort_ustu_degerler <- which(df$Puan > puan_ortalama)
df[ort_ustu_degerler , ]

# rowMeans(...) ve colMeans(...) ile satır ve sütun ortalamalarını almak
iris

# bu iki fonksiyonu kullanırken, nümerik değerleri belirtmek gerekiyor.
# verilen parametredeki dataframe içinde kategorik sütun varsa, hata meydana gelir.
colMeans(iris)  # Species sütunu kategorik olduğu için hata meydana gelir.

sutunOrtalama <- colMeans(iris[1])  # 1. sütundaki değerlerin ortalamasını döndürür.
sutunOrtalama

satirOrtalama <- rowMeans(iris[ , 1:4]) # tüm satırların ortalamasını döndürür. 
satirOrtalama

# NA değerler varsa, onları ortalama hesabına dahil etmemek için na.rm=TRUE kullanılabilir.
satirOrtalama <- rowMeans(iris[ , 1:4]) # tüm satıların ortalamasını döndürür. 
satirOrtalama



# DATAFRAME'DE subset(...) FONKSİYONU
# Yukarıda yaptığımız, belli şartlara göre sorgulama işlemleri, tek sütun için geçerliydi. 
# Birden fazla sütunda, belli şartlara göre seçme ve alt küme çıkartma işlemleri yapabilmek için
# subset(...) fonksiyonunu kullanabiliriz.
iris

?subset

# bu tip işlemlerde parantez kullanımına dikkat etmek gerekiyor.
iris_subset <- subset(iris, subset = (Species == "setosa" & Petal.Width < 1.0))
iris_subset

iris_subset <- subset(iris, subset = (Species == "setosa" | Petal.Width < 1.5))
iris_subset



# DATAFRAME'DE aggregate(...) FONKSİYONU
# SQL dilindeki "GROUP BY" mantığı ile benzer şekilde çalışır.
# Gruplama işlemi yapabilmemizi sağlar.

?aggregate

# by=... parametresi, hangi sütuna göre gruplama yapılacağını belirttiğimiz yerdir.
# liste şeklinde verilmesi gerekir!
# FUN=... parametresi, gruplarda çalıştırılacak olan fonksiyonu belirttiğimiz yerdir.
aggregate(iris[1:4], by=list(iris$Species), FUN=mean) # ortalamalar
aggregate(iris[1:4], by=list(iris$Species), FUN=sum)  # toplamlar
aggregate(iris[1:4], by=list(iris$Species), FUN=sd)   # standart sapmalar



# DATAFRAME'DE apply(...) FONKSİYONU
# Belirlediğimiz bir fonksiyonu, 
# yine belirlediğimiz bir satır veya sütundaki tüm değerlere 
# apply(...) fonksiyonu ile uygulayabiliriz.

# MARGIN=1 ise, FUN=... parametresinde verilen fonksiyon SATIRLARA uygulanır.
# MARGIN=2 ise, FUN=... parametresinde verilen fonksiyon SÜTUNLARA uygulanır.
apply(iris[1:4], MARGIN=1, FUN=mean) # 150 satırın her birinin ortalamasını alır.
apply(iris[1:4], MARGIN=2, FUN=mean) # 4 sütunun her birinin ortalamasını alır.
# FUN=... parametresi yerine kendi oluşturduğumuz fonksiyonun ismini de girebiliriz.



# DATAFRAME'DE merge(...) FONKSİYONU
# İki ayrı data.frame'de ortak bir temel sütun olmalıdır.

library(readxl)
d <- read_excel("_d.xlsx") # demografik tablosu
t <- read_excel("_t.xlsx") # işlemler tablosu

?merge

# iki tabloda da birleştirilmek istenen temel sütunun isimleri aynı ise 
# by=... parametresi kullanılır.

# bizim örneğimizde, "ID" ile "CUSTOMER_ID" şeklinde iki farklı sütun var.
# o yüzden by.x=... ve by.y=... parametrelerini kullanıyoruz.

mrg <- merge(d, t, by.x = "ID", by.y= "CUSTOMER_ID")

View(d)
View(t)
View(mrg)
mrg



# DATAFRAME'İN ÖZET İSTATİSTİKLERİNİ GÖRMEK
# summary(...) fonksiyonu ile min-max, ortalama-medyan ve çeyreklikler görülebilir.
summary(iris)

# str(...) fonksiyonu ile değişkenlerin veri türlerini görebiliriz.
str(iris)

# head(...) fonksiyonu ile ilk değerleri görebiliriz.
head(iris, n=5)

# tail(...) fonksiyonu ile son değerleri görebiliriz.
tail(iris, n=5)



# R İÇİNDE GELEN HAZIR VERİ SETLERİ

data()     # komutunu çalıştırarak, 
           # R içinde gelen hazır veri setlerinin listesini görebiliriz.

iris       # iris veri setini hazır olarak kullanabiliriz.
View(iris) # daha iyi bir görünüm elde etmek için View(...) fonksiyonunu kullanabiliriz.


Orange
pressure
USArrests 



# R YAZILIMINA DIŞARIDAN VERİ SETİ YÜKLEMEK
# Import Dataset kısmından; 
# CSV verileri yüklemek için "From Text (base)" ve
# Excel verilerini yüklemek için, "From Excel" i seçebiliriz.
# Yükleme ekranında, sağ alt köşedeki kod kısmı (Code Preview) kopyalanıp, aynen kullanılabilir.



# R YAZILIMINA KODLA EXCEL DOSYASI YÜKLEMEK

library(readxl) # excel dosyalarını import edebilmek için, bu kütüphaneyi çağırmamız gerekiyor.

# Yöntem 1 : Eklenecek dosya yolunu açık olarak yazmak
# working directory setlemesi yapmadıysak, dosya yolunu açık olarak yazmak gerekiyor.
su_tuketim_1 <- read_excel("C:/Users/Zeki/Desktop/su_tuketim_istanbul.xlsx")
View(su_tuketim_istanbul_1)


# Yöntem 2 : Working Directory (Çalışma dizini) ayarı
setwd("C:/Users/Zeki/Desktop/")  # working directory'i bu şekilde ayarlarsak...
getwd()                          
                                 # read_excel(...) fonksiyonuna, 
                                 # artık sadece dosya ismini yazmamız yeterli olacaktır.
su_tuketim_2 <- read_excel("su_tuketim_istanbul.xlsx")
View(su_tuketim_istanbul_2)



# R YAZILIMINA KODLA CSV DOSYASI YÜKLEMEK

ulkeler <- read.csv("ulkeler.csv", header=TRUE, sep=";", dec=".")
ulkeler

View(ulkeler)
class(ulkeler)  # yüklenen dosyalar, "data.frame" veri türünde eklenmiş olur.


