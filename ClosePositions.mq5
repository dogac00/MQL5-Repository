void OnStart()
{
   MqlTradeRequest request;
   MqlTradeResult  result;
   
   int total=PositionsTotal();
   
   for(int i=total-1; i>=0; i--)
   {
  
      ulong  position_ticket = PositionGetTicket(i);                                      // ticket of the position
      string position_symbol = PositionGetString(POSITION_SYMBOL);                        // symbol 
      int    digits = (int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS);              // number of decimal places
      double volume = PositionGetDouble(POSITION_VOLUME);                                 // volume of the position
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);      // type of the position
   
   
      PrintFormat("#%I64u %s  %s  %.2f  %s [%I64d]",
               position_ticket,
               position_symbol,
               EnumToString(type),
               volume,
               DoubleToString(PositionGetDouble(POSITION_PRICE_OPEN),digits));
   
   
      ZeroMemory(request);
      ZeroMemory(result);
      
      request.action   = TRADE_ACTION_DEAL;        // type of trade operation
      request.position = position_ticket;          // ticket of the position
      request.symbol   = position_symbol;          // symbol 
      request.volume   = volume;                   // volume of the position
      request.deviation = 5;                        // allowed deviation from the price
      request.type_filling = SYMBOL_FILLING_IOC;
      
      //--- set the price and order type depending on the position type
      if(type==POSITION_TYPE_BUY)
        {
         request.price=SymbolInfoDouble(position_symbol,SYMBOL_BID);
         request.type =ORDER_TYPE_SELL;
        }
      else
        {
         request.price=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
         request.type =ORDER_TYPE_BUY;
        }
        
      //--- output information about the closure
      PrintFormat("Close #%I64d %s %s",position_ticket,position_symbol,EnumToString(type));
      
      if(!OrderSend(request,result))
         PrintFormat("OrderSend error %d",GetLastError());  // if unable to send the request, output the error code
         
      //--- information about the operation   
      PrintFormat("retcode=%u  deal=%I64u  order=%I64u",result.retcode,result.deal,result.order);
   }
}
