#---------------------
# VERİ GÖRSELLEŞTİRME
#---------------------

# 1) Histogram
# 2) Saçılım 
# 3) Bar
# 4) Yığın Bar
# 5) Pasta
# 6) Kutu

# HİSTOGRAM GRAFİKLERİ (Histogram Charts)
# R'da hist(...) fonksiyonu ile histogram grafikleri oluşturulabilir.
# fonksiyonun birçok parametresi ile histogram grafiği şekillendirilebilir.

iris
hist(iris$Sepal.Length)

hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir"
)

hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi"
)

hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi",
  breaks = 20  # kırılım miktarını arttırdıkça grafik daha ayrıntılı olur.
)

hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi",
  breaks = 10,
  xlim = c(4,9),  # x ekseninin min-max değerlerinin ayarlanması
  ylim = c(0,40)  # x ekseninin min-max değerlerinin ayarlanması
)

hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi",
  breaks = 10,
  xlim = c(3,9), 
  ylim = c(0,40) ,
  col = "orange"   # renkler, html'de kullanılan hexadecimal değerlerle sağlanabilir.
)

hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi",
  breaks = 10,
  xlim = c(3,9), 
  ylim = c(0,40),
  col = "#3498db"   # renkler, html'de kullanılan hexadecimal değerlerle sağlanabilir.
  # flatuicolors.com sitesinden renk seçimi yapılabilir.
)

# renkler vektör olarak girilirse, sırayla her bir çubuk renklendirilmiş olur.
hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi",
  breaks = 10,
  xlim = c(3,9), 
  ylim = c(0,40),
  col = c("orange", "blue", "green", "yellow")
)

# histogram üzerinde yoğunluk eğrisi çizimi
hist(
  iris$Sepal.Length,
  main = "En üstteki yazı main parametresi ile değiştirilebilir",
  xlab = "X ekseninin etiketi",
  ylab = "Y ekseninin etiketi",
  breaks = 10,
  col = "orange",
  prob=T
)
lines(density(iris$Sepal.Length), col="red", lwd=2)

# !!!
# Export menüsünden, 
# oluşturulan resim birçok formatta kaydedilebilir.


# SAÇILIM GRAFİKLERİ (Scatter Plots)
# Daha önceki derslerimizde, R içinde hazır gelen veri setleri olduğundan bahsetmiştik.
# Şimdi bu veri setlerinden birini saçılım grafiği çizmek için kulanabiliriz.

View(airquality)

# plot(...) fonksiyonu ile saçılım grafiği çizilebilir.
plot(airquality$Ozone)

# saçılım grafiğinin üst ve sağ sınırlarını kaldırmak için 
# bty=... paramtresini kullanabiliriz.
plot(airquality$Ozone, bty="L")

# saçılım grafiğindeki simgeler, pch=... parametresi ile değiştirilebilir.
plot(airquality$Ozone, pch="*")
plot(airquality$Ozone, pch="+")
plot(airquality$Ozone, pch="x")
plot(airquality$Ozone, pch=1)
plot(airquality$Ozone, pch=19)

# vektör şeklinde girilirse, sırayla her bir noktaya sıradaki simge verilir.
plot(airquality$Ozone, pch=c(1,2,3,4,5))
plot(airquality$Ozone, pch=19)

# saçılım grafiğinin x ve y eksenlerini ayrıca belirtebiliriz.
# x eksenini Ozon değerleri, y eksenini Sıcaklık yapalım.
plot(
  x = airquality$Temp, # x ve y'de verilen değerlerin toplam sayıları eşit olmalıdır.
  y = airquality$Ozone, 
  pch = 19,
  # Histogram grafiğindeki gibi main=..., xlab=... ve ylab=... parametreleri var.
  main = "Saçılım Diyagramı", 
  xlab = "Sıcaklık Değerleri",
  ylab = "Ozon Değerleri",
  bty="L"
)

# saçılım grafiğini col=... parametresi ile renklendirebiliriz.
plot(
  x = airquality$Ozone, 
  y = airquality$Temp, 
  pch=19,
  main = "Saçılım Diyagramı", 
  xlab = "Sıcaklık Değerleri",
  ylab = "Ozon Değerleri",
  bty="L",
  col="orange"
)

# aylara göre grafikteki noktaları ayrı ayrı renklendirebiliriz.
View(airquality)
# Month sütununun veri türü "integer" 
class(airquality$Month)
# "integer" veri türünü ordinal bir değişkene atamak gerekir.
# yani R dilinde "factor" değişken haline getirmemiz gerekir.
as.factor(airquality$Month)

# üstteki gibi yazmak yetmez, 
# her bir sayıya karşılık bir renk atanması gerekir.
c("blue", "green", "pink", "orange", "black")[as.factor(airquality$Month)]

# mantığı bu
# v <- c("blue", "green", "pink", "orange", "black")
# v[1]

plot(
  x = airquality$Ozone, 
  y = airquality$Temp, 
  pch=19,
  main = "Saçılım Diyagramı", 
  xlab = "Sıcaklık Değerleri",
  ylab = "Ozon Değerleri",
  bty="L",
  col=c("blue", "green", "orange", "gray", "black")[as.factor(airquality$Month)]
)

# renkler değişkenini ayrıca kaydedebiliriz.
renkler <- c("blue", "green", "orange", "gray", "black")[as.factor(airquality$Month)]

plot(
  y = airquality$Temp, 
  x = airquality$Ozone, 
  pch=19,
  main = "Saçılım Diyagramı", 
  xlab = "Ozon Değerleri",
  ylab = "Sıcaklık Değerleri",
  bty="L",
  col=renkler
)

# hangi rengin neyi ifade ettiğini belirtmek için, 
# legend(...) fonksiyonu kullanılabilir.
plot(
  x = airquality$Ozone, 
  y = airquality$Temp, 
  pch=19,
  main = "Saçılım Diyagramı", 
  xlab = "Sıcaklık Değerleri",
  ylab = "Ozon Değerleri",
  bty="L",
  col=renkler
)
legend(
  x="topright",
  legend=levels(as.factor(airquality$Month)),
  col=c("blue", "green", "orange", "gray", "black"),
  pch=19
)

# legend arkasında da bir nokta olabilir, 
# o yüzden legend'ı biraz kaydırmak gerekecektir.
# bunu yapmak için par(...) fonksiyonu kullanılabilir.
# par(...) içindeki mar=... parametresi margin değeridir.
# grafiğin dıştan ne kadar boşluk içereceğini belirten bir parametredir.
par(mar=c(5,5,4,5), xpd=TRUE) # alt, sol, üst, sağ
plot(
  x = airquality$Ozone, 
  y = airquality$Temp, 
  pch=19,
  main = "Saçılım Diyagramı", 
  xlab = "Sıcaklık Değerleri",
  ylab = "Ozon Değerleri",
  bty="L",
  col=renkler
)
legend(
  x="topright",
  legend=levels(as.factor(airquality$Month)),
  col=c("blue", "green", "orange", "gray", "black"),
  pch=19,
  inset=c(-0.15, 0.05) # sağ-sol, üst-alt
)

# en son 3 boyutlu bir grafik elde ettik.
# elde ettiğimiz grafik ozon, sıcaklık ve ay bilgisini veriyor.
# şimdi de rüzgar bilgisini ekleyerek, grafiğimizi 4 boyutlu hale 
# getirebiliriz.

# bunu yapmak için, grafikteki yuvarlak noktaları,
# rüzgarın şiddetine göre, büyüteceğiz.
# böylece, yüksek rüzgara sahip noktalar daha büyük gözükecek,
# diğerleri daha küçük gözükmüş olacaktır.

par(mar=c(5,5,4,5), xpd=TRUE) 
plot(
  x = airquality$Ozone, 
  y = airquality$Temp, 
  pch=19,
  main = "OZON SICAKLIK İLİŞKİSİ", 
  xlab = "Ozon Değerleri",
  ylab = "Sıcaklık Değerleri",
  bty="L",
  col=renkler,
  cex=airquality$Wind/10 # cex=... parametresi noktaların boyutunu ifade eder.
)
legend(
  x="topright",
  legend=levels(as.factor(airquality$Month)),
  col=c("blue", "green", "orange", "gray", "black"),
  pch=19,
  inset=c(-0.15, 0.05) 
)

# rüzgarı da grafiğe ekledikten sonra,
# büyük veya küçük noktaların ne anlama geldiğini belirtecek
# yeni bir legend'e daha ihtiyacımız var.

par(mar=c(5,5,4,5), xpd=TRUE) 
plot(
  x = airquality$Ozone, 
  y = airquality$Temp, 
  pch=19,
  main = "OZON SICAKLIK İLİŞKİSİ", 
  xlab = "Sıcaklık Değerleri",
  ylab = "Ozon Değerleri",
  bty="L",
  col=renkler,
  cex=airquality$Wind/10
)
legend(
  x="topright",
  legend=levels(as.factor(airquality$Month)),
  col=c("blue", "green", "orange", "gray", "black"),
  pch=19,
  inset=c(-0.1, 0.05),
  pt.cex=1,
  title="Aylar",
  horiz=F          # TRUE yapılırsa, lejand yatay gözükür.
)
legend(
  x="topright", 
  pch=19,
  legend=c("Düşük", "Orta", "Yüksek"),
  # pt.cex=... parametresi, legend içindeki noktanın büyüklüğünü ayarlar.
  # büyüklüğün ne kadar olması gerektiğini de 
  # Wind sütunundaki min-max-mean değerleri belirleyecektir.
  pt.cex=c(min(airquality$Wind)/10, mean(airquality$Wind)/10, max(airquality$Wind)/10),
  inset=c(-0.10, 0.5),
  title="Rüzgar Seviyesi"
)



par(xpd=TRUE) # legend'lar dışarı taşabilir, sorun yok.
legend(
  x="topright",
  legend=levels(as.factor(airquality$Month)),
  col=c("blue", "green", "orange", "gray", "black"),
  pch=19,
  inset=c(-0.1, 0.05),
  pt.cex=1,
  title="Aylar"
)
legend(
  x="topright", 
  pch=19,
  legend=c("Düşük", "Orta", "Yüksek"),
  # pt.cex=... parametresi, legend içindeki noktanın büyüklüğünü ayarlar.
  # büyüklüğün ne kadar olması gerektiğini de 
  # Wind sütunundaki min-max-mean değerleri belirleyecektir.
  pt.cex=c(min(airquality$Wind)/10, mean(airquality$Wind)/10, max(airquality$Wind)/10),
  inset=c(-0.10, 0.5),
  title="Rüzgar Seviyesi"
)



# BAR GRAFİKLERİ (Bar Plots)
# Kategorik verilerin, görselleştirilmesinde kullanılabilir.
# Bu amaçla, R yazılımında hazır bulunan mtcars veri setindeki araba bilgilerinden
# yola çıkarak, arabaların silindir sayılarına ait (cyl) bir bar grafiği çizeceğiz.

# Çizilecek olan bar grafiği, 
# hangi silindire sahip kaç araba olduğu bilgisini görselleştirmiş olacaktır.

View(mtcars)

# Öncelikle table(...) fonksiyonu ile 
# "cyl" sütunundaki değerlerin frekansını alabiliriz.
table(mtcars$cyl)

# barplot(...) fonksiyonu ile bar grafiği çizilebilir.
# fonksiyonun ilk parametresi, 
# az önce yukarıda table(...) fonksiyonu ile bulunan değerleri gireceğimiz 
# height=... parametresidir.

# o yüzden öncelikle table(...) ile bulduğumuz değerleri bir değişkene kaydedelim.
h = table(mtcars$cyl)
h
barplot(height=h)

# daha önce yaptığımız görselleştirmelerde kullandığımız parametreleri
# barplot(...) fonksiyonunda da kullanabiliriz.
barplot(height=h, 
  xlab="Silindir Değerleri",
  ylab="Frekans",
  main="mtcars veri setindeki arabaların silindir değerleri"
)

# her bir barın altındaki ismi belirleyebiliriz.
# bunun için names.arg=... parametresini kullanabiliriz.
# bu parametre bizden vektör verisi ister.
# her bir bar için, sırayla girmek istediğimiz değerleri yazabiliriz.
barplot(height=h, 
  #xlab="Silindir Değerleri",
  ylab="Frekans",
  main="mtcars veri setindeki arabaların silindir değerleri",
  names.arg = c("Dört Silindirli", "Altı Silindirli", "Sekiz Silindirli")
)

# barları renklendirmek için col=... ve 
# barların sınırlarını renklendirmek için border=... 
# parametresini kullanabiliriz.
barplot(
  height=h, 
  ylab="Frekans",
  main="mtcars veri setindeki arabaların silindir değerleri",
  names.arg = c("Dört Silindirli", "Altı Silindirli", "Sekiz Silindirli"),
  col="orange", 
  border="navy"
)

# bar grafiğini dikey yapabildiğimiz gibi, yatay da yapabiliriz.
# bunun için horiz=... parametresini TRUE yapmamız gerekir.
barplot(
  height=h, 
  ylab="Silindir Değerleri",
  main="mtcars veri setindeki arabaların silindir değerleri",
  col="orange", 
  border="navy",
  horiz=F
)

#
# Öğrenciler, 
# aynı bar grafiğini Vites (gear) 
# bilgisine göre yeniden çizsin.
#

# barplot(table(mtcars$gear))
# ek olarak, grafiğin daha güzel görünmesi için 
# ylim=... parametresini de kullanabiliriz.
# barplot(table(mtcars$gear), ylim=c(0,20)) 



# YIĞIN BAR GRAFİKLERİ (Stack Bar Plots)
# Saçılım diyagramlarında birden fazla değişkeni 
# bir arada görselleştirebiliyorduk.
# Yığın bar grafiklerini de yine birden fazla değişkeni 
# bir arada görselleştirmek için kullanacağız.

t <- table(mtcars$cyl, mtcars$gear)
t

barplot(t)

# 4 silindirliler: siyah
# 6 silindirliler: gri
# 8 silindirliler: açık gri 
# olarak renklendirildi.

# renkleri değiştirmek için col=... parametresini kullanabiliriz.
# 4 silindirliler: orange
# 6 silindirliler: navy
# 8 silindirliler: gray
barplot(
  t, 
  col=c("orange", "navy", "gray"),
  xlab="Vites",
  ylab="Araba Sayısı"
)
legend(
  x="topright",
  legend=levels(as.factor(mtcars$cyl)),
  col=c("orange", "navy", "gray"),
  pch=19,
  inset=c(0.03, -0.2),
  pt.cex=1,
  title="Silindir"
)



# PASTA GRAFİKLERİ (Pie Charts)
# Bir değişkendeki değerlerin, yüzdeliklerine göre grafiğini çizmemizi sağlar.

table(mtcars$gear)
t <- table(mtcars$gear)

# 3,4 ve 5 vitesli kaç araba olduğunu gördük ama yüzdeliklerini bilmiyoruz.
# yani arabaların yüzde kaçı 3 vitesli, yüzde kaçı 5 vitesli gibi...
# bunu kendimiz de hesaplayabiliriz ama R'da bununu için hazır bir fonksiyon mevcut.
# prop.table(...) fonksiyonu ile yüzdelikleri hesaplayabiliriz.
prop.table(t)
yuzdeler <- prop.table(t)

# yüzdeleri belirledikten sonra, 
# pasta grafiğini pie(...) fonksiyonu ile çizebiliriz.
pie(yuzdeler)

# şimdi pasta grafiğinin ayrıntılarına girelim.
pie(
  yuzdeler,
  main="Üst yazı",
  labels=c("3 Vitesli", "4 Vitesli", "5 Vitesli"),
  col =c("orange","yellow","gray")
)

# pasta grafiğinin şeklini döndürmek için 
# init.angle=... parametresini kullanabiliriz.
pie(
  yuzdeler,
  main="Muzlu Pasta Grafiği",
  labels=c("3 Vitesli", "4 Vitesli", "5 Vitesli"),
  col =c("orange","yellow","gray"),
  init.angle = 180, # saat yönünün tersine 180 derece döndürür.
  border = "gray", # sınırların rengi
  radius= 1.1,  # yarıçap değeri
)



# KUTU GRAFİKLERİ (Box Plots)
degerler <- c(35,38,62,64,65,71,76,88,89,90,95,99,260,480)
bx <- boxplot(
  degerler,
  col="orange"
  #horizontal=T   # kutu grafiğini yatay hale getirmek için kullanılabilir.
)
bx$out

# aykırı değer bulma fonksiyonu (Tukey yöntemi)
aykiriBul <- function (degerler) {
  q <- quantile(degerler, probs=c(0.25,0.5,0.75), names=F, type=1)
  iqr <- q[3] - q[1] # çeyrekler arası uzaklık
  #print(q[1:3])
  z <- 1.5 * iqr
  maksimum <- q[3] + z  
  minimum <- q[1] - z 
  #print(c(maksimum,minimum))
  return (degerler[degerler > maksimum | degerler < minimum])
}

aykiriBul(degerler)


boxplot(
  iris$Sepal.Length, 
  iris$Sepal.Width, 
  iris$Petal.Length, 
  iris$Petal.Width,
  col="pink",
  names = c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
  )
View(iris)

# Sepal.Width'i ayrı olarak daha net olarak gösterebiliriz.
boxplot(
  iris$Sepal.Width, 
  col="pink",
  names = c("Sepal.Width"),
  ylim=c(2,5)
)
View(iris)

