procedure Demo_myarrays3 is
  type Vector is array (Integer range <>) of Float;

   subtype Index_Range_1 is Integer range 1..10;

   Vector_1 : Vector (Index_Range_1);
begin

   for Index in Index_Range_1 loop
      Vector_1 (Index) := 1.0;
   end loop;
end Demo_myarrays3;
