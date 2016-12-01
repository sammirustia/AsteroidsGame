Bullet shoot;
class Bullet extends Floater
{
	public Bullet(SpaceShip Max)
	{
		myColor = color(231,187,86);
		myCenterX = max.getX();
		myCenterY = max.getY();
		myPointDirection = max.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dRadians) + max.getDirectionX();
		myDirectionY = 5*Math.sin(dRadians) + max.getDirectionY();
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


	public void show() 
	{
		fill(myColor);
		ellipse((float)myCenterX, (float) myCenterY, 5,10);
	}
}
