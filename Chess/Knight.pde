public class Knight extends Piece
{
  Knight(Player player)
  {
    super(player, Type.Bishop);
  }
  PImage getImage()
  {
    if (player == Player.W)
    {
      return WKnight;
    } else return BKnight;
  }
  @Override
  public boolean checkMove(int x, int y)
  {
    if(player == Player.W)
    {
      if(positions[x][y]==null || positions[x][y].player == Player.B)
      {
        if((x==this.xpos-1 || x==this.xpos+1)&&y==this.ypos+2)
          return true;
        if((x==this.xpos-1 || x==this.xpos+1)&&y==this.ypos-2)
          return true;
        if(x==this.xpos+2&&(y==this.ypos-1 || y==this.ypos+1))
          return true;
        if(x==this.xpos-2&&(y==this.ypos-1 || y==this.ypos+1))
          return true;
      }
    }
    else
    {
      if(positions[x][y]==null || positions[x][y].player == Player.W)
      {
        if((x==this.xpos-1 || x==this.xpos+1)&&y==this.ypos+2)
          return true;
        if((x==this.xpos-1 || x==this.xpos+1)&&y==this.ypos-2)
          return true;
        if(x==this.xpos+2&&(y==this.ypos-1 || y==this.ypos+1))
          return true;
        if(x==this.xpos-2&&(y==this.ypos-1 || y==this.ypos+1))
          return true;
      }
    }
    
    return false;
  }
}
