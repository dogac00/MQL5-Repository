void BuyAsync(string symbol, double volume)
{
 MqlTradeRequest req = {0};

 req.action      = TRADE_ACTION_DEAL;
 req.symbol      = symbol;
 req.magic       = MagicNumber;
 req.volume      = 0.1;
 req.type        = ORDER_TYPE_BUY;
 req.price       = SymbolInfoDouble(req.symbol,SYMBOL_ASK);
 req.deviation   = 10;
 req.comment     = "Buy using OrderSendAsync()";

 MqlTradeResult  res = {0};
 if (!OrderSendAsync(req,res))
   {
      Print(__FUNCTION__, ": error ", GetLastError(), ", retcode = ", res.retcode);
   }
}
