Program BiggestSoFar;
   Type
      ListPTR = ^List ;
      List = Record
                   A:Integer;
                   Suivant:ListPTR;
             End;
   {------------------------------------------}
   Function AdrPremier (L:ListPTR):String ;
       Begin
         If ( L = Nil ) then AdrPremier:='Nil'
         Else if ( L <> Nil ) then AdrPremier:='ADRESS DE PREMIER CASE';
       End;
   {------------------------------------------}
   Function ValPremier (L:ListPTR):integer ;
       Begin
         If ( L = Nil ) then ValPremier:=-1
         Else if ( L <> Nil ) then ValPremier:=L^.A;
       End;
   {------------------------------------------}
   Function AdrDernier (Ls:ListPTR):String ;
       Var
         L:ListPTR;
       Begin
         L:=LS;
         If ( L = Nil ) then AdrDernier:='Nil'
         Else if ( L <> Nil ) then Begin
                                     While ( L <> Nil ) do
                                     Begin
                                       If ( L^.Suivant^.Suivant = Nil ) then
                                       AdrDernier:='ADRESSE DE DERNIER ELEMENT';{AdrDernier:=L^.Suivant}
                                       L:=L^.Suivant;
                                     End;
                                   End;
       End;
   {------------------------------------------}
   Function ValDernier (Ls:ListPTR):Integer ;
       Var
         L:ListPTR;
       Begin
         L:=Ls;
         If ( L = Nil ) then ValDernier:=-1
         Else if ( L <> Nil ) then Begin
                                     If ( L^.Suivant=Nil ) then ValDernier:=L^.A
                                     Else if L^.Suivant <> Nil then
                                     Begin
                                     While ( L <> Nil ) do
                                     Begin
                                       If ( L^.Suivant = Nil ) then
                                       ValDernier:=L^.A;
                                       L:=L^.Suivant;
                                     End;
                                     End;
                                   End;
       End;
   {------------------------------------------}
   Function Next (Var Ls:ListPTR;X:Integer):String ;
       Var
         L:ListPTR;
         I:Integer;
       Begin
         L:=Ls;
         If ( X=0 ) then Next:='Nil'
         Else If (X=1) and (L^.Suivant=Nil) then Next:='Pas De Suivant'
         Else if ( X=1) and (L^.Suivant <>Nil ) then Next :='ADRESSE DE L + 1'
         Else if ( L <> Nil ) and ( X > 1 ) then
         Begin
           For i:=1 to X-1 do L:=L^.Suivant;
           Next:='ADRESSE DE L + 1';
         End;
       End;
   {------------------------------------------}
   Function Contenu (Ls:ListPTR;X:Integer):Integer ;
       Var
         L:ListPTR;
         I:Integer;
       Begin
         L:=Ls;
         If (X=0) then Contenu:=-1
         Else if (X=1) then Contenu:=L^.A
         Else if (X>1) then
         Begin
           For i:=1 to X-1 do
           L:=L^.Suivant;
           Contenu:=L^.A;
         End;
       End;
   {------------------------------------------}
   Function Taille (Ls:ListPTR):Integer ;
       Var
         I:Integer;
         L:ListPTR;
       Begin
         I:=1;
         L:=LS;
         If ( L = Nil ) then Taille:=0
         Else if ( L <> Nil ) then
                              Begin
                                While ( L^.Suivant <> Nil ) Do
                                Begin
                                  I:=I+1;
                                  L:=L^.Suivant;
                                End;
                                Taille:=I;
                              End;
       End;
   {------------------------------------------}
    Procedure Afficher (Ls:ListPTR);
       Begin
         If ( Ls = Nil ) then Writeln('Nil')
         Else if ( Ls <> Nil ) then
         Begin
           While ( Ls<>Nil ) do
           Begin
             Write(Ls^.A,'  ');
             Ls:=Ls^.Suivant;
           End;
         End;
         Writeln;
       End;
   {------------------------------------------}
   Function SupprimerPremier(Var Ls:ListPTR):ListPTR;
       Var
         L:ListPTR;
       Begin
         If ( Ls = Nil ) then SupprimerPremier:=Nil
         Else If ( Ls <> Nil ) and (Ls^.Suivant = Nil ) then
                                                      Begin
                                                      Ls:=Nil;
                                                    {  Dispose(Ls^.suivant);
                                                      Dispose(Ls);   }
                                                      SupprimerPremier:=Nil;
                                                      End
         Else if ( Ls <> Nil ) and (Ls^.Suivant <> Nil ) then
                                                       Begin
                                                       L:=Ls;
                                                       Ls:=Ls^.Suivant;
                                                       Dispose(L);
                                                       SupprimerPremier:=Ls;
                                                       End;
       End;
   {------------------------------------------}
   Function SupprimerDernier (Var Ls:ListPTR):ListPTR ;
       Var
         L,T: ListPTR;
       Begin
         T:=Ls;
         If ( Ls = Nil )  then SupprimerDernier:=Nil
         Else if ( Ls <> Nil ) and ( Ls^.Suivant = Nil ) then
                                                           Begin
                                                             Ls:=Nil;
                                                           {  Dispose ( Ls);}
                                                             SupprimerDernier:=Nil;
                                                           End
         Else if ( Ls <> Nil ) and ( Ls^.Suivant <> Nil )  then
                                                            Begin
                                                              While ( Ls^.Suivant<> Nil ) do
                                                              Begin
                                                                If ( Ls^.Suivant^.Suivant = Nil ) then
                                                                Begin
                                                                   L:=Ls;
                                                                   Ls:=Ls^.Suivant;
                                                                   Ls^.Suivant:=Nil;
                                                                  { Dispose(Ls^.Suivant);  }
                                                                   Ls:=Nil;
                                                                 {  Dispose ( Ls );    }
                                                                   L^.Suivant := Nil ;
                                                                end
                                                                else Ls:=Ls^.suivant;
                                                              End;
                                                            End;
         Ls:=T;
       End;
   {------------------------------------------}
 {  Function Check ( L : ListPTR ; X:ListPTR ) : Boolean ;
            Begin
              Check:=False;
              While ( L ^.Suivant <> Nil ) do
              Begin
                If ( L = X ) then check := True
                Else L:=L^.Suivant ;
              End;
            End;    }
   {------------------------------------------}
   Function SupprimerSuivant (Var Ls:ListPTR;X:Integer):String ;
       Var
         S,A,T:ListPTR;
         I:Integer;
       Begin
       T:=Ls;
       If ( Ls = Nil )  then SupprimerSuivant:='Liste Vide'
       Else if (Ls<>Nil) and (Ls^.Suivant=Nil) then SupprimerPremier(Ls)
       Else if (Ls<>Nil) and (Ls^.Suivant=Nil) and (X=Taille(Ls)) then SupprimerDernier(Ls)
       Else If (Ls<> Nil ) and (Ls^.Suivant <> Nil ) then
                                      Begin
                                        For i:=1 to X-2 do
                                        Ls:=Ls^.Suivant;
                                        A:=Ls^.Suivant;
                                        S:=A^.Suivant;
                                        Ls^.Suivant:=Nil;
                                        A^.Suivant:=Nil;
                                        A:=Nil;
                                     {   Dispose(A);}
                                        Ls^.Suivant:=S;
                                        S:=Nil;
                                      {  Dispose(S); }
                                        Ls:=T;
                                      End;
       End;
   {------------------------------------------}
   Procedure AjouterApres (Var Ls:ListPTR;X:Integer;Y:Integer);
       Var
         R,I:Integer;
         L,T,W:ListPTR;
       Begin
         L:=Ls;
         R:=0;
         If ( Ls = Nil ) and ( Y = 1 ) then
                                            Begin
                                              New(Ls);
                                              Ls^.A:=X;
                                              Ls^.Suivant:=Nil;
                                            End
         Else If ( Ls <> Nil ) then
         Begin
           for i:=1 to Y-1 Do
           Ls:=Ls^.suivant;
           If ( Ls^.Suivant = Nil ) then
           Begin
             New(Ls^.Suivant);
             Ls:=Ls^.Suivant;
             Ls^.A:=X;
             Ls^.Suivant:=Nil;
             Ls:=L;
           End
           Else If ( Ls^.Suivant <> Nil ) then
           Begin
             T:=L;
             For i:=1 to Y do T:=T^.Suivant;
             New(W);
             W^.A:=X;
             New(W^.Suivant);
             W^.Suivant:=T;
             Ls^.Suivant:=Nil;
             Ls^.Suivant:=W;
             Ls:=L;
             W:=Nil;
             W^.Suivant:=Nil;
             T:=Nil;
             T^.Suivant:=Nil;
           End;
         End;
       End;
   {------------------------------------------}
   Procedure AjouterAvant (Var Ls:ListPTR;X:Integer;Y:Integer);
       Var
         R,I:Integer;
         L,T,W:ListPTR;
       Begin
         L:=Ls;
         R:=0;
         If ( Ls = Nil ) and ( Y = 1 ) then
                                            Begin
                                              New(Ls);
                                              Ls^.A:=X;
                                              Ls^.Suivant:=Nil;
                                            End
         Else If ( Ls <> Nil ) then
         Begin
           If ( Y=1 ) then
           Begin
             Ls:=L;
             New(W);
             New(W^.Suivant);
             W^.A:=X;
             W^.Suivant:=Ls;
             Ls:=W;
           End
           Else
           Begin
           for i:=1 to Y-2 Do
           Ls:=Ls^.suivant;
           If ( Ls^.Suivant = Nil ) then
           Begin
             New(Ls^.Suivant);
             Ls:=Ls^.Suivant;
             Ls^.A:=X;
             Ls^.Suivant:=Nil;
             Ls:=L;
           End
           Else If ( Ls^.Suivant <> Nil ) then
           Begin
             T:=L;
             For i:=1 to Y-1 do T:=T^.Suivant;
             New(W);
             W^.A:=X;
             New(W^.Suivant);
             W^.Suivant:=T;
             Ls^.Suivant:=Nil;
             Ls^.Suivant:=W;
             Ls:=L;
             W:=Nil;
             W^.Suivant:=Nil;
             T:=Nil;
             T^.Suivant:=Nil;
           End;
          End;
         End;
       End;
   {------------------------------------------}
   {----------------- Debut Du Programme -------------------------}
   Var
     I,N,Y,Z,X,T:Integer;
     L,Ls:ListPTR;
   Begin
     Randomize;
     {---------Remplir La List --------------}
     New(L);
     Ls:=L;
     Writeln('Tapez ici la taille de votre liste');
     Readln(N);
     If N = 0 then Ls:=Nil
     Else If N = 1 then Begin
                     L^.A:=Random(100)+20;
                     L^.Suivant:=Nil;
                   End
     Else if N <> 1 then
     Begin
       For i:=1 to N-1 do
       Begin
         L^.A:=Random(100)+20;
         New(L^.Suivant);
         L:=L^.Suivant;
       End;
     L^.A:=random(100);
     L^.Suivant:=Nil;
     L:=Ls;
     End;
     {---------Choisir La Fonction ----------}
     For i:=1 to 42 do
     Begin
       Writeln('Tapez Ici La fonction que vous voulez utulizer sur cette liste');
       Readln(Z);
    {   Ls:=L;  }
       Case Z of
       1:Writeln(AdrPremier(Ls));
       2:Writeln(ValPremier(Ls));
       3:Writeln(AdrDernier(Ls));
       4:Writeln(ValDernier(Ls));
       5:Begin
           Writeln('Tapez ici le nemuro de votre element X');
           Readln(X);
           While (X>N) or (X<0) do
           Begin
             Writeln('Tapez un nemuro qui existe dans la liste');
             Readln(X);
           End;
           Writeln(Next(Ls,X));
         End;
       6:Begin
           Writeln('Tapez ici le nemuro de votre element X');
           Readln(X);
           While (X>N) or (X<0) do
           Begin
             Writeln('Tapez un nemuro qui existe dans la liste');
             Readln(X);
           End;
           Writeln(Contenu(Ls,X));
         End;
       7:Writeln(Taille(Ls));
       8:SupprimerPremier(Ls);
       9:SupprimerDernier(Ls);
       10:Begin
            Writeln('Tapez ici le nemuro de votre element X');
            Readln(X);
            While (X>N) or (X<0) do
            Begin
               Writeln('Tapez un nemuro qui existe dans la liste');
               Readln(X);
            End;
            Writeln(SupprimerSuivant(Ls,X));
          End;
       11:Begin
             Writeln('Tapez ici Le nemuro que vous voulez le inserer');
             Readln(Y);
             Writeln('Tapez ici le nemuro de votre Rang pour Ajouter le Y apres');
             Readln(X);
             While (X>N) and (X<0) and (X<>1) do
             Begin
               Writeln('Tapez un nemuro qui existe dans la liste');
               Readln(X);
             End;
             AjouterApres(Ls,Y,X);
          End;
       12:Begin
             Writeln('Tapez ici Le nemuro que vous voulez le inserer');
             Readln(Y);
             Writeln('Tapez ici le nemuro de votre Rang pour Ajouter le Y Avant');
             Readln(X);
             While (X>N) and (X<0) and (X<>1) do
             Begin
               Writeln('Tapez un nemuro qui existe dans la liste');
               Readln(X);
             End;
             AjouterAvant(Ls,Y,X);
          End;
     {  13:
       14:}
       15:Afficher(Ls);
       End;
     End;
   Readln;
   End.

