
#include <Trade\Trade.mqh>

CTrade trade;

class Person
{
  private: 
    string m_name;
    int m_age;
    
  public:
    Person(string name, int age) : 
                              m_name(name), 
                              m_age(age) { Print("Constructor"); }
    ~Person() { Print("Destructor"); }
    
    string getName() {return m_name;}
    int getAge() {return m_age;}
};

void OnInit()
{
  while (true)
  { 
    Person person("name", 24);
    
    Sleep(100); 
  }
}

