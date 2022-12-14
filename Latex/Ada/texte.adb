with Gada.Text_Io ;

package body Texte is
   
   package Txt renames Gada.Text_Io ;
   
   function Lire_champ_texte return String is
   begin
      return "Un message envoyé @joe, @max, et @doe." ;
   end Lire_Champ_Texte ;

   procedure Envoyer_Texte_old(Message : String ; Pos_Destinataire : Integer) is
   begin
      Txt.Put_Line("Envoyer message : " & Message & " Pos Destinataire = " & Pos_Destinataire'image) ;
   end Envoyer_Texte_old ;
   
   procedure Envoyer_Texte(Message : String ; Nb_Destinataires : Integer) is      
   begin
      Txt.Put_Line("Envoyer message : " & Message & "  " & Nb_Destinataires'Image & " destinataires.") ;
   end Envoyer_Texte ;
   
   function Est_Alphanum(C : Character) return Boolean is
   begin
      
      case C is
	 when '0'..'9' => return True ;
	 when 'A'..'Z' => return True ;
	 when 'a'..'z' => return True ;
	 when '@' => return True ;
	 when others => return False ;
      end case ;
      
   end Est_Alphanum ;
   
end Texte ;
