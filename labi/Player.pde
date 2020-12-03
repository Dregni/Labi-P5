class Player
{
  Map map;
  PVector pos;
  ArrayList<Key> keys;
  int score;
  long tick;
  
  Player(Map _map, PVector _pos, char [] _keys)
  {
    map = _map;
    keys = new ArrayList();
    keys.add(new Key(_keys[0], new PVector(0, -1)));
    keys.add(new Key(UP, new PVector(0, -1)));
    keys.add(new Key(_keys[1], new PVector(-1, 0)));
    keys.add(new Key(LEFT, new PVector(-1, 0)));
    keys.add(new Key(_keys[2], new PVector(0, 1)));
    keys.add(new Key(DOWN, new PVector(0, 1)));
    keys.add(new Key(_keys[3], new PVector(1, 0)));
    keys.add(new Key(RIGHT, new PVector(1, 0)));
    pos = _pos;
    score = 0;
    tick = millis();
  }
  
  void live()
  {
    if (millis() - tick > 100)
    {
      move();
      tick = millis();
    }
  }
  
  void move()
  {
    for (Key k : keys)
    {
      if (k.pressed || !k.used)
      {
        if (!map.isChar(new PVector(pos.x + k.dir.x, pos.y + k.dir.y), 'x'))
        {
          if (map.isChar(new PVector(pos.x + k.dir.x, pos.y + k.dir.y), 'f'))
          {
            score += 1;
          }
          map.place('-', pos);
          pos.add(k.dir);
          map.place('o', pos);
        }
        k.used = true;
      }
    } 
  }
  
  void keyPress()
  {
    for (Key k: keys)
    {
      k.keyPress();
    }
  }
  
  void keyRelease()
  {
    for (Key k: keys)
    {
      k.keyRelease();
    }
  }
}
