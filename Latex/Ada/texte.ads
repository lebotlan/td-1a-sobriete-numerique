package Texte is
   
  -- Renvoie le texte tapé par l'utilisateur
  function Lire_champ_texte return String ;
  
  -- Envoie un message. 
  -- Pos_Destinataire indique à quelle position se trouve le '@' du destinataire dans le message.
  procedure Envoyer_texte(Message : String ; Pos_Destinataire : Integer) ;
  
end Texte ;
