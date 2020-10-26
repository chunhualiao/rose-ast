package Opaque is
type Handle is  private;
NIX: constant  Handle;
private
type Handle isnew  Integer;
NIX: constant  Handle := 0;
end Opaque;
