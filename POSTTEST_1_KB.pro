predicates
  nondeterm makanan(Symbol,long)
  nondeterm minuman(Symbol,long)
  nondeterm dessert(Symbol,long)
  nondeterm pesan(Symbol,long)

clauses
  makanan(nasigoreng,12000).
  makanan(mieayam,15000).

  minuman(milkshake,8000).
  minuman(popice,5000).
  
  dessert(brownies,5000).
  dessert(redvelvet,5000).
  
  pesan(Namamakanan,Harga):-
	makanan(Namamakanan,Harga);
	minuman(Namamakanan,Harga).

goal
makanan(Namamakanan,12000).