#include <Trade\Trade.mqh>

void CloseAllOrders()
{
  CTrade trade;
  
  int i = PositionsTotal() - 1;
  
  while (i >= 0)
  {
    if (trade.PositionClose(PositionGetSymbol(i))) i--;
  }
}
