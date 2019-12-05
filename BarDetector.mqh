#include <Generic\HashMap.mqh>

class BarDetector
{
  private:
    CHashMap<string, datetime> m_lastbars;
    
    string GetUniqueHash(string symbol, ENUM_TIMEFRAMES timeframe)
    {
      return symbol + EnumToString(timeframe);
    }
    
  public:
    bool IsNewBar(string symbol, ENUM_TIMEFRAMES timeframe)
    {
      string hash = GetUniqueHash(symbol, timeframe);
      datetime current = iTime(symbol, timeframe, 0);
      datetime last;
      
      if (!m_lastbars.TryGetValue(hash, last))
      {
        m_lastbars.Add(hash, current);
        return false;
      }
      
      if (last != current)
      {
        m_lastbars.Remove(hash);
        m_lastbars.Add(hash, current);
        return true;
      }
      
      return false;
    }
};
