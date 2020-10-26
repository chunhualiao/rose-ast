package Parent is
Usage_Error:  Exception;
end Parent;
package Parent.Child is
type Domain_Member is  private;
private
type Domain_Member isnew  Integer;
end Parent.Child;
