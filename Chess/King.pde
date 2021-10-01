public class King extends Piece
{
  King(Player player)
  {
    super(player, Type.King);
  }

  PImage getImage()
  {
    if (player == Player.W)
    {
      return WKing;
    } else return BKing;
  }
  @Override
  public boolean checkMove(int x, int y)
  {   
    if(player == Player.W)
    {
      if(positions[x][y]==null || positions[x][y].player == Player.B)
      {
        if(x == this.xpos && (y == this.ypos + 1 || y == this.ypos -1))
          return true;
        if((x == this.xpos +1 || x == this.xpos -1) && y == this.ypos)
          return true;
        if(x-this.xpos == 1 && (y == this.ypos+1 || y == this.ypos-1))
          return true;
        if(x-this.xpos == -1 && (y==this.ypos+1 || y == this.ypos-1))
          return true;
      return false;
      }
    }
    else
    {
      if(positions[x][y]==null || positions[x][y].player == Player.W)
      {
        if(x == this.xpos && (y == this.ypos + 1 || y == this.ypos -1))
          return true;
        if((x == this.xpos +1 || x == this.xpos -1) && y == this.ypos)
          return true;
        if(x-this.xpos == 1 && (y == this.ypos+1 || y == this.ypos-1))
          return true;
        if(x-this.xpos == -1 && (y==this.ypos+1 || y == this.ypos-1))
          return true;
      return false;
      
      }
    }
    return false;
  }
}
