
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
    
    static string Join(string &arr[], char ch)
    {
      string value = "";
      int size = ArraySize(arr);
        
      for (int i = 0; i < size; i++)
      {
        if (i != 0)
          value += CharToString(ch);
        
        value += arr[i];
      }
        
      return value;
    }
    
};
