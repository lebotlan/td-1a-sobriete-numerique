with Vocal ; use Vocal ;

-- Ce package permet de compresser des morceaux audio dans le format OGG.
package Compression is
         
   -- Compresse les données du tableau d'entrée. 
   -- Renvoie un nouveau tableau environ 15 fois plus petit.
   function Compresser(Entree : T_Tab) return T_Tab ;
   
   -- Détection de silence au début du tableau.
   -- Renvoie l'index de fin du silence / début du son.
   function Silence_Debut(Tab : T_Tab) return Integer ;
   
   -- Idem pour du silence à la fin du tableau
   -- Renvoie l'index de fin du son / début du silence.
   function Silence_Fin(Tab : T_Tab) return Integer ;
   
end Compression ;
