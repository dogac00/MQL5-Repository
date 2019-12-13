
template<typename T>
bool ArrayAppend(T &dest[], T &src[])
{
  int dest_size = ArraySize(dest);
  int count = ArrayResize(dest, ArraySize(dest) + ArraySize(src));
  
  if (count == -1)
    return false;
  
  ArrayCopy(dest, src, dest_size, 0);
  
  return true;
}

template<typename T>
void ArrayRemoveAll(T const &dest_arr [], T &src_arr [], T to_be_removed)
{
  int count = ArrayGetCount(src_arr, to_be_removed);
  
  ArrayResize(dest_arr, count);
  
  for (int i = 0, index = 0; i < ArraySize(src_arr); i++)
    if (src_arr[i] != to_be_removed)
      dest_arr[index++] = src_arr[i];
}

template<typename T>
void ArrayFindAll(T &array_to_search[], T& founded_indexes[], T element_to_find)
{
  int count = ArrayGetCount(element_to_find);
  
  ArrayResize(founded_indexes, count);
  
  for (int i = 0, index = 0; i < ArraySize(array); i++)
    if (array[i] == element_to_find)
      founded_indexes[index++] = i;
}

template<typename T>
int ArrayFindFirst(T & array_to_search, T element_to_find)
{
  for (int i = 0; i < ArraySize(array_to_search); i++)
    if (array_to_search[i] == element_to_find)
      return i;
      
  return -1;
}

template<typename T>
bool ArrayContains(T &array_to_search[], T element_to_look)
{
  return ArrayFindFirst(array_to_search, element_to_look) != -1;
}

template<typename T>
int ArrayGetCount(T &array[], T element_to_find)
{
  int count = 0;
  
  for (int i = 0; i < ArraySize(array); i++)
    if (array[i] == element_to_find)
      count++;
  
  return count;
}

// I defined this as a function-like macro because you can't
// pass two-dimensional arrays as arguments to functions
// so we have to pass it in the function-like macro
#define ArrayGetSubArrayAtIndex(two_dim_arr, dest_arr, index)  ArrayResize(dest_arr, ArrayRange(two_dim_arr, 1)); \
                                                  ArrayCopy(dest_arr, two_dim_arr, 0, \
                                                  ArraySize(two_dim_arr) / ArrayRange(two_dim_arr, 0) \
                                                  * index, ArrayRange(two_dim_arr, 1));

#define ArrayContainsAtIndex(two_dim_arr, to_search, index)    for (int i = 0; i < ArrayRange(two_dim_arr, 1); i++) \
                                                                if (two_dim_arr[order][i] == to_search) \
                                                                  return true; \
                                                               return false;
