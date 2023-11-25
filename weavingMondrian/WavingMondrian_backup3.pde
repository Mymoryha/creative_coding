final float friction = 0.9;
final float resiliency = -0.005;
final float mousePower = 0.05;
final int blockSize = 30;

Pixel[][] grid;
Pixel[][] columns;
Pixel[][] rows;

color yellow = color(255,212,70);
color red = color(224,36,39);
color blue = color(33,42,208);

PImage img;
PFont f;
void setup() {
  size(1080, 1080);
  background(255);
  printArray(PFont.list());
  f = createFont("x.ttf",24);
  textFont(f);
  textAlign(CENTER,CENTER);
  grid = makeGrid();//makegrid是一个以特定格式安排点的坐标的方法，初始化了pixel。
  frameRate(60);
  img = loadImage("evolution_1.png");
}

void draw() {
  background(#F0E4CB);
    stroke(50);
  textSize(270);
  text("Waving",660,590);
  text("Mondrian",540,870);
  //image(img,0,0,width,height);
  
  for (Pixel[] row : grid) {
    for (Pixel point : row) {
      point.update();
    }
  }
  
  Picture();
  noFill();
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY,20,20);
  //saveFrame();
}


Pixel[][] makeGrid() {
  int rows = floor(height / blockSize);
  int columns = floor(width/blockSize);
  Pixel[][] grid = new Pixel[rows][columns];
  this.rows = new Pixel[rows][columns];
  this.columns = new Pixel[columns][rows];
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[j][i] = new Pixel(i * blockSize+blockSize/2, j * blockSize+blockSize/2);
      this.rows[j][i] = grid[j][i];
      this.columns[i][j] = grid[j][i];
    }
  }
  return grid;
}//这个函数和draw函数连接非常紧密，很难去挪用到别的程序中，因为它使用了this关键字，使得它的使用范围受限了
//makegrid函数将所有点的位置坐标按照一定顺序存储在了二维数组中
