
PImage WQueen, WKing, WKnight, WBishop, WRook, WPawn, BQueen, BKing, BKnight, BBishop, BRook, BPawn;
Board chessBoard = new Board();
Pieces[][] positions;

int xMouse;
int yMouse;
PImage selected;
enum Player
{
  W,B
}
enum Type
{
  Rook, Bishop, Knight, King, Queen, Pawn
}

void setup()
{
  size(750,750);
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

  
 // chessBoard.placePieces();
  

  
  
}
/*
checks if the mouse is inside the board and if LMB is pressed
displays the selected image on the real time mouse positions
*/
void moveSelected()
{
if((75 <= mouseX && mouseX <= 675)&& (75 <= mouseY && mouseY <= 675))
  {
    if(mouseButton == LEFT)
    {
      if(selected != null)
      {
        image(selected, mouseX, mouseY);
      }
    }
  }
}
void mousePressed()
{
  xMouse = mouseX;
  yMouse = mouseY;
  if((75 <= mouseX && mouseX <= 675)&& (75 <= mouseY && mouseY <= 675))
  {
    if(positions[(int)mouseX/75-1][(int)mouseY/75-1] != null)
    {
      selected = positions[(int)mouseX/75-1][(int)mouseY/75-1].getImage();
    }
    else
    {
      selected = null;
    }
  }
}
void mouseReleased()
{
  if(positions[(int)mouseX/75-1][(int)mouseY/75-1] == null)
  {
    positions[(int)mouseX/75-1][(int)mouseY/75-1].setPosition(mouseX, mouseY);
    positions[(int)mouseX/75-1][(int)mouseY/75-1].updatePosition(selected);
    

  }
  
}
void draw()
{
  background(255,255,255);
  chessBoard.create();
  chessBoard.setup();
  //chessBoard.placePieces();
  moveSelected();

  

}
public class Pieces
{
  int xpos;
  int ypos;
  Player player;
  Type type;
  Pieces(Player player, Type type)
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
    print(mouseX + " " + mouseY);
    
  }
  PImage getImage()
  {
    return null;
  }
  
  
  public void updatePosition(PImage image)
  {
   
      image(image, xpos*75+75, ypos*75+75);
    
  }
  
}
public class King extends Pieces
{
  King(Player player)
    {
      super(player, Type.King);
    }

    PImage getImage()
  {
    if(player == Player.W)
    {
      return WKing;
    }
    else return BKing;
  }
}
public class Queen extends Pieces
{
  Queen(Player player)
  {
    super(player, Type.Queen);
  }

  PImage getImage()
  {
    if(player == Player.W)
    {
      return WQueen;
    }
    else return BQueen;
  }
    
}
public class Bishop extends Pieces
{
  Bishop(Player player)
    {
      super(player, Type.Bishop);
    }

    PImage getImage()
  {
    if(player == Player.W)
    {
      return WBishop;
    }
    else return BBishop;
  }
}
public class Knight extends Pieces
{
  Knight(Player player)
  {
    super(player, Type.Bishop);
  }

  PImage getImage()
  {
    if(player == Player.W)
    {
      return WKnight;
    }
    else return BKnight;
  }
}
public class Rook extends Pieces
{
  Rook(Player player)
  {
    super( player, Type.Rook);
  }

  PImage getImage()
  {
    if(player == Player.W)
    {
      
      return WRook;
    }
    else return BRook;
  }
   
}
public class Pawn extends Pieces
{
  Pawn(Player player)
  {
    super(player, Type.Pawn);
  }
 
  PImage getImage()
  {
    if(player == Player.W)
    {
      return WPawn;
    }
    else return BPawn;
  }
    
}
public class Board{

  public void create()
  {
    
    //adds evenly spaced 75x75 sqaures and fills them in
    for(int r=0; r < 8; r++){
      for(int c=0; c < 8; c++){
        if (r%2==0){
          if(c%2==0){fill(237,199,141);}
          else{fill(196,140,55);}
        }
        else{
          if(c%2==0){fill(196,140,55);}
          else{fill(237,199,141);}
        }
        rect(r*75+75,c*75+75,75,75);
      }
    }
  }
  public void setup()
  {
    /*
    creates 2D array positions and initializes and declares objects in the correct positions
    calls setPosition and updatePosition for every spot in the array that is not null
    */
    positions = new Pieces[8][8];
    
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

  
    for(int x = 0; x < 8; x++)
    {
      for(int y = 0; y < 8; y++)
      {
        if(positions[x][y] != null)      
        {
          positions[x][y].setPosition(x,y);
          positions[x][y].updatePosition(positions[x][y].getImage());
        }
      }
    }
  }
  /*
  public void placePieces()
  {
    for(int x = 0; x < 8; x++)
    {
      for(int y = 0; y < 8; y++)
      {
        if(positions[x][y] != null)      
        {
          positions[x][y].setPosition(x,y);
          positions[x][y].updatePosition(positions[x][y].getImage());
          
        }
      }
    }
  }
  */
}
