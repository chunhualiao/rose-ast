package myarraysv1 is

  -- 64 bit double precision floating point.
  subtype Double_Type is Standard.Long_Float;

  subtype Scalar is Double_Type;
  type Vector is array (Integer range <>) of Scalar;
--  type Matrix is array (Integer range <>, Integer range <>) of Scalar;

end myarraysv1; 
