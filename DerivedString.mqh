
#include <Strings\String.mqh>

class String : public CString 
{
  public:
    String(string str) : CString() { m_string = str; }
    String() : CString() { m_string = ""; }
  
    string Slice(int start, int end)
    {
      int len = StringLen(m_string);
      
      if (start < 0 || end > len)
      {
        return "";
      }
      
      return Substr(start, end - start);
    }
    
    string Substr(int start, int length)
    {
      return StringSubstr(m_string, start, length);
    }
};
