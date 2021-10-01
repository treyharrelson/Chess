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
    if(player == Player.W)
    {
      if(positions[x][y]==null || positions[x][y].player == Player.B)
      {
        
      }
    }
    else
    {
      if(positions[x][y]==null || positions[x][y].player == Player.W)
      {
        
      }
    }
    
    return false;
  }
}
