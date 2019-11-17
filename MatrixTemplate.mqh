
template<typename T>
class Matrix
{
  private:
    int m_row, m_col;
    T m_data[];
  
  public:
    Matrix(int row, int col)
    {
      m_row = row;
      m_col = col;
      ArrayResize(m_data, row * col);
    }
    ~Matrix()
    {
      ArrayFree(m_data);
    }
    
    void Set(int row, int col, T value)
    {
      if (row > m_row || col > m_col)
        return;
      
      m_data[row * m_col + col] = value;
    }
    
    T Get(int row, int col)
    {
      if (row > m_row || col > m_col)
        return NULL;
      
      return m_data[row * m_col + col];
    }
};
