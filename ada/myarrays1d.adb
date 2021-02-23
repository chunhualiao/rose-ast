package body myarrays1d is

-- Vector addition
  function "+"  
            (Left  : in Vector;  
             Right : in Vector) return Vector is

    Result : Vector (Left'Range) := Left;
  begin

    for I in Result'Range loop
      Result (I) := Result (I) + Right (I);
    end loop;

    return Result;

  end "+";

end myarrays1d; 
