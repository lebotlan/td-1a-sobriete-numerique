with Texte ;

procedure TD1a is
   
   package T renames Texte ;
   
   function Compter (Message : String) return Integer is
      Total : Integer := 0 ;
   begin
      for Index in Message'Range loop
	 
	 if Message(Index) = '@' then
	    Total := Total + 1 ;
	 end if ;
	 
      end loop ;
      
      return Total ;
   end Compter ;     
	  
   Message : String := T.Lire_Champ_Texte ;
   
begin
   T.Envoyer_Texte(Message, Compter(Message)) ;      
end TD1a ;
