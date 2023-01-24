with Photo ;

procedure TD1c is
   
   package P renames Photo ;
   
   function Recadrer (Img : P.T_Image) return P.T_Image is
      
      Pos : P.T_Cadre ;
      Largeur, Hauteur : Integer ;
      
   begin 
      if P.Contient_Symbole_Cadre(Img) then
         
         Pos := P.Cadre(Img) ;
         
         -- Taille de la nouvelle image
         Largeur := Pos.X2 - Pos.X1 + 1 ;
         Hauteur := Pos.Y2 - Pos.Y1 + 1 ;
         
         -- Nouvelle Image
         -- (Donner le bloc declare... ah, les joies de Ada.)
         declare
            -- Attention : ligne,colonne
            Img2 : P.T_Image(0..Hauteur-1, 0..Largeur-1) ;
         begin
            for Y in Img2'Range(1) loop
               for X in Img2'Range(2) loop
                  Img2(Y,X) := Img(Pos.Y1 + Y, Pos.X1 + X) ;
               end loop ;
            end loop ;
            
            return Img2 ;
         end ;
      else
         -- Impossible de mettre un seul return à la fin du programme, 
         -- car les deux images n'ont pas la même taille. Une unique variable ne convient pas.
         return Img ;
      end if ;
      
   end Recadrer ;
   
   -- Ces définitions ne nécessitent pas de connaître la taille des images,
   -- car l'affectation est immédiate, sur la même ligne.   
   Image : P.T_Image := P.Prendre_Photo ;
   
   Image_Cadree : P.T_Image := Recadrer(Image) ;
   
   Image_Compressee : P.T_Image := P.Compresser(Image_Cadree) ;      
   
begin   
   P.Envoyer_Image(Image_Compressee) ;   
   
   -- Alternative en une seule ligne :
   P.Envoyer_Image( P.Compresser( Recadrer (P.Prendre_Photo) ) ) ;
   null ;
end TD1c ;
