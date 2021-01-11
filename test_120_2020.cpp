// Test the handling of private typedef types
template < typename T>
class list
{
  public:
    class iterator
    {
      public:
        bool operator!=(const iterator & x) const;
    };
};

class A
{
  public:
    void foobar();
  private:
    struct B{};
    typedef list<B>::iterator BListIter;
    list<B>::iterator test1;
};

void A::foobar()
{
  BListIter bListIter;
  bool abvar;
#pragma rose_outline
  abvar = (bListIter != bListIter);
}
