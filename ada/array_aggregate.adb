procedure array_aggregate is
  type Table    is array(1 .. 10) of Integer;

-- Examples of aggregates as initial values: 
-- A is a table, with initial values as indicated in array aggreates
--  A : Table := (7, 9, 5, 1, 3, 2, 4, 8, 6, 0);        -- A(1)=7, A(10)=0
  B : Table := (2 | 4 | 10 => 1, others => 0);        -- B(1)=0, B(10)=1
begin 

  null;

end array_aggregate;
