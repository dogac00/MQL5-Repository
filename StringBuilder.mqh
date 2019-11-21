
class StringBuilder
{
  private:
    uchar m_data[];
    int size;
    int capacity;
    
    void IncreaseCapacity(int newCapacity)
    {
      if (capacity > newCapacity)
        return;
      
      int resize = newCapacity > capacity * 2 ? newCapacity : capacity * 2;
      ArrayResize(m_data, resize);
      capacity = resize;
    }
    
  public:
    StringBuilder() : size(0), capacity(16) { ArrayResize(m_data, 16); }
    
    void Append(string value)
    {
      int toEnsure = size + StringLen(value);
      if (capacity < toEnsure)
        IncreaseCapacity(toEnsure);
    
      uchar current;
      for (int i = 0; (current = (uchar) value[i]) != 0; i++)
        m_data[size++] = current;
    }
    
    string ToString()
    {
      return CharArrayToString(m_data, 0, size);
    }
};
