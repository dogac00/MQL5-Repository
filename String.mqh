
string StringJoin(string& arr[], char ch)
{
  string value = "";
  int size = ArraySize(arr);
  
  for (int i = 0; i < size; i++)
  {
    if (i != 0)
      value += CharToString(ch);
  
    value += arr[i];
  }
  
  return value;
}
