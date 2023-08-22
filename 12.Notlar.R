


# SORU 1
# 1,2,3,4,5 elemanlarından oluşan 100 elemanlı bir vektör oluşturun.
# Bu vektörden seed değerini 1453 alarak, 10 tane rastgele eleman seçin.
# Ardından bu elemanları büyükten küçüğe doğru sıralayıp, 
# yeni bir vektöre kaydedin.


set.seed(1453)
v <- sample(c(1,2,3,4,5), replace = T, size=100)

set.seed(1453)
v <- sample(v, size=10)

v <- sort(v, decreasing=T)
v






# SORU 2
# seed değerini "her seferinde" 99 seçerek, 
# 11,22,33,44 sayılarından oluşan 20 elemanlı v vektörünü oluşturun.
# vektör elemanlarını karıştırın.
# ardından bu vektörü 4x5'lik bir matris'e çevirin, 
# ardından matrisi dataframe'e çevirin.
# daha sonra tidyverse kütüphanesini kullanarak, aşağıdaki işlemleri yapın.
# a) 2. ve 4. satırları seçin
# b) 2. ve 3. sütunları seçin
# c) X3 değişkeni 22 olan satırı seçin
# d) geriye kalan tüm sayıların toplamını konsola yazdırın.


set.seed(99)
v <- sample(c(11,22,33,44), replace = T, size=20)
v

set.seed(99)
v <- sample(v)
v

m <- matrix(v, 4, 5, T)
m

df <- data.frame(m) 
df

library(tidyverse)
sonuc <- df %>% 
  slice(2,4) %>% 
  select(X2, X3) %>% 
  filter(X3 == 22) %>%
  summarise(
    Toplam = X2 + X3
  )
sonuc


# SORU 3
# Personeller tablosu aşağıdaki gibidir.

#-------------------------
#     AD     SOYAD   MAAS
#-------------------------
#    Ali    Öztürk   1000
#  Ahmet     Aydın    900
#   Ayşe    Yılmaz    750
#   Aysu     Demir    900
#   Buse  Yıldırım   1200
#  Burak    Öztürk   1100
#  Cemil    Öztürk   1000
#  Cansu     Aydın    900
#  Derya    Yılmaz    850
#  Erkan    Öztürk   1000
#-------------------------

# Tidyverse kütüphanesini kullanarak, 
# aşağıdaki işlemleri pipeline mantığı ile gerçekleştiriniz.
# SOYADI aynı olan kişilerin, ortalama Maaşlarını hesaplayıp, 
# oluşan veriden ilk 3 satırı seçip, 
# sadece "ortalama maaşı en yüksek olan soyadı" konsola yazdırın.



ad <- c("Ali","Ahmet","Ayşe","Aysu","Buse","Burak","Cemil","Cansu","Derya","Erkan")
soyad <- c("Öztürk","Aydın","Yılmaz","Demir","Yıldırım","Öztürk","Öztürk","Aydın","Yılmaz","Öztürk")
maas <- c(1000,900,750,900,1200,1100,1000,900,850,1000)
personeller <- data.frame(ad,soyad,maas)
personeller

library(tidyverse)

sonuc <- personeller %>% 
  group_by(soyad) %>%
  summarise(
    OrtMaas = mean(maas)
  )  %>%
  slice(1:3) %>%
  slice_max(order_by = OrtMaas)

sonuc
sonuc$soyad[1]

