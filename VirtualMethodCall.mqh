
#include <Trade\Trade.mqh>

class MyClass : public CObject
{
  private:
    int value;

  public:
    MyClass(int val) {this.value=val;}
  
    int Compare(const CObject *node,const int mode=0) const 
    {
      return this.value - ((MyClass*)node).value;
    }
};

void OnInit()
{
  MyClass* cls1 = new MyClass(5);
  MyClass* cls2 = new MyClass(-52);
  MyClass* cls3 = new MyClass(99);
  
  int compare1 = cls1.Compare(cls2);
  
  Print(compare1);
}
