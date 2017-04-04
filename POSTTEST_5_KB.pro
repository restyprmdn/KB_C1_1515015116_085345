%1.)Apa perbedaan data object sederhana dan jamak?
%Jawab:
%Data Object Sederhana terbagi menjadi dua bagian yaitu Variabel 
%(setiap penulisan variable harus dengan huruf capital atau dengan sebuah underscore) 
%dan Constanta (apapun yang diidentifikasikan sebaagai sebuah object yang nilainya bisa bervariasi)
%Data Object Jamak memperlakukan beberapa informasi sebagai sebuah item tunggal
%data object dimulai dengan sebuah nama yang biasa disebut functor yang diikuti oleh tiga argumen
%Functor tidak melakukan apa-apa, hanya sebuah nama yang mengidentifikasi sebuah jenis data objek jamak yang didalamnya terdapat argument.

domains
nama=orang(symbol,symbol)
matkul,dosen,prodi,jenis_kelamin,alamat=symbol
nim,ruang=integer

predicates

nondeterm matkul_ajar(matkul,dosen,prodi,ruang)
nondeterm mahasiswa(nama,jenis_kelamin,nim,alamat,matkul)
matkul(matkul)
cetak_mhs(nama,alamat,dosen,ruang)
cetak_mhss(nama,dosen,ruang)
daftar
daftarr
clauses

matkul_ajar(intelejensi_buatan,abdul_kadir,manajemen_informatika,1).
matkul_ajar(pde,indra_yatini,teknik_informatika,2).
matkul_ajar(teknik_antarmuka,sigit_anggoro,teknik_komputer,3).

mahasiswa(orang(sugeng,riyadi),laki_laki,2002001,"jl.sudirman No.2,Pontianak, Kalimantan Barat",intelejensi_buatan).
mahasiswa(orang(yulia,sugondo),perempuan,2002002,"jl.ahmad yani No.10, Klaten,Jawa Tengah",intelejensi_buatan).
mahasiswa(orang(budiman,sejati),laki_laki,2002003,"jl.slamet riyadi No.45,Solo,Jawa Tengah",intelejensi_buatan).

mahasiswa(orang(laksamana,sukardi),laki_laki,2002004,"jl.Mt Haryono No.10,Palembang,Sumatera Selatan",pde).
mahasiswa(orang(rini,suwandi),perempuan,2002005,"jl.letjen suprapto No.12,surabaya,jawa timur",pde).
mahasiswa(orang(kwik,kiangie),laki_laki,2002006,"jl.wr supratman No.100 ,Makassar,Sulawesi Selatan",pde).

mahasiswa(orang(riri,reza),laki_laki,2002007,"jl.rw mongonsidi No.30,Purwokerto,Jawa tengah",teknik_antarmuka).
mahasiswa(orang(rachel,maryam),perempuan,2002008,"jl.otista No.112,Bandung,Jawa Barat",teknik_antarmuka).
mahasiswa(orang(garin,nugoroho),laki_laki,2002009,"jl.tanjung_pura No.101,jayapura,papua",teknik_antarmuka).

matkul(pde).
matkul(intelejensi_buatan).
matkul(teknik_antarmuka).

daftar:-
write("**** Daftar Mahasiswa yang Mengambil Matakuliah Intelejensi Buatan ****"),nl,
write(" Nama Mahasiswa\t\tAlamat\t\tNama Dosen\t\tRuang Kuliah\n"),
write("******************************************************"),nl,

matkul_ajar(intelejensi_buatan,Dosen,_,Ruang),
mahasiswa(Orang,_,_,Alamat,intelejensi_buatan),
cetak_mhs(Orang,Alamat,Dosen,Ruang),
fail.

cetak_mhs(orang(Pertama,Kedua),Alamat,Dosen,Ruang):-
write("",Pertama," ",Kedua,"\t\t","",Alamat,"\t\t","",Dosen,"\t\t\t",Ruang),nl.

daftarr:-
write(""),nl,
write(""),nl,
write(""),nl,
write("**** Daftar Mahasiswa ****"),nl,
write(" Matakuliah\t\tNama Mahasiswa\t\tNama Dosen\t\tRuang Kuliah\n"),
write("******************************************************"),nl,
matkul_ajar(Matkul,Dosen,_,Ruang),
mahasiswa(Orang,_,_,_,Matkul),
cetak_mhss(Orang,Dosen,Ruang),
fail.

cetak_mhss(orang(Pertama,Kedua),Dosen,Ruang):-
write("",Pertama," ",Kedua,"\t\t\t","",Dosen,"\t\t\t",Ruang),nl.


goal
daftar;
daftarr.
