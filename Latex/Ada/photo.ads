package Photo is
   
   -- Un pixel coloré.
   type T_Couleur is record
      Rouge, Vert, Bleu : Integer range 0..255 ;
   end record ;   
   
   -- Une image (une photo) est une matrice
   type T_Image is array(Integer range <>, Integer range <>) of T_Couleur ;
   
   -- Prend une photo dès que l'utilisateur presse le bouton.
   function Prendre_Photo return T_Image ;
   
   -- Coordonnées d'un cadre (deux coins opposés).   
   type T_Cadre is record
      -- Position du premier coin
      X1, Y1 : Integer ;      
      -- Position du coin opposé, avec X1 < X2  et Y1 < Y2
      X2, Y2 : Integer ;
   end record ;
   
   -- Indique si l'image contient un symbole de cadre fait avec les mains.
   function Contient_Symbole_Cadre(Img : T_Image) return Boolean ;
   
   -- Si l'image contient un cadre, renvoie les coordonnées de ce cadre.
   function Cadre(Img : T_Image) return T_Cadre ;  
   
   function Compresser(Img : T_Image) return T_Image ;
   
   -- Envoie une image compressée ou non.
   procedure Envoyer_Image(Img : T_Image) ;
   
end Photo ;
