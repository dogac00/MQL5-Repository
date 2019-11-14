#include <Trade\Trade.mqh>

CTrade trade;

void OnStart()
  {
   int ord_total=OrdersTotal();
   if(ord_total > 0)
     {
      for(int i=ord_total-1;i>=0;i--)
        {
         ulong ticket=OrderGetTicket(i);
         if(OrderSelect(ticket) && OrderGetString(ORDER_SYMBOL)==Symbol())
           {
             trade.OrderDelete(ticket);
           }
        }
     }
     
   return;
  }
