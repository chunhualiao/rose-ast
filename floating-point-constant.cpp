#if 0
#include<iostream>
#include <cstdint> // for std::int_fast64_t
using namespace std;
// note: exp must be non-negative
// This can easily overflow for large exp value!!
std::int_fast64_t pow(int base, int exp)
{
    std::int_fast64_t result{ 1 };
    while (exp)
    {
        if (exp & 1)
            result *= base;
        exp >>= 1;
        base *= base;
    }
 
    return result;
}

#endif 
namespace test
{
  double Avogadros_Number= 6.022137e+23;
// integer overflow!!
//  double Avogadros_2 = 6.022137*pow(10,23);
// this works!!  
//  double Avogadros_3 = 6.022137*1e+23;
}

#if 0
int main() {
  const float PI = 3.141;  // 3.141 is floating point constant while PI is a constant float.
  cout << PI<<endl;
  cout << test::Avogadros_Number<<endl;
  cout << test::Avogadros_2<<endl;
  cout << test::Avogadros_3<<endl;
  return 0;
}
#endif
