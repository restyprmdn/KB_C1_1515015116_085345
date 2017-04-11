/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH06E08.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

predicates
  factorial(unsigned,real) - procedure (i,o)			%factorial memiliki dua parameter dengan procedure input output
  factorial(unsigned,real,unsigned,real) - procedure (i,o,i,i)	%factorial memiliki 4 parameter dengan procedure i,o,i,i
  %unsigned berarti bilangan yang tidak bernilai negatif dimulai dari 0
  %real berarti bilangan yang berupa decimal atau bilangan bulat kecuali bilangan negatif dimulai dari 0

/* Numbers likely to become large are declared as reals. */

clauses
  factorial(N,FactN):-			%(melakukan unfikasi) n factorial factn jika n factorial factn 1,1.0
	factorial(N,FactN,1,1.0). 	%karena ada dua sub goal ternyata yang cocok adalah pada sub gol ke dua karena
					%karena pada sub goal pertama nilai n tidak sama dengan 1 dan sehingga beralhi ke sub goal kedua 

  factorial(N,FactN,N,FactN):-!.	%apabila nilai n dan n bernilai sama maka proses akan langsung dihentikan
  					%n factorial fact n jika n ,fact n maka akan berhenti.
  					%diketahui bahwa terdapat dua nilai n dan factN yang harus bernilai sama.
  
  factorial(N,FactN,I,P):-		%n facktroial factn ,i,p jika newI = I + 1
	NewI = I+1,			%diketahu bahwa I bernilai 1 dan P bernilai 1.0
					%hasil dari newI adalah=I+1=1+1=2
	NewP = P*NewI,			%hasil dari newP adalah=p*newI=1.0*2=2.0
	
	factorial(N, FactN, NewI, NewP).%hasil yang didapat adalah N=3,FactN=?,NewI=2,NewP=2.0 (belum didaptkan hasil yang sesuai)
					%maka dilakukan looping kembali
%percobaan ke dua
%diketahui bahwa nilai I=2 dan nilai P=2.0
%hasil dari newI=I+1=2+1=3
%hasil dari newP=P*newI=2.0*3=6.0
%hasil yang didapat adalah N=3,FactN=?,NewI=3,NewP=6.0 
%pada hasil percobaan didapatkan nilai N dan NewI sama maka sesuai dengan sub goal pertama yaitu jika nilai n=n dan factn=factn
%maka looping akan dihentikan 

goal
  factorial(3,X). %mencari hasil dari 3 faktorial  , variabel X sendiri pada clauses itu sama dengan factN
