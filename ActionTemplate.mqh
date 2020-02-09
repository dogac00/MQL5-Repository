
template<typename T>
class Action
{
  private:
    typedef void (*action_ptr)(T);
    action_ptr m_action;
  public:
    Action(action_ptr action) : m_action(action) {}
    void Invoke(T t) { m_action(t); }
};

template<typename T>
void ForEach(CArrayList<T> &list, Action<T> &action)
{
  int size = list.Count();
  
  for (int i = 0; i < size; i++)
  {
    T elem = list[i];
    action.Invoke(elem);
  }
}
