package body Compression is

   function Compresser( Entree : T_Tab ) return T_Tab is
      Segment : T_Tab(0..Entree'Length/15-1) := (others => 99) ;
   begin
      return Segment ;
   end Compresser ;
   
   function Silence_debut(Tab : T_Tab) return Integer is
      Index : Integer := Tab'Length - 200 ;
   begin
      if Index > 0 then return Index ; else return (2 * Tab'Last) / 3 ;
      end if ;
   end Silence_debut ;
   
   function Silence_Fin(Tab : T_Tab) return Integer is
      Index : Integer := 220 ;
   begin
      if Index < Tab'last then return Index ; else return Tab'Last / 3 ;
      end if ;
   end Silence_Fin ;

   
end Compression ;
