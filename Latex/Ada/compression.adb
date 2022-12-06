package body Compression is

   function Compresser( Entree : T_Tab ) return T_Tab is
      Segment : T_Tab(0..Entree'Length/15-1) := (others => 99) ;
   begin
      return Segment ;
   end Compresser ;
   
end Compression ;
