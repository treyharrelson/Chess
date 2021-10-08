public class Pawn extends Piece
{
  Pawn(Player player)
  {
    super(player, Type.Pawn);
  }
  PImage getImage()
  {
    if (player == Player.W)
    {
      return WPawn;
    } else return BPawn;
  }
  @Override
  public boolean checkMove(int x, int y)
  {
    if(hasMoved == false)
    {
      if(player == Player.W && white)
      {
        if(((x == this.xpos-1 || x == this.xpos+1)&& y == this.ypos+1)&& positions[x][y]!= null && positions[x][y].player == Player.B)
          {
            return true;
          }
        if(x == this.xpos && (y - this.ypos <= 2 && y-this.ypos>0))
        {
          if(positions[x][y-1] == null && y-this.ypos == 2 && positions[x][y] == null)
            return true;
          if(positions[x][y-1] != null && positions[x][y] == null && y-this.ypos == 1)
            return true;
          
        }

      }
      else if(player == Player.B && !white)
      {
        if(((x == this.xpos-1 || x == this.xpos+1)&& y == this.ypos-1)&& positions[x][y]!=null && positions[x][y].player == Player.W)
          {
            return true;
          }
        if(x == this.xpos && (y-this.ypos >= -2 && y-this.ypos<0))
        {
          if(positions[x][y+1] == null && y-this.ypos == -2 && positions[x][y] == null)
            return true;
          if(positions[x][y+1] != null && y-this.ypos == -1 && positions[x][y] == null)
            return true;
        }
      }
    }
    else
    {
      if(player == Player.W && white)
      {
        if(((x == this.xpos-1 || x == this.xpos+1)&& y == this.ypos+1)&& positions[x][y]!= null && positions[x][y].player == Player.B)
        {
          return true;
        }
        else if((x == this.xpos && (y - this.ypos <= 1 && y-this.ypos>0))&&positions[x][y]==null)
        {
          return true;
        }
        
      }
      else if(player == Player.B && !white)
      {
        if(((x == this.xpos-1 || x == this.xpos+1)&& y == this.ypos-1)&& positions[x][y]!= null && positions[x][y].player == Player.W)
        {
          return true;
        }
        if((x == this.xpos && (y-this.ypos >= -1 && y-this.ypos<0))&&positions[x][y]==null)
        {
          return true;
        }
      }
    }
    return false;
    
  }
}
