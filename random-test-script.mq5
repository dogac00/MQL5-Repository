
int randomNumbers[1000];
int counter;

void OnInit()
  {
      EventSetTimer(2);
  
      counter = 0;
  }
  
void OnTimer()
{
   int num = GenerateRandomNumber();
   AddToRandomNumbers(num);
   
   PrintRandomNumbers();
   Print("-------");
}

void PrintRandomNumbers()
{
   int i = 0;
   
   while (randomNumbers[i] != 0)
   {
      Print(randomNumbers[i]);
      i++;
   }
}

bool isInRandomNumbers(int num) 
{
   int i = 0;
   
   while (randomNumbers[i] != 0)
   {
      if (randomNumbers[i] == num)
      {
         return true;
      }
      
      i++;
   }
   
   return false;
}

int GenerateRandomNumber()
{
   int random = NULL;

   while (true)
   {
      random = MathRand();
   
      if (!isInRandomNumbers(random))
      {
         break;
      }
   }
   
   return random;
}

void AddToRandomNumbers(int num)
{
   randomNumbers[counter++] = num;
}
