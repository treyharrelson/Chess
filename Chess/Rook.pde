public class Rook extends Piece
{
  Rook(Player player)
  {
    super( player, Type.Rook);
  }
  PImage getImage()
  {
    if (player == Player.W)
    {
      return WRook;
    } else return BRook;
  }
  @Override
  public boolean checkMove(int x, int y)
  {
    if(player == Player.W)
      {
        if(positions[x][y]==null || positions[x][y].player == Player.B)
        {
          //same square
          if(x == this.xpos && y == this.ypos)
            return false;
            //down
          if(x == this.xpos && (y-this.ypos > 0))
          {
            for(int i = y-1; i >= this.ypos+1; i--)
            {
              if(positions[x][i] != null)
                return false;
            }
            return true;
          }
            //up
          if(x == this.xpos && (y-this.ypos < 0))
          {
            for(int i = y+1; i <= this.ypos-1; i++)
            {
              if(positions[x][i] != null)
                return false;
            }
           return true;
          }
            //right
          if((x-this.xpos > 0) && y == this.ypos)
          {
            for(int i = x-1; i >= this.xpos+1; i--)
            {
              if(positions[i][y] != null)
                return false;
            }
            return true;
          }
            //left
          if((x-this.xpos < 0) && y == this.ypos)
          {
            for(int i = x+1; i <= this.xpos-1; i++)
            {
              if(positions[i][y] != null)
                return false;
            }
            return true;
          }
        }
      }
      else //black
      {
        if(positions[x][y]==null || positions[x][y].player == Player.W) //only difference between white and black
        {
          //same square
          if(x == this.xpos && y == this.ypos)
            return false;
            //down
          if(x == this.xpos && (y-this.ypos > 0))
          {
            for(int i = y-1; i >= this.ypos+1; i--)
            {
              if(positions[x][i] != null)
                return false;
            }
            return true;
          }
            //up
          if(x == this.xpos && (y-this.ypos < 0))
          {
            for(int i = y+1; i <= this.ypos-1; i++)
            {
              if(positions[x][i] != null)
                return false;
            }
           return true;
          }
            //right
          if((x-this.xpos > 0) && y == this.ypos)
          {
            for(int i = x-1; i >= this.xpos+1; i--)
            {
              if(positions[i][y] != null)
                return false;
            }
            return true;
          }
            //left
          if((x-this.xpos < 0) && y == this.ypos)
          {
            for(int i = x+1; i <= this.xpos-1; i++)
            {
              if(positions[i][y] != null)
                return false;
            }
            return true;
          }
        }
      }
      return false;
  }
}
