package myarrays is
  -- 64 bit double precision floating point.
  subtype Double_Type is Standard.Long_Float;

  subtype Scalar is Double_Type;

  type Vector is array (Integer range <>) of Float;
  type Matrix is array (Integer range <>, Integer range <>) of Float; 

  function "+"  
        (Left  : in Vector;  
         Right : in Vector) return Vector;

  function "+"  
            (Left  : in Matrix;  
             Right : in Matrix) return Matrix;

end myarrays; 
