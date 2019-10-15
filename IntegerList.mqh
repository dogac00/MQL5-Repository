
class List
{
  private:
    int data[];
    int index;
    int capacity;
    
    void doubleCapacity()
    {
      capacity *= 2;
      ArrayResize(data, capacity);
    }
    
  public:
    static void Hello() { Print("Hello"); }
  
    void List()
    {
      index = 0;
      capacity = 12;
      ArrayResize(data, 12);
    }
    
    void PrintList()
    {
      int size = ArraySize(data);
      
      if (index == 0)
        Print("Empty List");
    
      for (int i = 0; i < index; i++)
      {
        PrintFormat("list[%d]: %d", i, data[i]);
      }
    }
  
    void Add(int number)
    {
      if (index == capacity)
        doubleCapacity();
        
      data[index++] = number;
    }
    
    void Clear()
    {
      index = 0;
      capacity = 12;
      ArrayFree(data);
      ArrayResize(data, 12);
    }
    
    void Remove(int number)
    {
      int size = ArraySize(data);
      int indexToRemove = -1;
      
      for (int i = 0; i < size; i++)
      {
        if (data[i] == number)
        { indexToRemove = i; break; }
      }
      
      if (indexToRemove == -1) return;
      
      data[indexToRemove] = 0;
      
      for (int i = indexToRemove; i < size - 1; i++)
      {
        data[i] = data[i + 1];
      }
      
      data[size - 1] = 0;
    }
};

