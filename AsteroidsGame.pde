SpaceShip max;
Star [] bright = new Star[200];
Asteroid [] more = new Asteroid[10];

public void setup() 
{
  size (600,600);
  background(28,26,81);
  for(int i = 0; i < bright.length; i++)
  {
    bright[i] = new Star();
  }
  for(int i = 0;i < more.length;i++)
  {
    more[i] = new Asteroid();
  }
  max = new SpaceShip();
}


public void draw() 
{
  background(28,26,81);
  for(int i = 0; i < bright.length;i++)
  {
    bright[i].show();
  }
  for(int i = 0;i < more.length;i++)
  {
    more[i].show();
    more[i].move();
  }
  max.show();
  max.move();
}


class Star
{
  private int myX, myY, myColor;

  public Star() 
  {
    myColor = color(251,252,178);
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
    
  }
  public void show()
  {
    stroke(myColor);
    ellipse(myX,myY,2,2);
  }
}

public void keyPressed()
  {
    if(keyCode == LEFT)
    {
      max.rotate(-15);
    }
    else if(keyCode == RIGHT)
    {
      max.rotate(15);
    }
    else if(keyCode == UP)
    {
      max.accelerate(.3);
    }
    else if(keyCode == DOWN) 
    {
      max.setDirectionX(0);
      max.setDirectionY(0);
    }
  }

  public void keyTyped()
  {
    if(key == 'h')
    {
      max.setDirectionX(0);
      max.setDirectionY(0);
      max.setX((int)(Math.random()*600)+1);
      max.setY((int)(Math.random()*600)+1);
      max.setPointDirection((int)(Math.random()*360));
    }
  }
class Asteroid extends Floater
{
   private int myRotation;

  public Asteroid() 
  {
    corners = 8;
    int [] xS = {-10,-4,0,9,10,8,0,-8};
    int [] yS = {0,-5,-10,-9,0,7,10,9};
    xCorners = xS;
    yCorners = yS;
    myColor = color(196,191,188);
    myCenterX = Math.random()*600;
    myCenterY = Math.random()*600;
    myDirectionX = Math.random()*3-1.5; 
    myDirectionY = Math.random()*3-1.5;
    myPointDirection = 270;
    myRotation = ((int)Math.random()*5)-3;
  }
  public void setX(int x) {myCenterX = x;}
   public int getX() {return (int)myCenterX;}
   public void setY(int y) {myCenterY = y;}
   public int getY() {return (int)myCenterY;} 
   public void setDirectionX(double x) {myDirectionX = x;}
   public double getDirectionX() {return (double)myDirectionX;} 
   public void setDirectionY(double y) {myDirectionY = y;}
   public double getDirectionY() {return (double)myDirectionY;}
   public void setPointDirection(int degrees) {myPointDirection = degrees;}
   public double getPointDirection() {return (double)myPointDirection;}  

   public void move()
   {
    rotate((int)(myRotation));
    super.move();
   }
}

class SpaceShip extends Floater  
{
  public SpaceShip () 
  {
      corners = 4;
      int [] xS = {-8,16,-8,-2};
      int [] yS = {-8,0,8,0};
      xCorners = xS;
      yCorners = yS;
      myColor = color(255,204,223);
      myCenterX = 300;
      myCenterY = 300;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 270;
  }
  
   public void setX(int x) {myCenterX = x;}
   public int getX() {return (int)myCenterX;}
   public void setY(int y) {myCenterY = y;}
   public int getY() {return (int)myCenterY;} 
   public void setDirectionX(double x) {myDirectionX = x;}
   public double getDirectionX() {return (double)myDirectionX;} 
   public void setDirectionY(double y) {myDirectionY = y;}
   public double getDirectionY() {return (double)myDirectionY;}
   public void setPointDirection(int degrees) {myPointDirection = degrees;}
   public double getPointDirection() {return (double)myPointDirection;}   
}



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 


  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {        
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

