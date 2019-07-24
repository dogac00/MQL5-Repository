void DrawObject(color clr)
{
   static int i;
   
   double price = SymbolInfoDouble(symbol, SYMBOL_ASK);
   
   ObjectCreate(symbol, "MYARROW", OBJ_ARROW, 0, TimeCurrent(), price);
   
   ObjectSetInteger(0, "MYARROW", OBJPROP_ARROWCODE, i++);
   
   ObjectSetInteger(0, "MYARROW", OBJPROP_COLOR, clr);
   
   ObjectSetInteger(0, "MYARROW", OBJPROP_WIDTH, 20);
   
   ObjectMove(symbol, "MYARROW", 0, TimeCurrent(), price);
   
   Comment("Counter has value : " + i);
}
