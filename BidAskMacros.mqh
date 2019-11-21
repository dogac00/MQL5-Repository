
#define Bid(symbol) NormalizeDouble(SymbolInfoDouble(symbol, SYMBOL_BID), (int) SymbolInfoInteger(symbol, SYMBOL_DIGITS))
#define Ask(symbol) NormalizeDouble(SymbolInfoDouble(symbol, SYMBOL_ASK), (int) SymbolInfoInteger(symbol, SYMBOL_DIGITS))

void OnInit()
{
  double bid = Bid("EURUSD");
  double ask = Ask("EURUSD");
  
  Print(ask);
  Print(bid);
}
