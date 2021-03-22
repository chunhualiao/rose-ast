package myarrays1d is
  -- 64 bit double precision floating point.
  subtype Double_Type is Standard.Long_Float;

  subtype Scalar is Double_Type;

  type Vector is array (Integer range <>) of Float;

  function "+"  
        (Left  : in Vector;  
         Right : in Vector) return Vector;

end myarrays1d; 
