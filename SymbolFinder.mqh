
bool IsUnknownSymbol(string symbol)
{
  ResetLastError();
  SymbolInfoDouble(symbol, SYMBOL_ASK);
  return GetLastError() == ERR_MARKET_UNKNOWN_SYMBOL;
}

bool IsSymbolNotSelected(string symbol)
{
  ResetLastError();
  SymbolInfoDouble(symbol, SYMBOL_ASK);
  return GetLastError() == ERR_MARKET_NOT_SELECTED;
}
