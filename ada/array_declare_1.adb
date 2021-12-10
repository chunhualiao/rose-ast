--  simplest constrained array 
procedure array_declare_1  is 
    -- A CONSTRAINED array type.  Bounds can be any values
    type My_C_Array_T is array(-3 .. 3) of Natural;

    -- A named array type as a parameter
    procedure operate1(a: in out My_C_Array_T) is 
    begin
        for i in -3 .. 3 loop
            a(i) := a (i) +1;
        end loop;
    end operate1;

    -- a3 has a named array type 
    a3: My_C_Array_T;

begin

    a3 := (-2 | 2 => 1, others => 0);   -- Aggregate assignment

    operate1(a3);
end array_declare_1;
