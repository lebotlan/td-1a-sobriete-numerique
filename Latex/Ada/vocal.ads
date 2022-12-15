package Vocal is

   -- Un son non compressé est une suite d'échantillons (un tableau d'entiers)
   type T_Tab is array(Integer range <>) of Integer ;

   -- Cette fonction enregistre un message vocal et le renvoie sous forme de tableau T_Son
   -- Les cases du tableau sont numérotées à partir de 0.
   -- Par chance, la taille du tableau est toujours un multiple de Taille_Segment_Entree
   -- (voir l'acteur Compression).
   function Enregistrer_Vocal return T_Tab ;
   
   -- Envoie un son au destinataire prévu.
   -- Le son peut être compressé ou non compressé.
   -- En version compressée, le tableau Son doit contenir tous les segments compressés à la suite
   -- (voir l'acteur Compression).
   procedure Envoyer_Son(Son : T_Tab) ;

end Vocal ;   
