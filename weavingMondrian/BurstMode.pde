void burst(){
  PVector mouse = new PVector(mouseX,mouseY);
  for(Pixel[] row : grid){
    if(row != null){
      for (Pixel point : row){
        point.seeking = true;
        point.easing = false;
        PVector diff = PVector.sub(point.pos,mouse);
        float distance = diff.mag();
        float multiplier = pow(2,-(distance * mousePower));
        PVector force = diff.mult(multiplier);
        point.acc.add(force);
      }
    }
  }
}

void sand(){
  PVector mouse = new PVector(mouseX,mouseY);
  for(Pixel[] row : grid){
    if(row != null){
      for (Pixel point : row){
        point.seeking = false;
        point.easing = true;
        PVector diff = PVector.sub(point.pos,mouse);
        float distance = diff.mag();
        float multiplier = pow(2,-(distance * mousePower));
        PVector force = diff.mult(multiplier);
        point.acc.add(force.mult(0.5));
        
        PVector speedForce = new PVector(mouseX-pmouseX,mouseY-pmouseY);
        float cita;
        cita = speedForce.angleBetween(speedForce,point.pos);
        float angleMultiplier = cos(cita+PI/2)+1;
        point.acc.add(speedForce.mult(angleMultiplier).mult(0.5).mult(force.mag()));
        
        point.easing = true;
      }
    }
  }
}

void xiPai(){
  int rows = grid.length;
  int columns = grid[0].length;
  PVector[][] targets = new PVector[rows][columns];
  PVector[] arr = new PVector[rows * columns];
  Pixel[][] Temp = new Pixel[rows][columns];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      arr[i * columns + j] = grid[i][j].supposed;
    }
  }
  for (int i = rows * columns - 1; i > 0; i--) {
    int j = (int)random(i + 1);
    PVector temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      targets[i][j] = arr[i * columns + j];
    }
  }
  
  for(int i = 0;i<rows;i++){
    for(int j = 0;j<columns;j++){
      grid[i][j].easing = true;
      grid[i][j].supposed = targets[i][j];
    }
  }
}
