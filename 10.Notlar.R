
View(airquality)
nrow(airquality)

#----------------------
# KAYIP DEĞER PROBLEMİ
#----------------------

# 0. kayıp değer tespiti
sum(is.na(airquality$Ozone))
summary(airquality)
naDegerleri <- which(is.na(airquality$Ozone))
naDegerleri

# 1. kayıp değerleri tamamen silmek
airquality <- na.omit(airquality)
nrow(airquality)
row.names(airquality) <- NULL # NA değerleri silince indexleri resetliyoruz!

# 2. kayıp değerlerin yerine, geriye kalanların ortalamasını vermek
naDegerleri <- which(is.na(airquality$Ozone))
airquality$Ozone[naDegerleri] <- mean(airquality$Ozone[-naDegerleri])
airquality

# 3. kayıp değerlerin hepsine aynı değeri vermek
airquality$Ozone[naDegerleri] <- 11.11
airquality

# 4. kayıp değerleri tek tek doldurmak
airquality$Ozone[10] <- 42.5 # bunun sebebi de raporda açıklanmalıdır.



#-----------------------
# AYKIRI DEĞER PROBLEMİ
#-----------------------
bx <- boxplot(
  airquality,
  col="orange"
)

bx <- boxplot(
  airquality[c(1,3)],
  col="orange"
)

# aykırı değer tespit fonksiyonu (Tukey yöntemi)
aykiriDegerSil <- function (veriseti, n) {
  sil <- c() # silinecek index'leri bu vektöre toplayacağız.
  
  for (k in n) {
    t <- veriseti[[k]]
    
    q <- quantile(t, probs=c(0.25, 0.5, 0.75), names=F, type=1)
    iqr <- q[3] - q[1]
    z <- 1.5 * iqr   
    
    max <- q[3] + z     
    min <- q[1] - z
    
    sil <- c(sil, which(t < min | t > max))
  }

  if (length(sil) == 0) {
    print("Aykırı değer yok!")
    return(veriseti)
  } else {
    print(sil) # silinecek indexler konsola yazdırılıyor.
    return(veriseti[-sil, ])
  }
}

airquality <- aykiriDegerSil(airquality, c(1:3)) # girilen kolonlarda aykırı değerler silinecek
row.names(airquality) <- NULL # Aykırı değerler silince indexleri yeniden resetliyoruz!
nrow(airquality)



#---------------
# NORMALİZASYON
#---------------
summary(airquality) # min-max değerler arası en az 1000 kat fark olmadığı için, 
                    # normalizasyon yapmaya gerek yoktur.

# eğer normalizasyon yapmak gerekirse, bu fonksiyon kullanılabilir.
# değerler 0-1 aralığına çekilmiş olur.
normalizasyon <- function(v) {
  return((v-min(v))/(max(v)-min(v)))
}

airquality$Ozone <- normalizasyon(airquality$Ozone)
airquality



#-----------------
# YENİDEN KODLAMA
#-----------------

# WeatherPlay verisetini edinmek için aşağıdaki kütüphaneyi yükleyebiliriz.
install.packages("partykit")
library("partykit")
View(WeatherPlay)

oyun <- WeatherPlay

oyun$temperature[oyun$temperature >= 80] <- "Yüksek"
oyun$temperature[oyun$temperature < 80 & oyun$temperature > 70] <- "Normal"
oyun$temperature[oyun$temperature <= 70] <- "Düşük"

View(oyun)

oyun$humidity[oyun$humidity > 80] <- "Yüksek"
oyun$humidity[oyun$humidity <= 80] <- "Düşük"

View(oyun)



#---------------------------------------------
# ONE-HOT ENCODING (DUMMY DEĞİŞKEN OLUŞTURMA)
#---------------------------------------------

# Yukarıda içeriğini değiştirdiğimiz oyun dataframe'ini 
# one-hot encodig ile sayısal değerlere çevirelim.

library("caret")

dummy <- dummyVars(" ~ .", data=oyun[1:4])
df <- data.frame(predict(dummy, newdata = oyun[1:4]))
View(df)

df["play"] <- oyun["play"]
View(df)



#---------------------------------------
# ÖZELLİK SEÇİMİ (Relief, CFS, Ki-kare)
#---------------------------------------

library("caret")
install.packages("FSelector")
library("FSelector")

# Species hedef değişkeni üzerinde etkisi olan
# diğer değişkenlerin etkinlik oranlarını görebiliriz.
sonuc1 <- relief(Species~., iris)
sonuc2 <- chi.squared(Species~., iris)
sonuc1;sonuc2

# CFS yöntemi biraz daha farklı çalışır.
# direkt olarak, hangi değişkenlerin en etkili değişkenler olduğunu belirtir.
sonuc3 <- cfs(Species~., iris)
sonuc3


# oyunun oynanabilmesi için en etkili değişkenler: 
# nem ve hava
sonuc1 <- relief(play~., oyun)
sonuc2 <- chi.squared(play~., oyun)
sonuc1;sonuc2

sonuc3 <- cfs(play~., oyun)
sonuc3



#--------------------------------------
# VERİYİ EĞİTİM VE TEST OLARAK AYIRMAK
#--------------------------------------

library("caret")

# burada yapılan bölümlemede, sınıfların değerleri de dikkate alınmıştır.
# veriyi tam anlamıyla temsil eden bir bölümleme yapılması önemlidir!
set.seed(1453)
# list=... parametresi F olursa, sonuçlar tablo olarak gelir.
egitimler <- createDataPartition(iris$Species, p=0.7, list=F, times=1)
egitimler

trainSet <- iris[egitimler, ] # %70 eğitim verisi
testSet <- iris[-egitimler, ] # %30 test verisi

View(trainSet)
View(testSet)



#--------------------------
# BASİT DOĞRUSAL REGRESYON
#--------------------------
# https://bit.ly/TecrubeMaasCSV

library("caret")

setwd("C:/Users/Zeki/Desktop")
df <- read.csv("tecrube_maas.csv")
View(df)

# kayıp değer olmadığını gördük.
summary(df)
nrow(df)

# aykırı değer kontrolü için kutu grafiği
bx <- boxplot(
  df$maas,
  col="orange"
)
# aykırı değer olmadığı için 
# aykiriDegerSil() fonksiyonunu çalıştırmıyoruz.


# eğitim-test ayrımı
set.seed(1453)
egitimler <- createDataPartition(df$maas, p=0.8, list=F, times=1)

trainSet <- df[egitimler, ]
testSet <- df[-egitimler, ] 

View(trainSet)
View(testSet)


# doğrusal regresyon model
model <- lm(maas ~ tecrube, data = trainSet)
model

# R2 değerinin 0.5 ve üstü olması beklenir.
# p-value değerinin 0.05'ten küçük olması beklenir.
summary(model)

# belli değerler için regresyon tahminleri
y_ <- predict(model, data.frame(tecrube = c(5.9)))
y_

# hata hesapları (mse, rmse, mae)
# testSet'teki her tecrube değerini tek tek test ederek,
# hepsi için tek tek maas değerlerini tahmin eder.
y_ <- predict(model, testSet)
y_

# gerçek ve modelce tahmin edilen maaş değerlerinin karşılaştırılması
modelGT <- data.frame("gercek"=testSet$maas, "tahmin"=y_)
modelGT

hatalar <- testSet$maas - y_

mae <- sum(abs(hatalar)) / nrow(modelGT)
cat("MAE: ", mae)


mse <- sum((hatalar)**2) / nrow(modelGT)
cat("MSE: ", mse)

rmse <- sqrt(mse)
cat("RMSE: ", rmse)

