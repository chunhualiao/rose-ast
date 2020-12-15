function Compute(x, y: IN Integer) return Integer is
   Result : Integer;
   I      : Integer;
   J      : Integer;
begin
   Result := 0;
   I := X;

   Outer:
   loop
     J := Y;
     while J > X loop
       Result := Result + 1;
       exit Outer when I mod J = 2;
       J := J-1;
     end loop;
     I := I+1;
   end loop Outer;

   return Result;
end Compute;
