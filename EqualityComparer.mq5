
#include <Generic\HashMap.mqh>

class Sample : public IEqualityComparable<Sample*>
{
private:
   int m_data;

public:
   Sample(int data) : m_data(data) {}
   ~Sample() {}
  
   bool              Equals(Sample* value) 
   {
     return this.m_data == value.m_data;
   }
   int               HashCode(void)
   {
     return this.m_data;
   }
};

void OnInit()
{
  CHashMap<Sample*, int> sampleData();
  
  Sample s1(32), s2(40), s3(44);
  
  sampleData.Add(&s1, 32);
  sampleData.Add(&s2, 40);
  sampleData.Add(&s3, 44);
  
  Sample s4(32);
  
  int val;
  
  if (sampleData.TryGetValue(&s4, val))
    Print(val);
  else
    Print("Could not be found.");
}
