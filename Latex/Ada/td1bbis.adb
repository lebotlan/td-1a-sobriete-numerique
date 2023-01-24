with Vocal ;
with Compression ;

procedure TD1b is
   
   package V renames Vocal ;
   package K renames Compression ;
   
   -- Question 2.2
   -- SPos : position dans la source
   -- DPos : position dans la destination
   procedure Copier(Source : V.T_Tab ; SPos : Integer ; Len : Integer ; Dest : in out V.T_Tab ; DPos : Integer) is
   begin
      for I in 0..Len - 1 loop
         Dest(DPos + I) := Source(SPos + I) ;
      end loop ;
   end Copier ;
   
   -- Question 2.3
   function Tout_Compresser(Son : V.T_Tab) return V.T_Tab Is
      
      -- On connait par avance la taille du tableau compressé.
      Resultat : V.T_Tab(0 .. Son'Length / K.Taux_Compression - 1) ;
      
      -- Nombre de segments
      -- Pour rappel, Son'length est un multiple de Taille_Segment_Max.
      N_Morceaux : Integer := Son'Length / K.Taille_Segment_Entree ;
      
      -- Segment d'entrée utilisé par le compresseur.
      Segment : V.T_Tab (0..K.Taille_Segment_Entree - 1) ;
      
      -- Segment de sortie
      Sortie : V.T_Tab (0..K.Taille_Segment_Sortie - 1) ;
   begin
      
      -- Découpe en segments
      for N in 0 .. N_Morceaux - 1 loop
         
         Copier(Son, N * K.Taille_Segment_Entree, K.Taille_Segment_Entree, Segment, 0) ;
         Sortie := K.Compresser(Segment) ;
         Copier(Sortie, 0, K.Taille_Segment_Sortie, Resultat, N * K.Taille_Segment_Sortie) ;
         
      end loop ;
      
      return Resultat ;
   end Tout_Compresser ;
   
   Son : V.T_Tab := Vocal.Enregistrer_Vocal ;
begin
   Vocal.Envoyer_Son(Son) ;
   -- ou
   Vocal.Envoyer_Son( Tout_Compresser(Son) ) ;   
end TD1b ;
