
class StringBuilder
{
  private:
    uchar m_data[];
    int size;
    int capacity;
    
    void IncreaseCapacity(int newCapacity)
    {
      int resize = (capacity + newCapacity) * 2;
      ArrayResize(m_data, resize);
      capacity = resize;
    }
    
  public:
    StringBuilder() : size(0), capacity(16) { ArrayResize(m_data, 16); }
    StringBuilder(int initialCapacity) : size(0), capacity(initialCapacity) { ArrayResize(m_data, initialCapacity); }
    ~StringBuilder() { ArrayFree(m_data); }
    
    void Append(string value)
    {
      int length = StringLen(value);
      int toEnsure = size + length;
      
      if (capacity < toEnsure)
        IncreaseCapacity(toEnsure);
      
      for (int i = 0; i < length; i++)
        m_data[size++] = (uchar) StringGetCharacter(value, i);
    }
    
    void Clear()
    {
      size = 0;
    }
    
    int Count()
    {
      return size;
    }
    
    string ToString()
    {
      return CharArrayToString(m_data, 0, size);
    }
};
