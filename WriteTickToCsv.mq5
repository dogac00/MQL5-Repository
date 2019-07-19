int filehandle;

int OnInit()
{
   ResetLastError();
   
   filehandle = FileOpen("BidAsk.csv",FILE_WRITE|FILE_CSV);
   
   if(filehandle!=INVALID_HANDLE)
   {      
      Print("File opened correctly");
   }
   else Print("Error in opening file,", GetLastError());

   return(INIT_SUCCEEDED);
}

void OnTick()
{
   MqlTick last_tick;
    
   if(SymbolInfoTick(Symbol(),last_tick))
     {
      Print(last_tick.time,": Bid = ",last_tick.bid,
            " Ask = ",last_tick.ask,"  Volume = ",last_tick.volume);
      
      FileSeek(filehandle, 0, SEEK_END);
      int bytes = FileWrite(filehandle,last_tick.time, ": Bid = " , last_tick.bid ,
            " Ask = ", last_tick.ask, "  Volume = ", last_tick.volume);
            
      Comment("Bytes written to file :", IntegerToString(bytes));
     }
     
   else Print("SymbolInfoTick() failed, error = ",GetLastError());
}


void OnDeinit(const int reason)
{
   FileClose(filehandle);
}
