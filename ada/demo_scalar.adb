--with myarrays;
-- use myarrays;

procedure Demo_scalar is
   subtype Double_Type is Standard.Long_Float;
   subtype Scalar is Double_Type;

   Scalar_1 : Scalar;
   Scalar_2 : Scalar;
   Scalar_3 : Scalar;

begin
   Scalar_1 := 1.0;
   Scalar_2 := 2.0;
   Scalar_3 := Scalar_1 + Scalar_2;

end Demo_scalar; 
