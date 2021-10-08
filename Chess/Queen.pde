public class Queen extends Piece
{
  Queen(Player player)
  {
    super(player, Type.Queen);
  }

  PImage getImage()
  {
    if (player == Player.W)
    {
      return WQueen;
    } else return BQueen;
  }
  @Override
  public boolean checkMove(int x, int y)
  {
    if(player == Player.W && white)
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
    else if(player == Player.B && !white)
    {
      if(positions[x][y]==null || positions[x][y].player == Player.W)
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
