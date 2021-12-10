procedure array1d is

  type Vector is array (Integer range <>) of Float; 

   subtype Index_Range_1 is Integer range 1..10;

   v1: Vector (Index_Range_1);
   v2: Vector (v1'Range);
begin
  null; 
end array1d;
