procedure Demo_myarrays3_1 is

   --  array type of unspecified ranges
   type Vector is array (Integer range <>) of Standard.Long_Float;


   -- array type with explicit range information
   -- we want to obtain the explicit range, not the range of its base Vector type!!
   subtype Index_Range_1 is Integer range 1..10;
   Vector_2 : Vector (Index_Range_1);

begin

   Vector_2 := (others => 2.0);

end Demo_myarrays3_1;
