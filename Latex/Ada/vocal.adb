with Gada.Text_IO ;
with Compression ;
use Compression ;

package body Vocal is
   
   package Txt renames Gada.Text_Io ;
   
   function Enregistrer_Vocal return T_Tab is
      Son : T_Tab(0..1000) := (others => 14) ;
   begin
      return Son ;
   end Enregistrer_Vocal ;

   procedure Envoyer_Son(Son : T_Tab) is
   begin
      Txt.Put_Line("Son envoyé : " & Integer'image(Son'Length) & " octets.") ;
   end Envoyer_Son ;

end Vocal ;
