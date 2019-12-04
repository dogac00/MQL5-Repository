#include <Generic\HashMap.mqh>

class CIsNewBar
  {
   public:
      bool IsNewBar(string symbol, ENUM_TIMEFRAMES timeframe)
      {
        int barCount;
        int totalBars = Bars(symbol, timeframe);
        
        if (!m_bars.TryGetValue(symbol, barCount))
        {
          m_bars.Add(symbol, totalBars);
          return false;
        }
        
        if (totalBars != barCount)
        {
          m_bars.Remove(symbol);
          m_bars.Add(symbol, totalBars);
          return true;
        }
        
        return false;
      };
   
   protected: CHashMap<string, int> m_bars;
  };
