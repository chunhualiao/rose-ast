-- focus on integer with range, subtype translation
-- with myarrays;
-- use myarrays;

-- This procedure demonstrates calling overloaded "+" operations on
-- Scalar, Vector, and Matrix type objects.

procedure Demo_myarrays1 is
--   Scalar_1 : Scalar;
--   Scalar_2 : Scalar;
--   Scalar_3 : Scalar;

   subtype Index_Range_1 is Integer range 1..10;
--   subtype Index_Range_2 is Integer range 1..100;

     var1: Index_Range_1; 
--   Vector_1 : Vector (Index_Range_1);
--   Vector_2 : Vector (Index_Range_1);
--   Vector_3 : Vector (Index_Range_1);

--   Matrix_1 : Matrix (Index_Range_1, Index_Range_2);
--   Matrix_2 : Matrix (Index_Range_1, Index_Range_2);
--   Matrix_3 : Matrix (Index_Range_1, Index_Range_2);
begin
    var1 :=1; 
--   Scalar_1 := 1.0;
--   Scalar_2 := 2.0;
--   Scalar_3 := Scalar_1 + Scalar_2;

--   for Index in Index_Range_1 loop
--      Vector_1 (Index) := 1.0;
--   end loop;
--   Vector_2 := (others => 2.0);
--   Vector_3 := Vector_1 + Vector_2;

--   for Index_1 in Index_Range_1 loop
--      for Index_2 in Index_Range_2 loop
--         Matrix_1 (Index_1, Index_2) := 1.0;
--      end loop;
--   end loop;
--   Matrix_2 := (others => (others => 2.0));
--   Matrix_3 := Matrix_1 + Matrix_2;
end Demo_myarrays1; 
