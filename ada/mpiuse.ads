with Ada.Real_Time;
with Ada.Unchecked_Deallocation;
with System;
package MPI is
package ART renames Ada.Real_Time;
type Request is  private;
type Comm_Type is  private;
COMM_WORLD: constant  Comm_Type;
type Comm_Buffer is  array of -- void
;
type Comm_Buffer_Access isnew  -- void
;
type errorcode_Type isnew  Integer;
type Datatype_Type isnew  -- void
;
type Reduce_Op_Type isnew  -- void
;
type Rank_Type isnew  Integer;
end MPI;
with MPI;
package MPIUse is
flag:  errorcode_Type :=  errorcode_Type(- 2);
end MPIUse;
