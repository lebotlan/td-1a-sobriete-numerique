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
   
   -- Question 2.1
   Vocal.Envoyer_Son(Son) ;
   
   -- Taille du tableau : 2 octets/echantillons * 44000 echantillons/s * 3s = 264 000 octets  envoyés.
   -- 4000 fois plus que le message texte
   
   -- Question 2.3
   Vocal.Envoyer_Son( Tout_Compresser(Son) ) ;
   
   -- Taille du tableau : 15 fois moins, i.e. 17 600 octets.
   -- 280 fois plus que le message texte.
      
end TD1b ;
