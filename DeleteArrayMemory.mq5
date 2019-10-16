
void OnInit()
{
  MyClass* data[];
  
  ArrayResize(data, 5);
  
  for (int i = 0; i < 5; i++)
  {
    data[i] = new MyClass();
  }
  
  for (int i = 0; i < 5; i++)
  {
    delete data[i];
  }
}

class MyClass
{
  public:
    MyClass() { Print("Constructor."); }
    ~MyClass() { Print("Destructor."); }
};
