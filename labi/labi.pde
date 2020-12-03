String conf = "conf.txt"; 

// *---------------LOGIC--------------------*
// Please don't edit this unless you know what you are doing

Map map;
Player player;
int w, h;
String selectMap;
char [] keys;

void readConf()
{
  String[] lines = loadStrings(conf);
  for (String line : lines)
  {
    String[] infos = split(line, ":");
    switch (infos[0])
    {
      case "map":
        selectMap = infos[1];
        break;
      case "keys":
        keys = infos[1].toCharArray();
        println(keys[1] + " " + infos[1]);
        break;
      default:
        break;
    }
  }
}

void setup()
{
  size(800, 800);
  keys = new char[4];
  readConf();
  map = new Map(selectMap);
  player = new Player(map, map.find('o'), keys);
  background(0);
}

void draw()
{
  background(0);
  map.display();
  player.live();
}

void keyPressed()
{
  player.keyPress();
  if (key == ' ')
  {
    map.place('-', map.find('f'));
    map.addFruit();
  }
}

void keyReleased()
{
  player.keyRelease();
}
