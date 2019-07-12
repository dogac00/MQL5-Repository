void OpenBuyOrder()
{
   MqlTradeRequest request;
   MqlTradeResult result;
   ZeroMemory(request);
   
   request.action = TRADE_ACTION_DEAL;
   request.type = ORDER_TYPE_BUY;
   request.symbol = _Symbol;
   request.volume = 0.01;
   request.type_filling = ORDER_FILLING_IOC;
   request.price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   // request.tp = Ask + (ProfitPoint * _Point);
   request.sl = 0;
   request.deviation = 50;
   OrderSend(request, result);
   double lastEquity = AccountInfoDouble(ACCOUNT_EQUITY);
}
