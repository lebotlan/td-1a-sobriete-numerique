package Vocal is
   
   -- Les sons sont échantillonnés à 44000 Hz.
   F_Echantillonnage : constant Integer := 44000 ;
   
   -- Un son non compressé est une suite d'échantillons (un tableau d'entiers)
   type T_Tab is array(Integer range <>) of Integer ;

   -- Cette fonction enregistre un message vocal et le renvoie sous forme de tableau T_Tab
   -- Les cases du tableau sont numérotées à partir de 0.
   function Enregistrer_Vocal return T_Tab ;
   
   -- Envoie un son au destinataire prévu.
   -- Le son peut être compressé ou non compressé.
   procedure Envoyer_Son(Son : T_Tab) ;

end Vocal ;   
