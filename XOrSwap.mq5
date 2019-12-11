
#define xorswap(x, y)      (x) ^= (y); (y) ^= (x); (x) ^= (y);

void OnInit()
{
  int x = 32;
  int y = 64;
  
  Print("X : ", x, " Y : ", y);
  
  xorswap(x, y);
  
  Print("X : ", x, " Y : ", y);
}
