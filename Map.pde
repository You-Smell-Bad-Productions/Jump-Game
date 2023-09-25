class Map
{
  Block blocks [] [];
  int xSize, ySize; 
  
  public Map( String blockString, int x, int index ) 
  {
    xSize = x;
    ySize = blockString.length()/x;
    blocks = new Block[xSize][ySize];
    assignBlocksByString(blockString,index);
  }
  
  private void assignBlocksByString( String blockMap, int index )
  {
    for( int i  = 0; i < ySize; i++ )
    {
      for( int j = 0; j < xSize; j++ )
      {
        blocks[j][i] = new Block( blockMap.charAt((i*xSize)+j), j*blockSize, i*blockSize );
      }
    }
  }
  
  
  
  
}
