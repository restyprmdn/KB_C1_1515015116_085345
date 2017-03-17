domains
mahasiswa=symbol
matkul=symbol
nilai=symbol

predicates
nondeterm mahasiswa(mahasiswa,matkul,nilai)
nondeterm matkul(matkul)
clauses
mahasiswa(irfan,intelejensi_buatan,"a").
mahasiswa(komeng,intelejensi_buatan,"d").
mahasiswa(dati,intelejensi_buatan,"c").
mahasiswa(fatima,intelejensi_buatan,"b").
mahasiswa(maspion,intelejensi_buatan,"c").
mahasiswa(ricky,pde,"e").
mahasiswa(embang,pde,"a").
mahasiswa(salmin,pde,"d").
mahasiswa(vina,pde,"b").
mahasiswa(sondang,pde,"c").
mahasiswa(pamuji,sistem_operasi,"d").
mahasiswa(luki,sistem_operasi,"e").
mahasiswa(sadek,sistem_operasi,"b").
mahasiswa(yusida,sistem_operasi,"a").
mahasiswa(eka,sistem_operasi,"a").

matkul(intelejensi_buatan).
matkul(pde).
matkul(sistem_operasi).

goal
mahasiswa(Ambil_matkul_ib,intelejensi_buatan,_);
mahasiswa(Mahasiswa,_,Lulus),Lulus<="c";
mahasiswa(Mahasiswa,_,Tidak_lulus),Tidak_lulus>"c";
matkul(Matkul);
mahasiswa(Mahasiswa,_,_).
