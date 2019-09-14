//+------------------------------------------------------------------+ 
//| Prepare and send a trade request                                 | 
//+------------------------------------------------------------------+ 
bool MarketOrder(ENUM_ORDER_TYPE type,double volume,ulong slip,ulong magicnumber,ulong pos_ticket=0) 
  { 
//--- declaring and initializing structures 
   MqlTradeRequest request={0}; 
   MqlTradeResult  result={0}; 
   double price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
   if(type==ORDER_TYPE_BUY) 
      price=SymbolInfoDouble(Symbol(),SYMBOL_ASK); 
//--- request parameters 
   request.action   =TRADE_ACTION_DEAL;                     // trading operation type 
   request.position =pos_ticket;                            // position ticket if closing 
   request.symbol   =Symbol();                              // symbol 
   request.volume   =volume;                                // volume  
   request.type     =type;                                  // order type 
   request.price    =price;                                 // trade price 
   request.deviation=slip;                                  // allowable deviation from the price 
   request.magic    =magicnumber;                           // order MagicNumber 
//--- send a request 
   if(!OrderSend(request,result)) 
     { 
      //--- display data on failure 
      PrintFormat("OrderSend %s %s %.2f at %.5f error %d", 
                  request.symbol,EnumToString(type),volume,request.price,GetLastError()); 
      return (false); 
     } 
//--- inform of a successful operation 
   PrintFormat("retcode=%u  deal=%I64u  order=%I64u",result.retcode,result.deal,result.order); 
   return (true); 
  }
