package Constants is
Max_Entries: constant  Integer := 400;
Avogadros_Number: constant  Float := 6.022137 * 10 ** 23;
Bytes_Per_Page: constant  Integer := 512;
Pages_Per_Buffer: constant  Integer := 10;
Buffer_Size: constant  Integer := Pages_Per_Buffer * Bytes_Per_Page;
Buffer_Size10: constant  Integer := 5_120;
New_Character: constant  Character := '$';
end Constants;
