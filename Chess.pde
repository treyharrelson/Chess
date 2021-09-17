
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
        if (selected != null)
        {
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
public class Piece
{
  boolean hasMoved = false;
  int xpos;
  int ypos;
  Player player;
  Type type;
  Piece(Player player, Type type)
  {
    this.player = player;
    this.type = type;
  }
  public void setPosition(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
  public void setPosition(double mouseX, double mouseY)
  {
    xpos = (int)mouseX/75-1;
    ypos = (int)mouseY/75-1;
  }
  PImage getImage()
  {
    return null;
  }
  public boolean checkMove(int x, int y)
  {
    print(x + " " + y + "  ");
    return false;
  }
  public void displayImage(PImage image)
  {
    image(image, xpos*75+75, ypos*75+75);
  }
}
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
    if(x == this.xpos && y - this.ypos <= 2)
    {
      return true;
    }
    return false;
  }
}
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
    if(x == this.xpos && y - this.ypos <= 2)
    {
      return true;
    }
    return false;
  }
}
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
    if(x == this.xpos && y - this.ypos <= 2)
    {
      return true;
    }
    return false;
  }
}
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
    if(x == this.xpos && y - this.ypos <= 2)
    {
      return true;
    }
    return false;
  }
}
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
        if(x == this.xpos && (y - this.ypos <= 2 && y-this.ypos>0))
        {
          return true;
        }
      }
      else
      {
        if(x == this.xpos && (y-this.ypos >= -2 && y-this.ypos<0))
        {
          return true;
        }
      }
      return false;
  }
}
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
      if(player == Player.W)
      {
        if(x == this.xpos && (y - this.ypos <= 2 && y-this.ypos>0))
        {
          return true;
        }

      }
      else
      {
        if(x == this.xpos && (y-this.ypos >= -2 && y-this.ypos<0))
        {
          return true;
        }
      }
    }
    else
    {
      if(player == Player.W)
      {
        if(((x == this.xpos-1 || x == this.xpos+1)&& y == this.ypos+1)&& positions[x][y]!= null)
        {
          return true;
        }
        else if((x == this.xpos && (y - this.ypos <= 1 && y-this.ypos>0))&&positions[x][y]==null)
        {
          return true;
        }
        
      }
      else
      {
        if(((x == this.xpos-1 || x == this.xpos+1)&& y == this.ypos-1)&& positions[x][y]!= null)
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
public class Board
{
  public void drawAvailableMoves(Piece piece)
  {
    //goes through every square and calls to the selected object's availableMoves to decide to color or not
    if (mousePressed == true && mouseButton == LEFT)
    {
      for(int c=0; c<8;c++)
      {
        for(int r=0;r<8;r++)
        {
          if(piece.checkMove(c,r)==true)
          {
            fill(#A1DE98);
            rect(c*75+75, r*75+75, 75, 75);
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
        rect(c*75+75, r*75+75, 75, 75);
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
