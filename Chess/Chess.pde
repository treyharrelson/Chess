
PImage WQueen, WKing, WKnight, WBishop, WRook, WPawn, BQueen, BKing, BKnight, BBishop, BRook, BPawn;
Board chessBoard = new Board();
Piece[][] positions;
ArrayList<Piece> whiteOut = new ArrayList<Piece>();
ArrayList<Piece> blackOut = new ArrayList<Piece>();
double xMouse;
double yMouse;
PImage selected;
Boolean white = true;
enum Player
{
  W, B
}
enum Type
{
  Rook, Bishop, Knight, King, Queen, Pawn
}
Type selectedType;
Player selectedPlayer;
void setup()
{
  size(750, 900);
  WQueen = loadImage("WhiteQueen.png");
  WKing = loadImage("WhiteKing.png");
  WKnight = loadImage("WhiteKnight.png");
  WBishop = loadImage("WhiteBishop.png");
  WRook = loadImage("WhiteRook.png");
  WPawn = loadImage("WhitePawn.png");
  BQueen = loadImage("BlackQueen.png");
  BKing = loadImage("BlackKing.png");
  BKnight = loadImage("BlackKnight.png");
  BBishop = loadImage("BlackBishop.png");
  BRook = loadImage("BlackRook.png");
  BPawn = loadImage("BlackPawn.png");

  chessBoard.create();
  chessBoard.setup();
}
/*
checks if the mouse is inside the board and if LMB is pressed
calls drawAvailableMoves for the selected piece
 displays the selected image on the real time mouse positions
 */
void moveSelected()
{
  if ((75 <= mouseX && mouseX <= 675)&& (150 <= mouseY && mouseY <= 750))
  {
    if (mouseButton == LEFT)
    {
      if (selected != null && ((selectedPlayer==Player.W && white) || (selectedPlayer==Player.B && !white)))
      {
        chessBoard.drawAvailableMoves(positions[(int)xMouse/75-1][(int)yMouse/75-2]);
        image(selected, mouseX-37.5, mouseY-37.5);
      }
    }
  }
}


/*
checks if mouse is inside board and then sets the selected piece and type of piece at the point of the mouse being clicked
*/
void mousePressed()
{
  if ((75 <= mouseX && mouseX <= 675)&& (150 <= mouseY && mouseY <= 750))
  {
    xMouse = mouseX;
    yMouse = mouseY;
    if (positions[(int)mouseX/75-1][(int)mouseY/75-2] != null)
    {
      selectedType = positions[(int)mouseX/75-1][(int)mouseY/75-2].type;
      selectedPlayer = positions[(int)mouseX/75-1][(int)mouseY/75-2].player;
      selected = positions[(int)mouseX/75-1][(int)mouseY/75-2].getImage();
      
      
    } else
    {
      selected = null;
    }
  }
}
void mouseReleased()
{
  if ((75 <= mouseX && mouseX <= 675)&& (150 <= mouseY && mouseY <= 750))
  {
    if (positions[(int)mouseX/75-1][(int)mouseY/75-2] == null)
    {
      //sets the selected object where mouse is released and assigns null value to where mouse was pressed
      //sets hasMoved to true if it is a pawn
      if(selected != null)
      {
        if(positions[(int)xMouse/75-1][(int)yMouse/75-2].checkMove((int)mouseX/75-1, (int)mouseY/75-2))
        {
          positions[(int)mouseX/75-1][(int)mouseY/75-2] = positions[(int)xMouse/75-1][(int)yMouse/75-2];
          positions[(int)xMouse/75-1][(int)yMouse/75-2] = null;
          if(selectedType == Type.Pawn)
          {
            positions[(int)mouseX/75-1][(int)mouseY/75-2].hasMoved=true;
          }
          xMouse=mouseX;
          yMouse=mouseY;
          positions[(int)mouseX/75-1][(int)mouseY/75-2].setPosition(xMouse, yMouse);
          positions[(int)mouseX/75-1][(int)mouseY/75-2].displayImage(selected);
          white = !white;
        }
      }
    }
    else if(positions[(int)xMouse/75-1][(int)yMouse/75-2].checkMove((int)mouseX/75-1,(int)mouseY/75-2)==true)
    {
      pieceOut(positions[(int)mouseX/75-1][(int)mouseY/75-2]);
      positions[(int)mouseX/75-1][(int)mouseY/75-2] = positions[(int)xMouse/75-1][(int)yMouse/75-2];
      positions[(int)xMouse/75-1][(int)yMouse/75-2] = null;
      white = !white;

    }
      selected = null;
  }
}
void pieceOut(Piece piece)
{
  if(piece.player == Player.W)
  {
    whiteOut.add(piece);
  }
  else
  {
    blackOut.add(piece);
  }
}
void printOut()
{
  for(int i = 0; i < whiteOut.size();i++)
  {
    if(i < 10)
      image(whiteOut.get(i).getImage(),i*75, 0);
    else
      image(whiteOut.get(i).getImage(),(i-10)*75, 75);
  }
  for(int i = 0; i < blackOut.size();i++)
  {
    if(i < 10)
      image(blackOut.get(i).getImage(),i*75, 825);
    else
      image(blackOut.get(i).getImage(),(i-10)*75,750);
  }
}
void draw()
{
  background(#675A46);
  chessBoard.create();
  chessBoard.updatePieces();
  moveSelected();
  printOut();

}
