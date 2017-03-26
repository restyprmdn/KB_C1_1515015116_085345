DOMAINS

nama,jender,pekerjaan,benda,alasan,zat = symbol %menginisialisasi bahwa suatu variabel bernama nama,jender,pekerjaan,benda,alasan,zat itu bertipe data symbol
%symbol dipakai pada predikat yang argumennya memiliki nilai berupa kumpulan karakter yang hanya terdiri dari huruf atau kata tanpa dipisahkan oleh spasi.
umur=integer %menginisialisasi bahwa variabel umur itu bertipe data integer

PREDICATES
%nondeterm pada section predicates berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu solusi
nondeterm orang(nama, umur, jender, pekerjaan) %predicates dengan nama orang memiliki peremeter yang di dalamnya terdapat variabel (nama,umur,jender,pekerjaan)
nondeterm selingkuh(nama, nama) %predicates selingkuh memiliki variabel nama(orang yang berselingkuh) dan nama(selingkuhan)
terbunuh_dengan(nama, benda) %predicates dengan nama terbunuh_dengan memiliki parameter yang di dalamnya terdapat variabel (nama, benda) yang bertipe data symbol yang sudah di inisialisasikan pada domain
terbunuh(nama) predicates %dengan nama terbunuh_dengan memiliki parameter yang di dalamnya terdapat variabel (nama, benda) yang bertipe data symbol yang sudah di inisialisasikan pada domain
nondeterm pembunuh(nama) %predicates pembunuh memiliki variabel nama
motif(alasan) %predicates motif memiliki variabel alasan
ternodai(nama, zat) %predicates ternodai memiliki variabel nama dan zat
milik(nama, benda) %predicates milik memilki variabel nama dan benda
nondeterm cara_kerja_mirip(benda, benda) % predicates cara_kerja_mirip memiliki variabel benda(benda) dan benda(benda yang diduga sebagai senjata)
nondeterm kemungkinan_milik(nama, benda) % predicates kemungkinan_milik memiliki variabel nama dan benda
nondeterm dicurigai(nama) %predicates dicurigai memiliki variabel nama
/* * * Fakta-fakta tentang pembunuhan * * */

CLAUSES
orang(budi,55,m,tukang_kayu). %budi yang berumur 55 tahun dan berjenis kelamin m/male/pria bekerja sebagai tuaknga kayu
orang(aldi,25,m,pemain_sepak_bola). %aldi yang berumur 25 tahun dan berjenis kelamin m/male/pria bekerja sebagai pemain sepak bola
orang(aldi,25,m,tukang_jagal). %aldi yang berumur 25 tahun dan berjenis kelamin m/male/pria bekerja sebagai tukang jagal
orang(joni,25,m,pencopet). %joni yang berumur 25 tahun dan berjenis kelamin m/male/pria bekerja sebagai pencopet
selingkuh(ina,joni). %ina selingkuh joni
selingkuh(ina,budi). %ina selingkuh budi
selingkuh(siti,joni). %siti selingkuh joni
terbunuh_dengan(siti,pentungan). %siti terbunuh dengan pentungan
terbunuh(siti). %siti adalah orang terbunuh
motif(uang). %uang adalah motif melakukan pembunuhan
motif(cemburu). %cemburu adalah motif melakukan pembunuhan
motif(dendam). %dendam adalah motif melakukan pembunuhan
ternodai(budi, darah). %budi ternodai darah
ternodai(siti, darah). %siti ternodai darah
ternodai(aldi, lumpur). %aldi ternodai lumpur 
ternodai(joni, coklat). %joni ternodai coklat
ternodai(ina, coklat). %ina ternodai coklat
milik(budi,kaki_palsu). %budi memiiliki kaki palsu
milik(joni,pistol). %joni memilki pistol

/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan). %kaki palsu memiliki cara kerja mirip dengan pentungan
cara_kerja_mirip(balok, pentungan). %balok memilki cara kerja mirip pentungan
cara_kerja_mirip(gunting, pisau). %gunting memilki cara kerja mirip pisau
cara_kerja_mirip(sepatu_bola, pentungan). %sepatu bola memiliki cara kerja pentungan

kemungkinan_milik(X,sepatu_bola):- %X (pembunuh) kemungkinan memiliki sepatu bola jika
orang(X,_,_,pemain_sepak_bola). %X (pembunuh) adalah seorang pemain sepak bola
%didapatkan solusi yaitu aldi karena aldi adalah seorang pemain sepak bola

kemungkinan_milik(X,gunting):- %X (pembunuh) kemungkinan memiliki gunting jika
orang(X,_,_,pekerja_salon). %X (pembunuh) adalah seorang pekerja salon
%didapatkan bahwa tidak ada solusi dari kemungkinan ini karena tidak ada orang yang bekerja sebagai pekerja salon

kemungkinan_milik(X,Benda):- %X (pembunuh) kemungkinan memilki suatu benda yang digunakan sebagai senjata jika
milik(X,Benda). %X (pembunuh) memiliki benda tersebut
%didapatkan dua solusi terduga membunuh yaitu budi memiliki kaki palsu yang dapat digunakan sebagai senjata dan joni yang memiliki pistol yang dapat digunakan sebagai senjata

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */

dicurigai(X):- %X (pembunuh) dicurigai membunuh siti jika
terbunuh_dengan(siti,Senjata) , %siti terbunuh dengan senjata dan
cara_kerja_mirip(Benda,Senjata) , %benda yang digunakan memiliki cara kerja yang mirip dengan senjata untuk membunuh dan
kemungkinan_milik(X,Benda). %X (pembunuh) kemungkinan memilki benda tersebut
%pada proses dilakukan unifikasi
%tracking pertama 
%Seseorang dicurigai jika membunuh siti dengan senjata, diketahui bahwa siti terbunuh dengan senjata yaitu "pentungan"
%Benda yang dicurigai memiliki cara kerja yang sama dengan pentungan adalah "Kaki Palsu"
%Dan kaki palsu tersebut dimilki oleh orang yang dicurigai membunuh yaitu Budi 
%didapatkan solusi terduga membunuh adalah budi

%backtracking
%Seseorang dicurigai jika membunuh siti dengan senjata, diketahui bahwa siti terbunuh dengan senjata yaitu "pentungan"
%Benda yang dicurigai memiliki cara kerja yang sama dengan pentungan adalah "balok"
%Dan balok tersebut ternyata tidak ada yang memiliki maka tidak didapat solusi untuk pembunuhan dengan balok

%backtracking
%Seseorang dicurigai jika membunuh siti dengan senjata, diketahui bahwa siti terbunuh dengan senjata yaitu "pentungan"
%Benda yang dicurigai memiliki cara kerja yang sama dengan pentungan adalah "gunting"
%Dan gunting tersebut ternyata tidak ada yang memiliki maka tidak didapat solusi untuk pembunuhan dengan gunting

%backtracking
%Seseorang dicurigai jika membunuh siti dengan senjata, diketahui bahwa siti terbunuh dengan senjata yaitu "pentungan"
%Benda yang dicurigai memiliki cara kerja yang sama dengan pentungan adalah "sepatu bola"
%Dan sepatu bola tersebut dimilki oleh orang yang dicurigai membunuh yaitu joni 
%didapatkan solusi terduga membunuh adalah joni

%didapatkan solusi terduga membunuh adalah budi dan joni
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */

dicurigai(X):- %X dicurigai jika
motif(cemburu), % cemburu adalah motifnya dan
orang(X,_,m,_), % X adalah orang dengan jenis kelamin m atau male (pria) 
selingkuh(siti,X). % Siti adalah selingkuhan dari orang yang dicurigai sebagai pembunuh
%pada proses dilakukan unifikasi
%tracking pertama
%seseorang dicurigai membunuh jika memiliki motif cemburu dan orang tersebut memiliki jender m pada proses unifikasi ditemukan bahwa budi berjender m
%lalu pada fakta bahwa siti selingkuh dengan X(budi) tidak terpenuhi maka tidak didapatkan solusi untuk yang membunuh adalah budi

%backtracking
%seseorang dicurigai membunuh jika memiliki motif cemburu dan orang tersebut memiliki jender m pada proses unifikasi ditemukan bahwa aldi berjender m
%lalu pada fakta bahwa siti selingkuh dengan X(aldi) tidak terpenuhi maka tidak didapatkan solusi untuk yang membunuh adalah aldi

%backtracking
%seseorang dicurigai membunuh jika memiliki motif cemburu dan orang tersebut memiliki jender m pada proses unifikasi ditemukan bahwa joni berjender m
%lalu pada fakta bahwa siti selingkuh dengan X(joni) terpenuhi karena siti memang selingkuh dengan joni

%dari backtracking itu didapatkan solusi yang terduga membunuh adalah joni

/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */

dicurigai(X):- %orang yang dicurigai jika
motif(cemburu), %cemburu adalah motifnya dan
orang(X,_,f,_), %X adalah orang dengan jenis kelamin f atau female (perempuan) dan
selingkuh(X,Lakilaki), %X (pembunuh) selingkuh dengan laki-laki
selingkuh(siti,Lakilaki). %siti selingkuh dengan laki-laki

%pada proses dilakukan unifikasi
%tracking pertama
%seseorang dicurigai membunuh jika cemburu adalah motif membunuh dan X (pembunuh) berjender f , pada fakta tersebut tidak ditemuka orang yang berjender f
%maka didapatkan bahwa tidak ditemukan solusi untuk dugaan tersebut

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */

dicurigai(X):- % X (pembunuh) dicurigai jika
motif(uang), % memiliki motif uang dan
orang(X,_,_,pencopet). %X (pembunuh) adalah orang yang memiliki pekerjaan sebagai pencopet

%pada proses dilakukan unifikasi
%tracking pertama
%seseorang dicurigai membunuh jika memiliki motif uang dan orang yang melakukan itu memiliki pekerjaan sebagai pencopet yaitu joni
%maka didapatkan solusi terduga membunuh siti yaitu joni

/*----------------------------------*/

pembunuh(Pembunuh):- %Pembunuh adalah pembunuh jika
orang(Pembunuh,_,_,_), %Pembunuh adalah orang dan
terbunuh(Terbunuh), %Terbunuh itu terbunuh dan
Terbunuh <> Pembunuh, %orang yang terbunuh itu tidak sama dengan pembunuh itu sendri dan/* Bukan bunuh diri */
dicurigai(Pembunuh), %Pembunuh dicurigai dan
ternodai(Pembunuh,Zat),%Pembunuh ternodai dengan suatu zat dan
ternodai(Terbunuh,Zat).%Terbunuh ternodai dengan suatu zat juga

%Proses unifikasi pada tahap ini terdapat 6 syarat yang harus terpenuhi, dengan proses sebagai berikut:
%tracking pertama
%Pembunuh itu merupakan budi dan budi bukan orang yang terbunuh (fakta benar)
%Budi dicurigai membunuh dan dia ternodai dengan darah
%Terbunuh (Siti) ternodai dengan darah yang notabene sama dengan orang yang dicurigai sebagai pembunuh
%ditemukan solusi bahwa Budi adalah pembunuh nya

%backtracking
%Pembunuh itu merupakan aldi dan aldi bukan orang yang terbunuh (fakta benar)
%Aldi dicurigai membunuh dan dia ternodai dengan lumpur
%Terbunuh (Siti) ternodai dengan darah yang notabene berbeda dengan orang yang dicurigai sebagai pembunuh
%Tidak ditemukan solusi bahwa Aldi adalah pembunuh nya

%backtracking
%Pembunuh itu merupakan joni dan joni bukan orang yang terbunuh (fakta benar)
%Joni dicurigai membunuh dan dia ternodai dengan Coklat
%Terbunuh (Siti) ternodai dengan darah yang notabene berbeda dengan orang yang dicurigai sebagai pembunuh
%Tidk ditemukan solusi bahwa aldi adalah pembunuh nya

%jadi ditemukan solusi bahwa pembunuhnya adalah budi
GOAL
pembunuh(X).%Goal yang diinginkan adalah mencari siapa pembunuh sesungguhnya berdasarkan clause 
