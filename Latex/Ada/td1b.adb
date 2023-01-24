with Vocal ;
with Compression ;

procedure TD1b is
   
   package V renames Vocal ;
   package K renames Compression ;
   
   function Rogner(Tab : V.T_Tab) return V.T_Tab is
      -- Debut et fin du son à garder
      Debut : Integer := K.Silence_Debut(Tab) ;
      Fin : Integer := K.Silence_Fin(Tab) ;
      
      -- 250ms en nombre de cases
      Marge : Integer := (V.F_Echantillonnage * 250) / 1000 ;
   begin      
      --------------------------------------------------------
      -- Bonus : on élargit de 250ms.   (Facultatif)
      Debut := Debut - Marge ;      
      if Debut < 0 then Debut := 0 ; end if ;
      
      Fin := Fin + Marge ;
      if Fin > Tab'Last then Fin := Tab'Last ; end if ;
      -------------------------------------------------------
      
      -- Donner le bloc declare si besoin      
      declare
         Resultat : V.T_Tab(Debut .. Fin) ;
      begin
         for Index in Resultat'Range loop
            Resultat(Index) := Tab(Index) ;
         end loop ;
            
         return Resultat ;
      end ;
      
      
      -- Variante avec des cases numérotées depuis 0
      declare
         Longueur : Integer := Fin - Debut + 1 ;
         Resultat : V.T_Tab(0 .. Longueur - 1) ;
      begin
         for Index in Resultat'Range loop
            Resultat(Index) := Tab(Debut + Index) ;
         end loop ;
            
         return Resultat ;
      end ;
      
   end Rogner ;
   
   Son : V.T_Tab := Vocal.Enregistrer_Vocal ;
begin
   Vocal.Envoyer_Son(Son) ;
   -- ou
   Vocal.Envoyer_Son( K.Compresser( Rogner(Son) ) ) ;
end TD1b ;
