
# LİSTELER
# list(...) fonksiyonuyla oluşturulur.

l <- list(22,23,24,25) 
l

# listeler, vektörlerden farklı olarak, 
# nesne barındırabilir ve iç içe yapılar oluşturabilirler.

x <- c(10,20,30,40,50)
y <- c(11,22,33,44,55)

# listenin içindeki bir eleman, 
# farklı bir liste, vektör, matris veya dataframe gibi bir nesne olabilir.
l <- list(x,y,5,'A')    
l

l2 <- list(c(11,22,33,44), 'Karakter', 5) # listeler her veri türünü barındırabilir.
l2  # 1. elemanı vektör, 2. elemanı karakter, 3. elemanı sayısal bir değer



# LİSTEDEN ELEMAN SEÇMEK
# liste elemanlarına iki köşeli parantezle ulaşılır, liste[[n]] gibi.
l3 <- list(x,y,10,20,'A','B')
l3

l3[[1]] # listenin 1. elemanını döndürür.
x

l3[[1]][2] # listenin 1. elemanındaki vektörün 2. elemanı
x[2]

# liste indislerini isimlendirmek
l4 <- list('A' = c(11,22,33,44,55), 'B'=5, 'C'="Karakter Verisi")
l4

l4$A # dolar operatörü ile isimlendirilmiş olan indisi seçebiliriz.
l4[[1]] # isimlendirme yapsak da, indis numarası ile yine de eleman seçebiliriz.
l4[['A']] # isimlendirilmiş indisi, çift köşeli parantezle de seçebiliriz.

l4[[1]][3]  # liste içindeki 1. eleman olan vektörün 3. elemanını seçmek


l4[[1]][c(1,3,5)] # listede 1. eleman olan vektörün 1,3 ve 5. elemanlarını döndürür.
l4[[1]][1:3] # listede 1. eleman olan vektörün 1,2 ve 3. elemanlarını döndürür.



# LİSTEDEN ELEMAN ÇIKARTMAK
l <- list(c(11,22,33,44,55), 'İstanbul', 1923)
l

l[[-1]] # hatalı işlem, eleman çıkartmak için çift köşeli parantez içinde -1 kullanamıyoruz!

# Listeden eleman çıkartmada 1. yöntem:
l[-1]  # l listesi değişmez! listeler için her zaman çift parantez kullanılmalı!
l

l <- l[-1]
l     # l listesi şimdi değişti!

# Listeden eleman çıkartmada 2. yöntem:
l[[1]] <- NULL # bu işlem listenin 1. elemanını listeden çıkartır.
l      # l listesi değişir.


# Listeden eleman çıkartmada 3. yöntem:
# isimli indislerle listeden eleman çıkartmak
l <- list('A'=c(10,20,30,40), "B"='Gedik', 'C'=2010)
l

l$A <- NULL
l

l <- list('A'=c(10,20,30,40), "B"='Gedik', 'C'=2010)
l[['A']] <- NULL
l

# liste içerisindeki vektör elemanından eleman çıkartmak
l <- list('A'=c(10,20,30,40), "B"='Gedik', 'C'=2010)
l

l[[1]][-c(2,3)] # liste değişmez!
l

l[[1]] <- l[[1]][-c(2,3)] # liste değişir.
l

l <- list('A'=c(10,20,30,40), "B"='Gedik', 'C'=2010)
l

l$A
l$A[-c(2,3)] # bu ve aşağıdaki 2 satır aynı şekilde çalışır.
l$A[-c(2:3)]
l$A[-2:-3]



# LİSTE ELEMANINI DEĞİŞTİRME
# liste elemanının değerini değiştirirken, elemanın indisini çift köşeli parantezle belirtiyoruz.

l <- list('elma', 'muz', 'çilek', 1, 2, 3, c(11,22,33,44))
l[[2]] <- "karpuz"
l

# liste içindeki eleman, vektör ise, o vektörün bir elemanını da değiştirebiliriz.
l[[7]]
l[[7]][-3]

l[[7]] <- l[[7]][-3] # liste elemanını vektörden eleman çıkartarak değiştirdik.
l            # yani liste içindeki bir elemanın, içeriğini değiştirmiş olduk.



# LİSTEYE YENİ ELEMAN EKLEMEK

l <- list("A","B",33,44)
l

l[[5]] <- "Beşinci Eleman"
l

# atama eğer yeni bir indise yapılırsa, ekleme yapılmış olur.
# atama eğer eski bir indise yapılırsa, değiştirme/güncelleme yapılmış olur.
l[[5]] <- "5. eleman"  # atama eski indise yapıldı, elemanın değeri güncellendi.
l

l[[10]] <- "Onuncu Eleman" # arada tanımlı olmayan indisler NULL değeri alırlar.
l



# MATRİSLER
# matrix(...) fonksiyonu ile oluşturulur.

x <- c(1,2,3,4)
matrix(x, nrow=2, ncol=2)

# 2x2'lik matris 2 satır ve 2 sütundan oluşur.
#   x x 
#   x x 

# matrix(...) fonksiyonundaki byrow=... parametresi default olarak FALSE'tur.
# yani verilen elemanlar, matrise sütun sütun eklenir.

matrix(x, nrow=2, ncol=2, byrow=T) # matrisi satıra göre doldurur.
matrix(x, nrow=2, ncol=2, byrow=F) # matrisi sütuna göre doldurur.

# matrisin boyutları eleman sayısından fazla ise
# matrisin tüm elemanlarını doldurana kadar aynı elemanlar kullanılır.

matrix(x, nrow=4, ncol=4) # 4x4'lük bir matris ve 16 elemana ihtiyaç var.

# matrisin eleman sayısı, verilen eleman sayısının katı değilse
# işlem tamamlanır ama konsola uyarı verilir.

matrix(x, nrow=3, ncol=3)
matrix(x, nrow=3, ncol=3, byrow=T)



# MATRİSTEN ELEMAN SEÇMEK
# matris gösterimi [satır, sütun] şeklindedir.
# matristeki elemanlar bu gösterime göre seçilir.
m <- matrix(x, nrow=2, ncol=2)
m

# [1,2] = birinci satır, ikinci sütundaki elemanı döndürür. 
m[1,2]

# [1,] = birinci satır ve bütün sütunları döndürür. 
m[1,]

# [,1] = birinci sütun ve bütün satırları döndürür. 
m[,1]

# tüm elemanları döndürür.
m[,]


# matristen kesit almak
m <- matrix(c(1,2,3,4,5,6,7,8), nrow=4, ncol=4)
m

m[1:2, 1:2]       # <- bu komut ve altındaki üç komut, aynı şekilde çalışır.
m[c(1:2), c(1:2)] 
m[c(1,2), c(1,2)] 
x <- c(1,2); m[x,x]

# matristen kesit almak -> büyük resmi küçültme örneği verilebilir.



# MATRİSTEN SATIR/SÜTUN ÇIKARTMAK
m <- matrix(c(1,2,3,4,5,6,7,8), 4, 2, T) # parametrelerin sırasını biliyorsak, 
                                         # isimli parametre kullanmayabiliriz.
m

# satır çıkartmak
m[-2:-3, ] # m matrisi değişmez! bu komut ve alttaki 5 komut aynı şekilde çalışır.
m[-c(2,3), ]
m[c(-2,-3), ]
m[-c(2:3),]
z <- -c(2,3); m[z, ]
z <- c(2,3); m[-z, ]

# sütun çıkartmak
m <- matrix(c(1:20), 4, 5, T)
m

m[ , -3:-4] # m matrisi değişmez! bu komut ve alttaki 5 komut aynı şekilde çalışır.
m[ , -c(3,4)]
m[ , c(-3,-4)]
m[ , -c(3:4)]
z <- -c(3,4); m[ , z]
z <- c(3,4); m[ , -z]

m <- m[ , -z] # m matrisi değişir.
m

# matristen ancak satır/sütun çıkartılabilir.
# tek bir eleman çıkartılamaz! çünkü o zaman matris olmaz.
# onun yerine çıkarılmak istenen elemanın değeri, NA olarak atanabilir.

m[2,3] <- NA



# MATRİSE SATIR/SÜTUN EKLEMEK
# vektör ve listede yeni eleman eklemek için, 
# toplam eleman sayısının bir fazlasını tanımlamak yetiyordu.
v <- c(1,2,3) # eleman sayısı = 3
v[4] <- 4
v

l <- list(1,2,3) # eleman sayısı = 3
l[[4]] <- 4
l

# fakat matrislerde eleman yerine, 
# ancak satır veya sütun ekleyebiliriz.
# satır eklemek için rbind(...) 
# sütun eklemek için cbind(...) fonksiyonlarını kullanabiliriz.
m <- matrix(1:12, nrow=3, ncol=4) # 3x4'lük bir matris oluşturalım.
m

# NOT:
# satır eklerken, sütun sayısına;
# sütun eklerken, satır sayısına dikkat edilmesi gerekiyor!

# matrise satır eklemek
# eklenecek matrisin, sütun sayısı dikkate alınmalıdır!
rbind(m, c(10,20,30,40)) # 4 sütunu olduğu için, eklenecek satırın 4 elemanı olmalıdır.
m # sadece rbind(...) fonksiyonunun çalıştırılması, matrisi değiştirmez!

m <- rbind(m, c(10,20,30,40))
m # matris değişir.

# hatalı kullanım
m <- rbind(m, c(1,2,3,4,5,6)) # sütun sayısı dikkate alınmadığı için hatalı olur.

# matrise sütun eklemek
# eklenecek matrisin, satır sayısı dikkate alınmalıdır!
cbind(m, c(100,200,300,400)) # m matrisi değişmedi!
m 

m <- cbind(m, c(100,200,300,400))
m # m matrisi değişir.



# MATRİSTEKİ ELEMANIN DEĞERİNİ DEĞİŞTİRMEK
m <- matrix(c(1:20), nrow=4, ncol=5)
m

# belli bir matris elemanını değiştirmek
m[2,3]
m[2,3] <- 0    # 2. satır, 3. sütundaki elemanı sıfır yapar. (tek eleman değişimi)
m

# belli satırları değiştirmek
m[c(2:3), ] <- 77 # 2. ve 3. satırdaki tüm elemanları 77 yapar. (çok eleman değişimi)
m

# belli sütunları değiştirmek
m[,c(2:3)] <- 33
m

# belli şartlara uyan matris elemanlarını değiştirmek
m[m[,]<77] <- 99 # matriste eleman değeri 77'den aşağı olan elemanları 99 yapar.
m

# spesifik olarak belirtilmiş matris elemanlarını değiştirmek
m[1,c(2:3)] <- c(0,0) 
m

