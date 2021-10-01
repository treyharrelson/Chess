public class Bishop extends Piece
{
  Bishop(Player player)
  {
    super(player, Type.Bishop);
  }
  PImage getImage()
  {
    if (player == Player.W)
    {
      return WBishop;
    } else return BBishop;
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
            //down right
          if((x-this.xpos > 0 && y-this.ypos > 0)&&(x-this.xpos == y-this.ypos))
          {
            for(int i=x-1, j=y-1; i>=this.xpos+1 && j >= this.ypos+1; i--, j--)
            {
              if(positions[i][j] != null)
                return false;
            }
            return true;
          }
            //down left
          if((x-this.xpos < 0 && y-this.ypos > 0) && (-1*(x-this.xpos) == y-this.ypos))
          {
            for(int i=x+1, j=y-1; i <= this.xpos-1 && j >= this.ypos+1; i++, j--)
            {
              if(positions[i][j] != null)
                return false;
            }
           return true;
          }
            //up right
          if((x-this.xpos > 0 && y-this.ypos < 0) && (x-this.xpos == -1*(y-this.ypos)))
          {
            for(int i=x-1, j=y+1; i >= this.xpos+1 && j <= this.ypos-1; i--, j++)
            {
              if(positions[i][j] != null)
                return false;
            }
            return true;
          }
            //up left
          if((x-this.xpos < 0 && y-this.ypos < 0) && (x-this.xpos == y-this.ypos))
          {
            for(int i=x+1, j=y+1; i <= this.xpos-1 && j <= this.ypos-1; i++, j++)
            {
              if(positions[i][j] != null)
                return false;
            }
            return true;
          }
        }
      }
      else //black
      {
        if(positions[x][y]==null || positions[x][y].player == Player.W)
        {
          //same square
          if(x == this.xpos && y == this.ypos)
            return false;
            //down right
          if((x-this.xpos > 0 && y-this.ypos > 0)&&(x-this.xpos == y-this.ypos))
          {
            for(int i=x-1, j=y-1; i>=this.xpos+1 && j >= this.ypos+1; i--, j--)
            {
              if(positions[i][j] != null)
                return false;
            }
            return true;
          }
            //down left
          if((x-this.xpos < 0 && y-this.ypos > 0) && (-1*(x-this.xpos) == y-this.ypos))
          {
            for(int i=x+1, j=y-1; i <= this.xpos-1 && j >= this.ypos+1; i++, j--)
            {
              if(positions[i][j] != null)
                return false;
            }
           return true;
          }
            //up right
          if((x-this.xpos > 0 && y-this.ypos < 0) && (x-this.xpos == -1*(y-this.ypos)))
          {
            for(int i=x-1, j=y+1; i >= this.xpos+1 && j <= this.ypos-1; i--, j++)
            {
              if(positions[i][j] != null)
                return false;
            }
            return true;
          }
            //up left
          if((x-this.xpos < 0 && y-this.ypos < 0) && (x-this.xpos == y-this.ypos))
          {
            for(int i=x+1, j=y+1; i <= this.xpos-1 && j <= this.ypos-1; i++, j++)
            {
              if(positions[i][j] != null)
                return false;
            }
            return true;
          }
        }
      }
      return false;
  }
}
