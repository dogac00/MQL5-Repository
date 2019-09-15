
#include <JAson.mqh>

void OnStart()
{
  CJAVal msg, content;
  
  msg["messageName"] = "TickData";
  content["instrument"] = Symbol();
  content["timeFrame"] = (int) Period();
  content["time"] = (int) TimeCurrent();
  content["open"] = iOpen(Symbol(), Period(), 0);
  msg["content"].Set(content);
  
  Print("Sending JSON to server: ", msg.Serialize());  
}
