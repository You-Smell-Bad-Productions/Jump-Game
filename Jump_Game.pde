// You smell bad productions 
// Dead Rat
// Jump Game



float floorY = 650;


//player stuff
float grav= .7;
Player p;


// block stuff
PImage block;
float blockSize = 50;
ArrayList<Block> blocks = new ArrayList<Block>();


void setup()
{
  size(800, 800);
  
  //imageMode(CENTER);
  block = loadImage("wallSand.png");
  block.resize(50,50);

  // player data
  p = new Player(250, 100, 50);

  for ( int i=0; i < 10; i++)
    blocks.add(new Block ( '$',int(random(width)), int(random(height-150)) ));  
      
  catStamp();
}

void draw()
{
  background(123);
  p.moveMe();
  p.drawMe();
  p.checkCollision();


  for (Block b : blocks)
    b.drawBlock();
}

void keyPressed()
{
  if ( key == ' ' )
    p.jump();

  if ( key == 'd' )
    p.movingRight = true;

  if ( key == 'a' )
    p.movingLeft = true;
}

void keyReleased()
{
  if ( key == 'd' )
  {
    p.movingRight = false;
  }

  if ( key == 'a' )
  {
    p.movingLeft = false;
  }
}
















void catStamp() // Ha you found the super duper secret cat stamp
{
    println(" \\   /\\                 /\\   /");
    println("  ) ( ')               (' ) ( ");
    println(" (  /  )               (  \\  ) ");
    println("  \\(__)|               |(__)/ ");
}
