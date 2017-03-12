%Resty Primadana%
%

domains
orang=symbol
mk=string
nilai=integer

predicates
nondeterm kuliah(orang,mk).
nondeterm ulangan(orang,mk,nilai).
nondeterm lulus(orang,mk).

clauses
kuliah(adi,"smbd").
kuliah(adi,"visual").
kuliah(budi,"smbd").
kuliah(cika,"visual").
kuliah(cika,"smbd").
kuliah(deni,"smbd").
kuliah(eni,"smbd").
ulangan(adi,"smbd",50).
ulangan(adi,"visual",45).
ulangan(budi,"smbd",80).
ulangan(cika,"visual",85).
ulangan(cika,"smbd",70).
ulangan(deni,"smbd",70).
ulangan(eni,"smbd",40).
lulus(X,Y):-kuliah(X,Y),ulangan(X,Y,Z), Z>60.


goal
lulus(Mahasiswa,smbd),ulangan(Mahasiswa,smbd,Nilai).