static datetime LastBar = 0;

void OnTick()
{
  // You can use IsNewBarFirst
  // or IsNewBarSecond depending on your taste ;)
  
  // Proper way of using it is
  
  if (IsNewBarFirst())
  {
    OnNewBar();
  }
}

void OnNewBar()
{
  Print("New Bar!");
}

bool IsNewBarFirst()
{
  datetime ThisBar = (datetime)SeriesInfoInteger(_Symbol,PERIOD_CURRENT,SERIES_LASTBAR_DATE);
  
  if (LastBar != ThisBar)
  {
    LastBar = ThisBar;
    
    return true;
  }
  
  return false;
}

bool IsNewBarSecond()
{
   bool iNewBar=false;
   
   static double currPeriodProgress = 0;

   double lastPeriodProgress = MathMod(TimeCurrent(), PeriodSeconds());

   if (lastPeriodProgress < currPeriodProgress) iNewBar = true;

   currPeriodProgress = lastPeriodProgress;

   return(iNewBar);
}
