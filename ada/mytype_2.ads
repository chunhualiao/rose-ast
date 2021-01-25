package Mytype is

  type Unsigned_Long_Word is mod (2 ** 32);
  for Unsigned_Long_Word'Size use 32;
 
end Mytype; 
