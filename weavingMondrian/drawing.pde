void drawPoint(color c,int a,int b){
  rectMode(CENTER);
  noStroke();
  fill(c);
  int spx = a * blockSize+blockSize/2;
  int spy = b * blockSize+blockSize/2;
  PVector pointTarget = seekBySupposed(spx,spy);
  rect(grid[(int)pointTarget.x][(int)pointTarget.y].pos.x,grid[(int)pointTarget.x][(int)pointTarget.y].pos.y,blockSize-0.5,blockSize-0.5);
}


void drawRect(color c,int x1,int x2,int y1,int y2){
  fill(c);
  rectMode(CENTER);
  for(int i = x1;i<x2+1;i++){
    for(int j = y1;j<y2+1;j++){
      drawPoint(c,j,i);
    }
  }
}

void drawStrokeRect(color c,int x1,int x2,int y1,int y2){
  rectMode(CENTER);
      drawRect(c,x1,x2,y1,y2);
      drawRect(0,x1,x1,y1,y2);
      drawRect(0,x1,x2,y1,y1);
      drawRect(0,x2,x2,y1,y2);
      drawRect(0,x1,x2,y2,y2);
}

void drawStroke(color c ,int x1,int x2,int y1,int y2){
  rectMode(CENTER);
  drawRect(c,x1,x1,y1,y2);
  drawRect(c,x1,x2,y1,y1);
  drawRect(c,x2,x2,y1,y2);
  drawRect(c,x1,x2,y2,y2);
}

PVector seekBySupposed(int a,int b){
  PVector target;
  target = new PVector(0,0);
  for(int i = 0;i<grid.length;i++){
    for(int j = 0;j<grid[0].length;j++){
      if(a == grid[i][j].supposed.x){
        if(b == grid[i][j].supposed.y){
          target = new PVector(i,j);
        }
      }
    }
  }

  return target;
}
