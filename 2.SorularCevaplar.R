
# Soru 1

# 1'den 20'ye kadar birer artan şekilde sayılardan oluşan bir vektör elde edin.
# vektörü "test" adlı değişkene atayın. 
# test vektörünün 3. ve 8. indisleri arasındaki elemanları 
# c(...) fonksiyonu ile seçip konsola yazdırın.

test <- 1:20
test[c(3:8)]



# Soru 2

# sehirler adlı vektörü aşağıdaki şehirleri kullanarak oluşturun.
# İstanbul,Ankara,İzmir,Adana,Konya,Sivas,Bursa,Tekirdağ,Bitlis,Van,Hakkari

# sehirler vektörünün; 
# 1) toplam eleman sayısını, 
# 2) son elemanını,
# 3) ilk 3 elemanını konsola yazdırın.

sehirler <- c("İstanbul","Ankara","İzmir","Adana",
              "Konya","Sivas","Bursa","Tekirdağ","Bitlis","Van","Hakkari")
length(sehirler)
son <- length(sehirler)
sehirler[son]
sehirler[1:3]



# Soru 3
# sehirler vektörünün 3, 5 ve 7. elemanlarını vektörden tek seferde ve  
# üç farklı yöntemle çıkartın, "yeni" adlı vektör olarak kaydedin.

# 1. yöntem
sehirler
yeni <- sehirler[-c(3,5,7)]
yeni

# 2. yöntem
sehirler <- c("İstanbul","Ankara","İzmir","Adana",
              "Konya","Sivas","Bursa","Tekirdağ","Bitlis","Van","Hakkari")
yeni <- sehirler[c(-3,-5,-7)]
yeni

# 3. yöntem
sehirler <- c("İstanbul","Ankara","İzmir","Adana",
              "Konya","Sivas","Bursa","Tekirdağ","Bitlis","Van","Hakkari")
cikart <- c(-3,-5,-7)
yeni <- sehirler[cikart]
yeni



# Soru 4
# sehirler vektörünün son haline (yeni); Yozgat, Kastamonu ve Sakarya şehirlerini, 
# iki farklı yöntemle; 9, 10 ve 11. eleman olarak ekleyin. 

# 1. yöntem
ekle <- c("Yozgat","Kastamonu","Sakarya")
yeni[c(9,10,11)] <- ekle
yeni

# 2. yöntem
yeni[9:11] <- c("Yozgat","Kastamonu","Sakarya")
yeni



# Soru 5
# yeni adlı vektöre, Antalya ve Muğla şehirlerini, 15. ve 16. eleman olarak ekleyin.
# oluşan NA değerleriyle - karakterini değiştirin.

yeni[15:16] <- c("Antalya","Muğla")
yeni

yeni[12:14] <- "-"
yeni


# Soru 6
# 12 ile 222 arasında "ardışık olarak artan" ve eleman sayısı 50 olan,  
# "gedik" isminde bir vektör oluşturun.

gedik <- seq(12,222,length.out=50)
gedik
#veya
gedik <- seq(from=12,to=222,length.out=50)
gedik


# Soru 7
# gedik vektöründen seed değerini 42 alarak, 
# rastgele 5 adet eleman seçin ve bunu "v" adlı değişkene atayın.

set.seed(42)
v <- sample(gedik, size=5)
v

# Soru 8
# v vektöründe, 70'den büyük olan elemanların 
# indislerini döndüren "i" isimli bir vektör oluşturun.

i <- which(v > 70)
i

# Soru 9 
# i vektöründeki elemanların 
# büyükten küçüğe doğru sıralandığı x adlı vektörü oluşturun.
# x vektörünü konsola yazdırın.

x <- sort(v[i], decreasing = T)
x

# Soru 10
# son bulunan x vektörünü seed değerini 42 alarak, 1 kez karıştırın.
# x vektöründen yine seed değerini 42 alarak, 10 eleman seçip konsola yazdırın.

set.seed(42)
sample(x)

set.seed(42)
sample(x, replace = T, size=10)

