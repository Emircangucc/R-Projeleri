#--------------------------
# ÇOKLU DOĞRUSAL REGRESYON
#--------------------------
# regresyon konusunun son sayfasındaki veri seti

x1 <- c(10,21,34,45,51,66,70,79,88,101)
x2 <- c(1,2,4,5,7,8,9,10,12,13)
y <- c(7,10,9,13,17,18,21,23,24,25)

library("caret")
library("FSelector")

df <- data.frame(x1,x2,y)
df

egitimler <- c(1,3,4,6,7,8,10)
trainSet <- df[egitimler, ]
testSet <- df[-egitimler, ]

trainSet
testSet

model <- lm(y ~ x1 + x2, trainSet)
model

# test verisi ile tahminde bulunmak
y_ <- predict(model, testSet)
y_

summary(model)

# özel bazı değerler ile tahminde bulunmK
ozelTahmin <- predict(model, data.frame(x1=c(10), x2=c(1)))
ozelTahmin

# hata hesabı
modelGT <- data.frame("gercek"=testSet$y, "tahmin"=y_)
modelGT

hatalar <- testSet$y - y_

mae <- sum(abs(hatalar)) / nrow(modelGT)
cat("MAE: ", mae)


mse <- sum((hatalar)**2) / nrow(modelGT)
cat("MSE: ", mse)

rmse <- sqrt(mse)
cat("RMSE: ", rmse)


#------------------------------
# ÖRNEK
# https://bit.ly/HousePriceCSV
#------------------------------

# daha sonra farklı modeller denemek için kullanacağız!
modelDene <- function(h, formul) {
  set.seed(1453)
  egitimler <- createDataPartition(h$price, p=0.8, list=F, times=1)
  trainSet <- h[egitimler, ]
  testSet <- h[-egitimler, ]
  
  model <- lm(formul, trainSet)
  print(model)
  print(summary(model))
}

# Öncelikle bu verisetini basit doğrusal regresyon için kullanıp,
# modelin ayrıntılarını görüp, ondan sonra çoklu regresyona geçelim.

setwd("C:/Users/Zeki/Desktop")
h <- read.csv("housing.csv")
View(h)
summary(h) # kayıp değer yok!
nrow(h)

# basit doğrusal regresyon için,
# price ve area değişkenlerini kullanacağız.
df <- h[c("area","price")]
View(df)

modelDene(df, "price ~ area") # Multiple R-squared:  0.3216

# R2 değeri 0.3216 çıkıyor.
# Bu durum, area değişkeninin, price değerini hesaplamada 
# yaklaşık %32 etkili olduğunu gösteriyor.
# yani yeterli değil.
# eğer bu değer %95 gibi bir değer olsaydı.
# sadece area değişkeni ile price değerini hesaplayabiliriz diyecektik.
# şuan için price değerini hesaplamada 
# area değerinin tek başına -yeterli olamadığını- söyleyebiliyoruz.


# bu durumda kötü bir model için; tahmin yapmaya veya 
# mae, mse, rmse gibi değerleri hesaplamaya gerek yok!
# o zaman diğer değişkenleri de kullanarak çoklu regresyonu deneyelim.

# özellik seçimi ile hangi değişkenleri kullanabileceğimizi seçebiliriz.


sonuc1 <- relief(price~., h)
sonuc2 <- chi.squared(price~., h)
sonuc1;sonuc2
sonuc3 <- cfs(price~., h)
sonuc3

#---------------------
# bathrooms'u ekledik
df <- h[c("area","bathrooms","price")]
modelDene(df, "price ~ area + bathrooms") 
# Multiple R-squared:  0.4712


#---------------------
# parking'i ekledik
df <- h[c("area","bathrooms","parking","price")]
modelDene(df, "price ~ area + bathrooms + parking") 
# Multiple R-squared:  0.4943


#---------------------
# stories'i ekledik
df <- h[c("area","bathrooms","parking","stories","price")]
modelDene(df, "price ~ area + bathrooms + parking + stories") 
# Multiple R-squared:  0.5705


#---------------------------
# airconditioning'i ekledik
df <- h[c("area","bathrooms","parking","stories","price")]

dummy <- dummyVars(" ~ .", data=h[10]) # 10 = airconditioning
df_onehot <- data.frame(predict(dummy, newdata = h[10]))
df <- data.frame(df, df_onehot)

modelDene(df, "price ~ area + 
          bathrooms + parking + stories + 
          airconditioningno + airconditioningyes") 
# Multiple R-squared:  0.6247


#---------------------------
# bedrooms'u ekledik
df <- h[c("area","bathrooms","parking","stories","bedrooms","price")]
df <- data.frame(df, df_onehot) # one-hot'ı unutmayalım.

modelDene(df, "price ~ area + bathrooms + parking + stories + 
              airconditioningno + airconditioningyes + bedrooms") 
#Multiple R-squared:  0.6268


#---------------------------
# buraya kadar özellik seçimi ile R2 değerini 0.6268'e kadar çıkarttık.
# şimdi hiç özellik seçimi yapmasaydık ne olurdu? ona bakalım.
#---------------------------

modelDene(h, "price ~ area + bathrooms + parking + stories + 
              mainroad + airconditioning + bedrooms + guestroom +
              basement + hotwaterheating + prefarea + furnishingstatus") 
# Multiple R-squared:  0.6833


#---------------------------
# sadece 4 değişkenle 0.57 gibi bir R2 değerine ulaşmıştık.
# 12 değişkenle ise sadece 0.68'e çıkabildik.
# yani özellik seçiminde elde ettiğimiz sonuçlarla, 
# daha küçük bir verisetinde çalışarak, benzer başarıyı elde edebiliriz.
#---------------------------

modelDene(h, "price ~ area + bathrooms + parking + stories + 
                mainroad + airconditioning + bedrooms + guestroom +
                basement + hotwaterheating + prefarea + furnishingstatus")



#----------------
# KARAR AĞAÇLARI
#----------------
# https://bit.ly/BankaMusteriCSV
#--------------------------------

library("caret")  # createDataPartition() fonksiyonu için
library("rpart")
install.packages("rattle")
library("rattle")   # karar ağacı grafiklerini çizmek için kulanılan kütüphanedir.

musteriler <- read.csv("banka_musterileri.csv")
View(musteriler)
musteriler <- musteriler[ , 2:5] # müşteri id'lerini çıkartıyoruz.

# kayıp değeri yok.
summary(musteriler)
View(musteriler)

# hedef değişkenin farklı değerleri
unique(musteriler$risk)

set.seed(1400)
egitimler <- createDataPartition(musteriler$risk, p=0.8, list=F, times=1)
trainSet <- musteriler[egitimler, ]
testSet <- musteriler[-egitimler, ]

model <- rpart(risk ~ ., 
               data=trainSet, method="class", 
               parms=list(split="gini"))

model

View(trainSet)
# parms=...'ta list() içindeki split=... parametresi birçok değer alabilir:
# information: entropi indeksi ile ayırma kriterini uygular.
# twoing: twoing indeksi ile ayırma kriterini uygular.
# gini: gini indeksi ile ayırma kriterini uygular.

# control=...'de rpart.control() içindeki minsplit=... parametresi,
# bir düğümde ayrım yapabilmek için minimum kaç gözleme (satır) 
# sahip olunması gerektiğini belirtir.
# Ağacın büyümesi ve kısalmasını sağlayan önemli bir parametredir.

fancyRpartPlot(model)

# Özellik Seçiminde kullandığımız 3 yöntem ile
# hangi değişkenin daha önemli olduğunu görebiliyoruz.
# O açıdan, karar ağacı önemli olan değişken ile başlatılıyor.
library("caret")
library("FSelector")

sonuc1 <- relief(risk ~ ., trainSet)
sonuc2 <- chi.squared(risk ~ ., trainSet)
sonuc1;sonuc2

sonuc3 <- cfs(risk ~ ., trainSet)
sonuc3


# Karar ağacı modeli üzerinden tahminler
y_ <- predict(model, testSet) # sonuçlar olasılık şeklinde elde edilir.
y_

y_ <- predict(model, testSet, type="class") # type=... parametresi ile sınıflar elde edilebilir.
y_

modelGT <- data.frame("gercek"=testSet$risk, "tahmin"=y_)
modelGT


# burayı çalıştırmadan önce, teorik kısmı anlatalım.
confusionMatrix(y_, as.factor(testSet$risk))

# precision, recall ve f1 değerlerinin hesaplanması için,
# mode=... paramtresini "prec_recall" yapıyoruz.
confusionMatrix(y_, as.factor(testSet$risk), mode="prec_recall")

# sonuç olarak;
# iyi bir model oluşmadığını görüyoruz.
# modeli iyileştirmek için en başta veri sayısını arttırmak, 
# daha sonra train-test oranını değiştirmek,
# kullanılan ayırma kriterini (entropi, gini, twoing vs.) değiştirmek
# uygulanabilecek çözümler arasındadır.

# karmaşıklık matrisinin tp,tn,fp,fn değerlerini ayrı ayrı alabiliriz.
cfm <- confusionMatrix(y_, as.factor(testSet$risk), mode="prec_recall")

t <- cfm$table
m <- matrix(c(t[1],t[2],t[3],t[4]), ncol=2, nrow=2, byrow = T)
m

