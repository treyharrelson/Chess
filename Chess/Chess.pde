
PImage WQueen, WKing, WKnight, WBishop, WRook, WPawn, BQueen, BKing, BKnight, BBishop, BRook, BPawn;
Board chessBoard = new Board();
Piece[][] positions;
Piece[] whiteOut;
Piece[] blackOut;
double xMouse;
double yMouse;
PImage selected;

enum Player
{
  W, B
}
enum Type
{
  Rook, Bishop, Knight, King, Queen, Pawn
}
Type selectedType;
void setup()
{
  size(750, 750);
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
  if ((75 <= mouseX && mouseX <= 675)&& (75 <= mouseY && mouseY <= 675))
  {
    if (mouseButton == LEFT)
    {
      if (selected != null)
      {
        chessBoard.drawAvailableMoves(positions[(int)xMouse/75-1][(int)yMouse/75-1]);
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
  if ((75 <= mouseX && mouseX <= 675)&& (75 <= mouseY && mouseY <= 675))
  {
    xMouse = mouseX;
    yMouse = mouseY;
    if (positions[(int)mouseX/75-1][(int)mouseY/75-1] != null)
    {
      selectedType = positions[(int)mouseX/75-1][(int)mouseY/75-1].type;
      selected = positions[(int)mouseX/75-1][(int)mouseY/75-1].getImage();
      
      
    } else
    {
      selected = null;
    }
  }
}
void mouseReleased()
{
  if ((75 <= mouseX && mouseX <= 675)&& (75 <= mouseY && mouseY <= 675))
  {
    if (positions[(int)mouseX/75-1][(int)mouseY/75-1] == null)
    {
      //sets the selected object where mouse is released and assigns null value to where mouse was pressed
      //sets hasMoved to true if it is a pawn
      if(selected != null)
      {
        if(positions[(int)xMouse/75-1][(int)yMouse/75-1].checkMove((int)mouseX/75-1, (int)mouseY/75-1))
        {
          positions[(int)mouseX/75-1][(int)mouseY/75-1] = positions[(int)xMouse/75-1][(int)yMouse/75-1];
          positions[(int)xMouse/75-1][(int)yMouse/75-1] = null;
          if(selectedType == Type.Pawn)
          {
            positions[(int)mouseX/75-1][(int)mouseY/75-1].hasMoved=true;
          }
          xMouse=mouseX;
          yMouse=mouseY;
          positions[(int)mouseX/75-1][(int)mouseY/75-1].setPosition(xMouse, yMouse);
          positions[(int)mouseX/75-1][(int)mouseY/75-1].displayImage(selected);
        }
      }
    }
    else if(positions[(int)mouseX/75-1][(int)mouseY/75-1].checkMove((int)mouseX/75-1,(int)mouseY/75-1)==true)
    {
      print("*");
    }
      selected = null;
  }
}
void draw()
{
  background(255, 255, 255);
  chessBoard.create();
  chessBoard.updatePieces();
  moveSelected();

}
