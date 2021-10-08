public class Board
{
  public void drawAvailableMoves(Piece piece)
  {
    //goes through every square and calls to the selected object's checkMove to decide to color or not
    if (mousePressed == true && mouseButton == LEFT)
    {
      for(int c=0; c<8;c++)
      {
        for(int r=0;r<8;r++)
        {
          if(piece.checkMove(c,r)==true)
          {
            fill(#A1DE98);
            rect(c*75+75, r*75+150, 75, 75);
            if(positions[c][r]!= null)
            {
              positions[c][r].displayImage(positions[c][r].getImage());
            }
          }
        }
      }
    }
  }
  public void create()
  {
    //adds evenly spaced 75x75 sqaures and fills them in
    for (int c=0; c < 8; c++) {
      for (int r=0; r < 8; r++) {
        if (c%2==0) {
          if (r%2==0) {
            fill(237, 199, 141);
          } else {
            fill(196, 140, 55);
          }
        } else {
          if (r%2==0) {
            fill(196, 140, 55);
          } else {
            fill(237, 199, 141);
          }
        }
        rect(c*75+75, r*75+150, 75, 75);
      }
    }
  }
  public void setup()
  {
    //creates 2D array positions and initializes and declares objects in the correct positions
    positions = new Piece[8][8]; 

      positions[0][0] = new Rook(Player.W); 
      positions[1][0] = new Knight(Player.W); 
      positions[2][0] = new Bishop(Player.W); 
      positions[3][0] = new King(Player.W); 
      positions[4][0] = new Queen(Player.W); 
      positions[5][0] = new Bishop(Player.W); 
      positions[6][0] = new Knight(Player.W); 
      positions[7][0] = new Rook(Player.W); 
      positions[0][1] = new Pawn(Player.W); 
      positions[1][1] = new Pawn(Player.W); 
      positions[2][1] = new Pawn(Player.W); 
      positions[3][1] = new Pawn(Player.W); 
      positions[4][1] = new Pawn(Player.W); 
      positions[5][1] = new Pawn(Player.W); 
      positions[6][1] = new Pawn(Player.W); 
      positions[7][1] = new Pawn(Player.W); 
      positions[0][7] = new Rook(Player.B); 
      positions[1][7] = new Knight(Player.B); 
      positions[2][7] = new Bishop(Player.B); 
      positions[3][7] = new King(Player.B); 
      positions[4][7] = new Queen(Player.B); 
      positions[5][7] = new Bishop(Player.B); 
      positions[6][7] = new Knight(Player.B); 
      positions[7][7] = new Rook(Player.B); 
      positions[0][6] = new Pawn(Player.B); 
      positions[1][6] = new Pawn(Player.B); 
      positions[2][6] = new Pawn(Player.B); 
      positions[3][6] = new Pawn(Player.B); 
      positions[4][6] = new Pawn(Player.B); 
      positions[5][6] = new Pawn(Player.B); 
      positions[6][6] = new Pawn(Player.B); 
      positions[7][6] = new Pawn(Player.B);
  }
  public void updatePieces()
  {
    //calls setPosition and displayImage for every spot in positions[][] that is not null
    for (int x = 0; x < 8; x++)
    {

      for (int y = 0; y < 8; y++)
      {
        if (positions[x][y] != null)      
        {
          positions[x][y].setPosition(x, y); 
          positions[x][y].displayImage(positions[x][y].getImage());
        }
      }
    }
  }
}
