
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
