
# Soru 1

# "Gedik", "MYO", 2010, 2022 elemanlarından oluşan 
# bir vektör oluşturun.
# Vektörün 1. ve 3. elemanını vektörden silip, 
# geri kalanını konsola yazdırın.

x <- c("Gedik", "MYO", 2010, 2022)
x <- x[-c(1,3)]
x



# Soru 2

# z vektörü; 11,22,33,44,55,66,77,88 elemanlarından 
# oluşsun.
# seed değerini 42 alarak, z vektöründen, 
# rastgele 3 eleman seçip, konsola yazdıran kodu yazın.

z <- c(11,22,33,44,55,66,77,88)
set.seed(42)
z <- sample(z)
z[1:3]



# Soru 3
# 1,2,3,4,5,6,7,8,9,10,11,12 elemanlarından oluşan 
# 4x3'lik, m adlı bir matris oluşturun.
# matrisin 2. satırındaki tüm elemanları 0 yapın.
# daha sonra, matrisin 2. sütununu matristen kaldırın.
# geriye kalan matrisi konsola yazdırın.

m <- matrix(c(1:12), nrow=4, ncol=3)
m

m[2, ] <- 0
m <- m[, -2]
m



# Soru 4
# mt adlı matris; 
# 11,22,33,44,55,66 elemanlarından oluşan, 
# 3x2'lik bir matris olsun.
# bu matrise, sadece 20 elemanlarını içeren, 
# yeni bir sütun ekleyin.
# matrisin, 2. satırındaki elemanların 
# ortalamasını konsola yazdırın.

mt <- matrix(c(11,22,33,44,55,66), nrow=3, ncol=2)
mt

mt <- cbind(mt, c(20,20,20))
mt

mean(mt[2 , ])



# Soru 5
# t vektörü; 
# 1,3,5,7,11,23,45,96,138,155,567,981,1023 
# elemanlarından oluşsun. 
# t vektöründeki değerler için, 
# aykırı değer analizi yapıp, 
# aykırı değerleri ekrana yazdırın.

t <- c(1,3,5,7,11,23,45,96,138,155,567,981,1023)
q <- quantile(t, probs=c(0.25, 0.5, 0.75), names=F)
q

iqr = q[3] - q[1]
z <- 1.5 * iqr
z

minimum <- q[1] - z
maksimum <- q[3] + z

t[t > maksimum] # aykırı değerler



# Soru 6
# h vektörü; 
# 1,2,3,NA,5,NA,NA,6 elemanlarından oluşsun.
# önce NA olan değerleri 1 yapıp, ardından vektörün 
# tüm elemanlarının toplamını konsola yazdırın.

h <- c(1,2,3,NA,5,NA,NA,6)
h[which(is.na(h))] <- 1
h

sum(h)



# Soru 7
# aykırı değer analizi yapan bir fonksiyon yazın.
# parametre olarak, vektör alsın.
# sonucu "Aykırı Değerler: ..." 
# şeklinde konsola yazdırsın.

aykiriDeger <- function (v) {
  q <- quantile(v, probs=c(0.25, 0.5, 0.75), names=F)
  iqr <- q[3] - q[1]  # çeyrekler açıklığı
  z <- 1.5 * iqr      # çeyrekler açıklığının 1.5 katı
  
  max <- q[3] + z     # aykırı değer sayılamayacak maksimum değer
  min <- q[1] - z     # aykırı değer sayılamayacak minimum değer
  
  aykiriMin <- v[v < min]
  aykiriMax <- v[v > max]
  
  sonuc <- c(aykiriMin, aykiriMax)
  
  cat("Aykırı değerler: ", sonuc)
}

v <- c(1,3,5,7,11,23,45,96,138,155,567,981,1023)
aykiriDeger(v)



# Soru 8
# k vektörü; 11,2,43,36,25,16,77,18,99 
# değerlerinden oluşsun.
# önce 70'ten büyük olan değerleri vektörden silin.
# ardından, geriye kalan değerleri 
# k vektöründe büyükten küçüğe sıralayın.
# k vektörünün son halini konsola yazdırın.

k <- c(11,2,43,36,25,16,77,18,99)

silinecek <- which(k > 70)
k <- k[-silinecek]
k

k <- sort(k, decreasing = T)
k
