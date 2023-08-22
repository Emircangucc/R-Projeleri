
# TIDYVERSE kütüphanesi ve Pipeline mantığı

# Veri bilimciler tarafından çokça kullanılan popüler bir kütüphanedir.
# Daha önce dataframe'ler üzerinde yaptığımız birçok işlemi, 
# Tidyverse ile pratik olarak gerçekleştirebiliriz.

# Tidyverse pipeline mantığı ile çalışır. 
# Pipeline, bir önceki işlemin sonuçlarını, bir sonraki işlemde kullanma mantığıdır.

# Tidyverse yükleme işlemi
install.packages("tidyverse") # eğer daha önce kurulu değilse, kurulumu internet üzerinden başlatır.
library(tidyverse)            # kütüphaneyi kullanmak için çağırıyoruz.



# select(...) İLE SÜTUN SEÇME
View(iris)

# Pipeline mantığını kullanmak için "%>%" işaretini kullanacağız.
iris %>% select(Sepal.Length)               # Sepal.Length kolonunu seçmiş oluruz.
iris %>% select(Sepal.Length , Sepal.Width) # Sepal.Length ve Sepal.Width kolonlarını seçtik.

iris_ilk_kolon <- iris %>% select(Sepal.Length) # ilk kolonu ayrı bir data.frame olarak da kaydedebiliriz.
iris_ilk_kolon
class(iris_ilk_kolon)



# slice(...) İLE SATIR SEÇME
iris %>% slice(1,3,5)  # 1,3 ve 5. satırdaki verileri döndürür.
View(iris)

iris %>% slice(1:5)    # 1,2,3,4 ve 5. satırları döndürür.

v <- c(2,4,6,8)        # slice(...) fonksiyonu, parametre olarak vektör değişkeni de alabilir.
iris %>% slice(v)



# TIDEYVERSE FONKSİYONLARINI BİRLİKTE KULLANMAK
# Tidtverse kütüphanesinin pipeline mantığı sayesinde, peşpeşe işlemleri yapmak çok pratiktir.

iris %>% 
  select(Species) %>% # Species sütunu seçildi.
  slice(1,80,120)     # Seçilen sütundaki 1, 80 ve 120. satırlar seçildi.

# Hatalı Kullanım
iris 
%>% select(Species)  # Pipeline işaretinin (%>%) en sonda veya arada olması gerekir.
%>% slice(1,80,120)  # Alt satıra geçilecekse, pipeline işareti en sonda bırakılmalıdır.



# slice_min(...) ve slice_max(...) FONKSİYONLARININ KULLANIMI
# Veri setinde, belli bir sütunda, belli bir sayıda min veya max değeri döndüren fonksiyonlardır.

iris %>% 
  slice_min(order_by = Sepal.Length, n=5)  # iris veri setini Sepal.Length'e göre 
                                           # küçükten büyüğe sıralar ve ilk 5 tanesini döndürür.

df <- iris %>% 
  slice_min(order_by = Sepal.Length, n=5)  # belli şartlara göre elde edilen verileri 
                                           # yeni bir değişkene atabiliriz.
class(df)
df[["Sepal.Length"]][1]                    # minimum Sepal.Length değeri
df$Sepal.Length[1]                         # minimum Sepal.Length değeri

iris %>% 
  slice_max(order_by = Sepal.Length, n=5)  # iris veri setini Sepal.Length'e göre 
                                           # büyükten küçüğe sıralar ve ilk 5 tanesini döndürür.



# slice_sample(...) İLE RASTGELE ELEMAN SEÇMEK
iris %>% slice_sample(n=10)                # iris'ten rastgele 10 satır seçer.

# set.seed(n) ile belli elemanların her zaman seçilmesini sağlayabiliriz.
set.seed(42)
iris %>% slice_sample(n=3)



# distinct(...) İLE SÜTUNLARDAKİ FARKLI DEĞERLERİN TESPİTİ
iris %>% distinct(Species)      # kategorik değişkenlerde kaç farklı değer olduğunu görmek için anlamlıdır.
iris %>% distinct(Sepal.Length) # kategorik olmayan değişkenlerde kullanmanın pek anlamı olmayabilir.



# arrange(...) İLE ÇOKLU SÜTUNLARA GÖRE SIRALAMA İŞLEMLERİ
iris %>% arrange(Sepal.Length)  # slice_min(...) ve slice_max(...) gibi çalışır.
iris %>% arrange(Sepal.Length, Sepal.Width) # Sepal.Length değerleri aynı ise, 
                                            # Sepal.Width'e göre sıralama yapar.

iris %>% arrange(desc(Sepal.Length))        # büyükten küçüğe sıralama yapar.
iris %>% arrange(desc(Sepal.Length), Sepal.Width) # bir sütun büyükten küçüğe sıralanırken,
                                                  # diğer sütun küçükten büyüğe sıralanır.



# summarise(...) İLE ÖZET BİLGİLERİN SUNULMASI
iris %>% summarise(                          # hesaplanan ortalama ve medyan değerleri
    SL_Ortalama = mean(iris$Sepal.Length),   # belirlenen başlıklarla (SL_Ortalama vb.) 
    SL_Median = median(iris$Sepal.Length),   # sunuma hazır hale getirilmiş olur.
    SW_Ortalama = mean(iris$Sepal.Width),    # bu işlem sonrası,
    SW_Median = median(iris$Sepal.Width)     # döndürülen veri türü data.frame'dir.
  )

# summurise(...) fonksiyonu, summary(...) ile karıştırılmamalıdır.
iris %>% summarise(
  İstatistikler = summary(iris)
)



# group_by(...) İLE VERİ SETİNDE GRUPLAMA YAPMAK
gruplar <- iris %>% group_by(Species) # veri setini Species değişkenine göre gruplamış oldu.
View(gruplar)


dfg <- iris %>% group_by(Species) 
print(dfg, n=150)                     # tüm veri setini görebilmek için print(...) fonksiyonu kullanılabilir.



# filter(...) İLE VERİ SETİNDE FİLTRELEME YAPMAK
iris %>% filter(Sepal.Length > 3)
iris %>% filter(Sepal.Length > 5.5 & Species == "setosa")
iris %>% filter(Sepal.Length > 6.9 | Petal.Length > 6.9)



# mutate(...) İLE VERİ SETİNİ DÖNÜŞTÜRMEK
iris %>% mutate(Sepal.Length = log(Sepal.Length)) # Sepal.Length sütunundaki tüm değerlerin logaritmasını alır.
                                                  # Yani hepsine aynı işlemi (log) uygular.

# dilersek, mutate(...) ile yeni bir sütun da oluşturabiliriz.
iris %>% mutate(Sepal.Length.LOG = log(Sepal.Length))



# Buraya kadar verilen fonksiyonları bir arada kullanalım.
# Önce menüden "Session > Clear Workspace" yapalım.
set.seed(42)
son <- iris %>% 
  mutate(yeni = log(Sepal.Length)) %>%           # "yeni" adında bir kolon eklendi.
  slice_sample(n=10) %>%                         # veri setinden rastgele 10 satır seçildi.
  select(Sepal.Length, Sepal.Width, Species) %>% # yanda belirtilen 3 kolon seçildi.
  slice(1:4) %>%                                 # yeni verinin 1,2,3 ve 4. satırları seçildi.
  filter(Species == "versicolor") %>%            # Species değeri versicolor olan satırlar seçildi.
  arrange(desc(Sepal.Length))                    # yeni veri, Sepal.Length'e göre büyükten küçüğe sıralandı.

son$Sepal.Length[1]                              # son veride, ilk satırdaki Sepal.Length değeri seçildi.
  


# TIDYVERSE SORULAR

# https://bit.ly/vm_veri adresindeki csv dosyasını indirip, 
# R yazılımına yükleyin.

# Tidyverse kütüphanesinin pipeline özelliğini kullanarak, 
# aşağıdaki işlemleri gerçekleştiriniz.

# 1) (views) değeri 3 milyondan fazla olan videoları seçin,
# 2) (channel_title) ve (category_id) değişkenlerine göre gruplama yapın,
# 3) Gruplanan veride; (dislike), (like) ve (views) değerlerinin ortalamalarını 
# summarise(...) fonksiyonu ile elde ediniz.
# 4) Sonuç olarak, kanal isimleri ve kategorilerine göre;
# video görüntüleme, beğenme ve beğenmeme ortalamalarını belirlemiş olmalısınız.

FRvideos <- read.csv("FRvideos.csv")
View(FRvideos)
sonuc <- FRvideos %>% 
  filter(views > 3000000) %>% 
  group_by(channel_title, category_id) %>%
  summarise(
    Begenenler = mean(likes, na.rm = TRUE),
    Begenmeyenler = mean(dislikes , na.rm=TRUE), 
    Goruntulenmeler = mean(views , na.rm = TRUE)
  )
View(sonuc)
sonuc

test <- FRvideos %>% filter(channel_title == "20th Century Fox", 
                            category_id == 1)
View(test)


