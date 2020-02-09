
#include <Generic\ArrayList.mqh>

template<typename T, typename U>
class Func
{
  private:
    typedef void (*function_ptr)(const T&, U&);
    function_ptr m_function;
  public:
    Func(function_ptr ptr) : m_function(ptr) {}
    void Invoke(const T& parameter, U& result) { m_function(parameter, result); }
};

void twice(const int& value, int& result) { result = value * 2; }

void OnInit()
{
  CArrayList<int> numbers;
  numbers.Add(1);
  numbers.Add(2);
  numbers.Add(3);
  CArrayList<int> twices(4);
  Func<int, int> function(twice);
  
  Map(numbers, twices, function);
  
  PrintArrayList(twices);
}

template<typename T>
void PrintArrayList(CArrayList<T> &list)
{
  T arr[];
  list.CopyTo(arr);
  ArrayPrint(arr);
}

template<typename T, typename U>
void Map(CArrayList<T> &src, CArrayList<U> &dest, Func<T, U>& map_function)
{
  int size = src.Count();
  
  for (int i = 0; i < size; i++)
  {
    const T elem = src[i];
    U result;
    map_function.Invoke(elem, result);
    dest.Add(result);
  }
}
