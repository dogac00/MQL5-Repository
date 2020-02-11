
template<typename T>
class Array
{
  private:
    T m_arr[];
    void PushElement(T elem)
    {
      int size = ArraySize(m_arr);
      ArrayResize(m_arr, size + 1); 
      m_arr[size] = elem;
    }
  public:
    Array() {}
    Array(T &arr[]) { ArrayCopy(m_arr, arr); }
    Array(T t1) { PushElement(t1); }
    Array(T t1, T t2) { PushElement(t1); PushElement(t2); }
    Array(T t1, T t2, T t3) { PushElement(t1); PushElement(t2); PushElement(t3); }
    Array(T t1, T t2, T t3, T t4) { PushElement(t1); PushElement(t2); PushElement(t3); PushElement(t4); }
    Array(T t1, T t2, T t3, T t4, T t5) { PushElement(t1); PushElement(t2); PushElement(t3); PushElement(t4); PushElement(t5); }
    Array(T t1, T t2, T t3, T t4, T t5, T t6) 
    { 
      PushElement(t1); PushElement(t2); 
      PushElement(t3); PushElement(t4); 
      PushElement(t5); PushElement(t6); 
    }
    Array(T t1, T t2, T t3, T t4, T t5, T t6, T t7) 
    { 
      PushElement(t1); PushElement(t2);
      PushElement(t3); PushElement(t4);
      PushElement(t5); PushElement(t6);
      PushElement(t7);
    }
    T operator[](int index) { return m_arr[index]; }
};
