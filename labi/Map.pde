class Map
{
  ArrayList<String> map;
  PVector size;
  PVector tileSize;

  Map(String filename)
  {
    String[] lines = loadStrings(filename);
    String[] Msize = split(lines[0], " ");
    PVector _size = new PVector(int(Msize[0].substring(1)), int (Msize[1]));
    map = new ArrayList();
    for (String line : lines)
    {
      if (line.charAt(0) != 'M')
        map.add(line);
    }
    size = new PVector(width/_size.x, height/_size.y);
    tileSize = _size;
  }
  
  PVector find(char c)
  {
    PVector ret = new PVector(0, 0);
    
    for (String line : map)
    {
      for (char p : line.toCharArray())
      {
        if (p == c)
        {
          return ret;
        }
        ret.x += 1;
      }
      ret.x = 0;
      ret.y += 1;
    }
    return new PVector(0, 0);
  }
  
  void addFruit()
  {
    boolean layed = false;
    PVector fruit;
    
    while (!layed)
    {
      fruit = new PVector(int(random(tileSize.x)), int(random(tileSize.y)));
      if (!isChar(fruit, 'x') && !isChar(fruit, 'o'))
      {
        layed = true;
        place('f', fruit);
      }
    }
  }
  
  boolean isChar(PVector pos, char c)
  {
    if (pos.x < 0 || pos.x >= tileSize.x || pos.y < 0 || pos.y >= tileSize.y)
      return true;
    String line = map.get(int(pos.y));
    if (line.charAt(int(pos.x)) == c)
      return true;
    return false;
  }
  
  void place(char c, PVector pos)
  {
    StringBuilder line = new StringBuilder(map.get(int(pos.y)));
    line.setCharAt(int(pos.x), c);
    map.set(int(pos.y), line.toString());
  }
  
  void display()
  {
    int x = 0, y = 0;
    for (String line : map)
    {
      for (char c : line.toCharArray())
      {
        switch(c)
        {
          case 'x':
            noStroke();
            fill(0, 255, 0);
            rect(x * size.x, y * size.y, size.x, size.y);
            break;
          case 'o':
            noStroke();
            fill(0, 0, 255);
            ellipse(x * size.x + size.x/2, y * size.y + size.y/2, 
                    size.x, size.y);
            break;
          case 'f':
            noStroke();
            fill(255, 0, 0);
            ellipse(x * size.x + size.x/2, y * size.y + size.y/2, 
                    size.x, size.y);
            break;
          default:
            break;
        }
        x += 1;
      }
      y += 1;
      x = 0;
    }
  }
}
