with Gada.Text_Io ;
use Gada.Text_Io ;

package body Photo is
   
   function Prendre_Photo return T_Image is
      Img : T_Image(0..319, 0..479) := (others => (others => (5,6,7))) ;
   begin
      Put_Line("Prendre une photo ... fait !") ;
      return Img ;
   end Prendre_Photo ;
   
   function Contient_Symbole_Cadre(Img : T_Image) return Boolean is
   begin
      return True ;
   end Contient_Symbole_Cadre ;
   
   function Cadre(Img : T_Image) return T_Cadre is
   begin
      return (X1 => 26, Y1 => 62, X2 => 448, Y2 => 280) ;
   end Cadre ;
   
   function Compresser(Img : T_Image) return T_Image is
      Tab : T_Image(0..100, 0..120) := (others => (others => (41,42,43))) ;
   begin
      return Tab ;
   end Compresser ;
   
   procedure Envoyer_Image(Img : T_Image) is
   begin
      Put_Line("Envoi de l'image compressée.") ;
      New_Line ;
   end Envoyer_Image ;
   
end Photo ;
