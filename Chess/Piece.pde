public class Piece
{
  boolean hasMoved = false;
  int xpos;
  int ypos;
  Player player;
  Type type;
  Piece(Player player, Type type)
  {
    this.player = player;
    this.type = type;
  }
  public void setPosition(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
  public void setPosition(double mouseX, double mouseY)
  {
    xpos = (int)mouseX/75-1;
    ypos = (int)mouseY/75-2;
  }
  PImage getImage()
  {
    return null;
  }
  public boolean checkMove(int x, int y)
  {
    print("THIS SHOULD NEVER APPEAR " + x + " " + y + "  ");
    return false;
  }
  public void displayImage(PImage image)
  {
    image(image, xpos*75+75, ypos*75+150);
  }
}
