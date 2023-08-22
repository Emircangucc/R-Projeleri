#
# Öncelikle 
# https://bit.ly/CalisanlarCSV adresinde bulunan 
# csv dosyasını yükleyin.

library("tidyverse")
setwd("C:/Users/Zeki/Desktop")
Calisanlar <- read.csv("Calisanlar.csv")
View(Calisanlar)



# SORU 1
# Aşağıdaki işlemleri, sırayla ve Calisanlar veri setinde, 
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# İstanbul'da çalışan, Maaşı 7000 üzerinde olan kişilerin, 
# Ad ve Soyadlarını konsola yazdırın.






# SORU 2
# Aşağıdaki işlemleri, sırayla ve Calisanlar veri setinde, 
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# a) Verileri "Maaş" sütununa göre küçükten büyüğe sıralayıp, 
# ilk 15 satırı seçin.
# b) Sıralanmış veride, her departmandan yalnızca bir kişi seçin.
# c) Elde edilen sonuçları, "Yer" bilgisine göre gruplayın.
# d) Her bir "Yer" bilgisine göre ortalama "Maaş" bilgisini bulun.
# e) Son olarak bulunan Ortalama maaş bilgilerini, 
# küçükten büyüğe doğru sıralayıp konsola yazdırın.






# SORU 3
# Aşağıdaki işlemleri, sırayla ve Calisanlar veri setinde,
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# Yaşı 30'un altında ve Yazılım departmanında çalışan kişileri,
# çalıştıkları Yer bilgisine göre gruplayıp, 
# her bir grubun ortalama Maaş bilgisini konsola yazdırın.







# SORU 4
# Aşağıdaki işlemleri, sırayla ve Calisanlar veri setinde,
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# Veri setindeki kişileri, Yer ve Departman bilgisine göre gruplayıp,
# oluşan gruplardan Yer bilgisi İstanbul olanları seçip,
# her grubun, ortalama Maaş ve ortalama Kıdem miktarını hesaplayın.

# Daha sonra YeniMaaş isimli yeni bir sütun oluşturup, 
# YeniMaaş sütununu aşağıdaki formüle göre doldurun.
# OrtalamaMaaş + OrtalamaKıdem * 1000

# Son olarak; Yer, Departman ve YeniMaaş sütunlarını konsola yazdırın.








# SORU 5
# Aşağıdaki işlemleri, sırayla ve Calisanlar veri setinde,
# Tidyverse kütüphanesini kullanarak, pipeline mantığı ile gerçekleştiriniz.

# Adı aynı olan kişilerin, ortalama Maaşlarını hesaplayıp, 
# oluşan veriden ilk 10 satırı seçip, 
# ortalama maaşı en yüksek olan 5 isimden, 
# seed değerini 42 alarak, rastgele 3 tanesini konsola yazdırın.


  






