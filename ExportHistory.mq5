
#include <StringBuilder.mqh>
#include <Files.mqh>
#include <Strings\String.mqh>

#import "Tasks.dll"
#import

const datetime start_date = D'2002.10.10 23:59';

string symbols_list [] =  { "EURUSD", "GBPUSD", "USDJPY", "USDCHF", "EURCHF", "JPYCHF", "XAUUSD", "NAS100_", "USDJPY", "JPYTRY" };
ENUM_TIMEFRAMES timeframes_list [] = { PERIOD_M1, PERIOD_M2, PERIOD_M3, PERIOD_M4, PERIOD_M5, PERIOD_M6, PERIOD_M10, PERIOD_M12,
                                       PERIOD_M15, PERIOD_M20, PERIOD_M30, PERIOD_H1, PERIOD_H2, PERIOD_H3, PERIOD_H4, PERIOD_H6,
                                       PERIOD_H8, PERIOD_H12, PERIOD_D1, PERIOD_W1, PERIOD_MN1 };

StringBuilder sb(3000000);

void OnInit()
{
  EventSetTimer(1);
}

void SelectSymbols()
{
  for (int i = 0 ; i < ArraySize(symbols_list); i++)
  {
    SymbolSelect(symbols_list[i], true);
  }
}

void OnTimer()
{
  if (HasTimeCome())
  {
    SelectSymbols();
  
    ExportAllHistoryData();
  }
}

void ExportAllHistoryData()
{
  datetime now = TimeTurkish();

  for (int i = 0; i < ArraySize(symbols_list); i++)
  {
    for (int j = 0; j < ArraySize(timeframes_list); j++)
    {
      WriteHistoryData(symbols_list[i], timeframes_list[j], now);
    }
  }
  
  Print("Exported all history.");
}

void WriteHistoryData(string symbol, ENUM_TIMEFRAMES timeframe, datetime until)
{
  int barCount = Bars(symbol, timeframe, start_date, until);
  
  sb.Append("Time,Open,High,Low,Close,TickVolume,Spread,RealVolume\n");
  
  for (int i = 0; i < barCount; i++)
  {
    datetime time = iTime(symbol, timeframe, i);
    double open = iOpen(symbol, timeframe, i);
    double high = iHigh(symbol, timeframe, i);
    double low = iLow(symbol, timeframe, i);
    double close = iClose(symbol, timeframe, i);
    long tick_volume = iTickVolume(symbol, timeframe, i);
    int spread = iSpread(symbol, timeframe, i);
    long real_volume = iRealVolume(symbol, timeframe, i);
    
    sb.Append(StringFormat("%s,%f,%f,%f,%f,%d,%d,%d\n", TimeToString(time, TIME_DATE | TIME_MINUTES), 
                  open, high, low, close, tick_volume, spread, real_volume));
  }
  
  string history = sb.ToString();
  
  sb.Clear();
  
  string file_name = GetFileName(symbol, timeframe);
  string full_path = GetFullPath(file_name);
  
  WriteAllText(file_name, history);
  
  FileSender::SendFile(full_path);
}

string GetFileName(string symbol, ENUM_TIMEFRAMES period)
{
  CString str;
  str.Assign(EnumToString(period));
  str.Remove("PERIOD_");
  return symbol + str.Str() + ".csv";
}

bool HasTimeCome()
{
  MqlDateTime now;
  
  TimeToStruct(TimeTurkish(), now);
  
  return now.hour == 1;
}

datetime TimeTurkish()
{
  return TimeGMT() + 3600 * 3;
}

string GetFullPath(string file_name)
{
  return TerminalInfoString(TERMINAL_DATA_PATH) + "\\MQL5\\Files\\" + file_name;
}
