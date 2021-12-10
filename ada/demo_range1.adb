-- simplest example using range
--with Ada.Text_IO; use Ada.Text_IO;
procedure Demo_range1 is

   subtype Index_Range_1 is Integer range 1..10;
   Sum : Integer;
begin
   Sum := 0;
   for Index in Index_Range_1 loop
     Sum := Sum + Index;
   end loop;

--   Put_Line ("The value of Sum now is " & Integer'Image (Sum));
end Demo_range1;
