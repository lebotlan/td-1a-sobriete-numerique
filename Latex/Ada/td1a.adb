with Texte ;

--with Gada.Text_IO ;

procedure TD1a is
   
   package T renames Texte ;
   
   function Chercher_Destinataire (Message : String) return Integer is
      Trouve : Boolean := False ;
      Index : Integer := Message'First ;
      Resultat : Integer := 0 ;
   begin
      while (not Trouve) and Index <= Message'Last loop
	 
	 if Message(Index) = '@' then
	    Resultat := Index ;
	    Trouve := True ;
	 else
	    Index := Index + 1 ;
	 end if ;
	 
      end loop ;
      
      return Resultat ;
   end Chercher_Destinataire ;
     
	  
   Pos : Integer ;
   Message : String := T.Lire_Champ_Texte ;
begin
  -- Gada.Text_Io.Put_Line("Message'first = " & Message'First'image) ;
   
   -- Question 1.2
   Pos := Chercher_Destinataire(Message) ;
   
   if Pos > 0 then
      Envoyer_Texte(Message, Pos) ;
   end if ;
      
end TD1a ;
