
%distEd(+S,+T,?D)
distEd([],T,D) :- length(T,D), binaria(T,D).
distEd(S,[],D) :- length(S,D), D>0, binaria(S,D). %D>0 para evitar duplicados en caso [] []
distEd([X|XS],[Y|YS],D) :- distEd(XS,YS,Intercambiar), NewIntercambiar is (Intercambiar + abs(X-Y)),	%intercambio elementos
			   distEd([X|XS],YS,Eliminar), NewEliminar     is (Eliminar + 1),		%elimino elemento
			   distEd(XS,[Y|YS],Agregar),  NewAgregar      is (Agregar + 1),		%agrego elemento
			   minimo(NewIntercambiar,NewEliminar,NewAgregar,D).
%entre(+X, +Y, -Z)
entre(X,Y,X) :- X=<Y.
entre(X,Y,Z) :- X<Y, Xm1 is X+1, entre(Xm1, Y, Z).

%Binaria(?L,+N)
binaria([], 0).
binaria([Y|YS], N) :- entre(0,1,V), Y is V, ACUM is (N - 1), ACUM >= 0, binaria(YS,ACUM).
							
minimo(A,B,C,Res) :- A<B, minimoAux(A,C,Res).
minimo(A,B,C,Res) :- A>B, minimoAux(B,C,Res).
minimo(A,B,C,Res) :- A=B, minimoAux(A,C,Res).

minimoAux(C,D,Res) :- C<D, Res is C.
minimoAux(C,D,Res) :- C>D, Res is D.
minimoAux(C,D,Res) :- C=D, Res is C.
