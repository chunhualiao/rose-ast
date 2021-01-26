package body myarrays is

-- Vector addition
  function "+"  
            (Left  : in Vector;  
             Right : in Vector) return Vector is

    Result : Vector (Left'Range) := Left;

  begin

    -- Add as many individual elements of the input vectors together as are contained in
    -- the input vector LEFT to compute the resulting vector and return the result to the caller.
    for I in Result'Range loop
      Result (I) := Result (I) + Right (I);
    end loop;

    return Result;

  end "+";

-- Matrix addition
  function "+"  
             (Left  : in Matrix;  
              Right : in Matrix) return Matrix is
 
     Result : Matrix (Left'Range (1),  
                      Left'Range (2)) := Left;
 
   begin 
 
     -- Add as many individual elements of the input matrices together as are contained in
     -- the input matrix LEFT to compute the resulting matrix and return the result to the caller.
     for Row in Result'Range (1) loop
       Loop_Column:
         for Column in Result'Range (2) loop
           Result (Row, Column) := Result (Row, Column) + Right (Row, Column);
         end loop Loop_Column;
 
     end loop;
 
     return Result;
 
   end "+";


end myarrays; 
