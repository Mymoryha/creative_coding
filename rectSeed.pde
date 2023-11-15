class rectSeed{
  float x1;
  float x2;
  float y1;
  float y2;
  PVector point;
  
  float growingSpeedX;
  float growingSpeedY;
  
  boolean leftCollide = false;
  boolean rightCollide = false;
  boolean topCollide = false;
  boolean bottomCollide = false;
  
  boolean growing;
  rectSeed(){
    point = new PVector();
    x1 = point.x;
    x2 = x1;
    y1 = point.y;
    y2 = y1;
    
    growingSpeedX = 1;
    growingSpeedY = 1;
    
    growing = true;
  }

  void initialize(){
    point.set(floor(random(-100,width+100)),floor(random(-50,height+50)));
    x1 = point.x;
    x2 = x1;
    y1 = point.y;
    y2 = y1;    
  }
  void grow(){
    if(growing){
      x1 -= growingSpeedX/2;
      x2 += growingSpeedX/2;
      y1 -= growingSpeedY/2;
      y2 += growingSpeedY/2;
    }
  }
  
  void stopGrow(){
    growing = false;
  }
  
  void move(){
  
  }
  
}
