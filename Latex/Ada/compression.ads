with Vocal ; use Vocal ;

-- Ce package permet de compresser des morceaux audio dans le format OGG.
package Compression is
   
   -- La fonction de compression prend un tableau d'entrée appelé segment
   -- et renvoie un segment compressé 15 fois plus petit.
   
   Taux_Compression : constant Integer := 15 ;   
   
   -- Le segment d'entrée a une taille de 4096 entiers.
   Taille_Segment_Entree : constant Integer := 4096 ;
   
   Taille_Segment_Sortie : constant Integer := Taille_Segment_Entree / Taux_Compression ;
   
   -- Compresse les données du segment d'entrée. 
   --   Le segment d'entrée doit avoir une taille égale à Taille_Segment_Entree ;
   --   Renvoie un nouveau segment compressé, numéroté à partir de 0.
   --   La taille du segment compressé est Taille_Segment_Sortie
   function Compresser(Entree : T_Tab) return T_Tab ;
   
end Compression ;
