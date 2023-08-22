#-------------------------------------------
# Öncelikle https://bit.ly/CalisanlarCSV 
# adresinde bulunan csv dosyasını yükleyin.
#-------------------------------------------
library("tidyverse")
Calisanlar <- read.csv("Calisanlar.csv")
View(Calisanlar)



# SORU 1
# İstanbul'da çalışan, Maaşı 7000 üzerinde olan kişilerin, 
# Ad ve Soyadlarını konsola veren Tidyverse kodunu yazın.

sonuc <- Calisanlar %>% 
  filter(Yer == "İstanbul" & Maaş > 7000) %>%
  select(Adı, Soyadı)

sonuc
View(sonuc)



# SORU 2
# Aşağıdaki işlemleri, sırayla ve Calisanlar tablosunda, 
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# a) Verileri "Maaş" sütununa göre küçükten büyüğe sıralayıp, ilk 15 satırı seçin.
# b) Sıralanmış veride, her departmandan yalnızca bir kişi seçin.
# c) Elde edilen sonuçları, "Yer" bilgisine göre gruplayın.
# d) Her bir "Yer" bilgisine göre ortalama "Maaş" bilgisini bulun.
# e) Son olarak; bulunan Ortalama maaş bilgilerini, küçükten büyüğe sıralayıp 
# konsola yazdırın.

sonuc <- Calisanlar %>% 
  slice_min(order_by = Maaş, n=15) %>%
  distinct(Departman, .keep_all = T) %>% 
  group_by(Yer) %>%
  summarise(
    Ortalama = mean(Maaş)
  ) %>%
  arrange(Ortalama)
  
sonuc
View(sonuc)



# SORU 3
# Aşağıdaki işlemleri, sırayla ve Calisanlar tablosunda, 
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# Yaşı 30'un altında ve Yazılım departmanında çalışan kişileri,
# çalıştıkları yere göre gruplayıp, 
# her bir grubun ortalama Maaş bilgisini konsola yazdırın.

sonuc <- Calisanlar %>% 
  filter(Yaş < 30 & Departman == "Yazılım") %>%
  group_by(Yer) %>% 
  summarise(
    Ortalama = mean(Maaş)
  )

sonuc



# SORU 4
# Aşağıdaki işlemleri, sırayla ve Calisanlar tablosunda, 
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# Tablodaki kişileri, Yer ve Departman bilgisine göre gruplayıp,
# oluşan gruplardan Yer bilgisi İstanbul olanları seçip,
# her grubun, ortalama Maaş ve ortalama Kıdem miktarını hesaplayın.

# Daha sonra YeniMaaş isimli yeni bir sütun oluşturup, 
# YeniMaaş sütununu aşağıdaki formüle göre doldurun.
# YeniMaaş = OrtalamaMaaş + OrtalamaKıdem * 1000

# Son olarak; Yer, Departman ve YeniMaaş sütunlarını konsola yazdırın.

sonuc <- Calisanlar %>% 
  group_by(Yer, Departman) %>% 
  filter(Yer == "İstanbul") %>%
  summarise(
    OrtalamaMaaş = mean(Maaş),
    OrtalamaKıdem = mean(Kıdem)
  ) %>%
  mutate(YeniMaaş = (OrtalamaMaaş + OrtalamaKıdem * 1000)) %>%
  select(Yer, Departman, YeniMaaş)

sonuc
View(sonuc)



# SORU 5
# Aşağıdaki işlemleri, sırayla ve Calisanlar tablosunda, 
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# Adı aynı olan kişilerin, ortalama Maaşlarını hesaplayıp, 
# oluşan veriden ilk 10 satırı seçip, 
# ortalama maaşı en yüksek olan 5 isimden, 
# seed değerini 42 alarak, rastgele 3 tanesini konsola yazdırın.

set.seed(42)
sonuc <- Calisanlar %>%
  group_by(Adı) %>% 
  summarise(
    OrtMaaş = mean(Maaş)
  ) %>%
  slice(1:10) %>%
  arrange(desc(OrtMaaş)) %>%
  slice(1:5) %>%
  slice_sample(n=3)

sonuc
  
