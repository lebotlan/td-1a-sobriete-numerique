package Texte is
   
  -- Renvoie le texte tapé par l'utilisateur
  function Lire_champ_texte return String ;
  
  -- Envoie un message. 
  -- Il faut indiquer le nombre de destinataires.
  procedure Envoyer_texte(Message : String ; Nb_Destinataires : Integer) ;
  
end Texte ;
