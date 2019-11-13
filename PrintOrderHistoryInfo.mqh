void PrintLastPositionHistory()
{
  uint pos = PositionsTotal() - 1;
  ulong ticket = PositionGetTicket(pos);
  
  ulong orderTicket = OrderGetTicket(OrdersTotal() - 1);
  
  trade.OrderModify(orderTicket, price, 1.04, 1.15, ORDER_TIME_GTC, NULL);
  
  if (HistorySelectByPosition(ticket))
  {
    for (int i = HistoryOrdersTotal() - 1; i >= 0; i--)
    {
    ulong order_ticket = HistoryOrderGetTicket(i);
    
    Print("************************* HISTORY ORDER INFO *************************");
    PrintFormat("Open : %f, Current : %f, Stoplimit : %f, SL : %f, TP : %f, Ticket : %d, Type : %d, Exp : %d, Magic : %d, Comment : %s",
      HistoryOrderGetDouble(order_ticket , ORDER_PRICE_OPEN),
      HistoryOrderGetDouble(order_ticket , ORDER_PRICE_CURRENT),
      HistoryOrderGetDouble(order_ticket , ORDER_PRICE_STOPLIMIT),
      HistoryOrderGetDouble(order_ticket , ORDER_SL),
      HistoryOrderGetDouble(order_ticket , ORDER_TP),
      HistoryOrderGetInteger(order_ticket , ORDER_TICKET),
      HistoryOrderGetInteger(order_ticket , ORDER_TYPE),
      HistoryOrderGetInteger(order_ticket , ORDER_TIME_EXPIRATION),
      HistoryOrderGetInteger(order_ticket , ORDER_MAGIC),
      HistoryOrderGetString(order_ticket , ORDER_COMMENT));
    }
  }
}
