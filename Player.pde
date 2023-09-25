class Player
{
  //data
  float xPos, yPos;
  float xSpd, ySpd;
  float size = 25;
  boolean hitBlock;
  boolean movingLeft, movingRight;
  
  //methods
  public Player(float x, float y, float s) //makes player exist
  {
    xPos = x;
    yPos = y;
    size = s;
  }

  void moveMe()
  {
    xPos += xSpd;
    yPos += ySpd;
    ySpd += grav;
    xSpd *= .98;

    if ( yPos >= floorY )
    {
      ySpd = 0;
      yPos = floorY;
    }

    if (movingLeft)
      xSpd -= .2;

    if (movingRight)
      xSpd += .2;
  }

  void drawMe()
  {
    circle(xPos, yPos, size);
  }

  void jump()
  {
    ySpd = -13 ;
  }


  void checkCollision()
  {
    
    for(Block b: blocks)
    {
      // checks blocks top
      if ( bottom() >= b.top() && xPos >= b.left() && xPos <= b.right() && bottom() <= b.yMiddle())
        snapTo( b, "top" ); 
      //checks blocks top
      if ( top() < b.bottom() && xPos >= b.left() && xPos <= b.right() && top() >= b.yMiddle())
        snapTo( b, "bottom" ); 
  
      //checks blocks left side
      if ( right() >= b.left() && yPos <= b.bottom() && yPos >= b.top() && right() <= b.xMiddle())
        snapTo( b, "left" );  //<>//
      //checks blocks right side
      if ( left() <= b.right() && yPos <= b.bottom() && yPos >= b.top() && left() >= b.xMiddle())
        snapTo( b, "right");  
    }
  }



  void snapTo( Block b, String side )   // controlls the coloision of the blbocks by having it so that when the player touches the block it snaps to the side of the block
  {
    
    if( side.toUpperCase().equals("TOP") || side.toUpperCase().equals("BOTTOM") ) ySpd = 0;
    if( side.toUpperCase().equals("LEFT") || side.toUpperCase().equals("RIGHT") ) xSpd = 0;
  
    if (side.toUpperCase().equals( "TOP" ))
    {
      while ( bottom() > b.top() )
      {
        yPos--;
      }
    }

    if (side.toUpperCase().equals( "BOTTOM" ))
    {
      while ( top() < b.bottom() )
      {
        yPos++;
      }
    }

    if (side.toUpperCase().equals( "LEFT" ))
    {
      while ( right() > b.left() )
      {
        xPos--;
      }
    }

    if (side.toUpperCase().equals( "RIGHT" ))
    {
      while ( left() < b.right() )
      {
        xPos++;
      }
    }
  }
  
  float top()    {return yPos - 25;}
  float bottom() {return yPos + 25;}
  float left()   {return xPos - 25;}
  float right()  {return xPos + 25;}
}
