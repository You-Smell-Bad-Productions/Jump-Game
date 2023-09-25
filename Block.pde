class Block
{
  //data
  BlockType type;
  float xPos, yPos;
  float size;
  boolean pathable;
  
  
  //methods
  public Block(char t, float x, float y) //makes blocks exist
  {
    xPos = x;
    yPos = y;
    size = blockSize;
    
    pathable = true;
    
    type = setType(t);
  }
  
  float top()    { return yPos;}
  float bottom() { return yPos + blockSize;}
  float left()   { return xPos;}
  float right()  { return xPos + blockSize;}
  float xMiddle(){ return xPos + blockSize/2;}
  float yMiddle(){ return yPos + blockSize/2;}
  
  private BlockType setType( char t)
  {
    switch(t)
    {
      case ' ': return BlockType.NONE;
      case '#': return BlockType.WALL;
      case 'D': return BlockType.WALL;
      
      
    }
    
    
    return BlockType.NONE;
  }
  
  void drawBlock()
  {
    image(block , xPos, yPos);
  }
  
}

public enum BlockType
{
 NONE , WALL , SECRET_WALL , DOOR
}
