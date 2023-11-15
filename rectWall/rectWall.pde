rectSeed[] seeds;
seedsController sd;

int num;
float speedX;
float speedY;
void setup(){
  size(1080,540);
  num = 33;
  speedX = 1;
  speedY = 1;
  
  seeds = new rectSeed[num];
  for(int i = 0;i < num;i++){
    seeds[i] = new rectSeed(speedX,speedY);
  }
  sd = new seedsController(seeds,num);
  
  
  sd.initialize();
  
  frameRate(60);
}

void draw(){
  background(255);
  //sd.drawPoints();//debug
  //sd.bigger();//debug
  sd.biggerAndStop();
  //sd.moveAll();
  //saveFrame("rect-######.png");
}
