package my2darrays is

  type Matrix is array (Integer range <>, Integer range <>) of Float; 

  function "+"  
            (Left  : in Matrix;  
             Right : in Matrix) return Matrix;

end my2darrays; 
