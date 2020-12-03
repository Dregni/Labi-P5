class Key
{
  boolean pressed;
  char c;
  int code;
  boolean hasCode;
  PVector dir;
  boolean used;

  Key(char _c, PVector _dir)
  {
    pressed = false;
    c = _c;
    hasCode = false;
    dir = _dir;
    used = true;
  }
  
  Key(int _i, PVector _dir)
  {
    pressed = false;
    code = _i;
    hasCode = true;
    dir = _dir;
    used = true;
  }
  
  void keyPress()
  {
    if (hasCode && code == keyCode)
    {
      pressed = true;
      used = false;
    }
    else if (c == key)
    {
      pressed = true;
      used = false;
    }
  }
  
  void keyRelease()
  {
    if (hasCode && code == keyCode)
    {
      pressed = false;
    }
    else if (c == key)
    {
      pressed = false;
    }
  }
}
