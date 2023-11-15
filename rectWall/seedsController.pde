class seedsController{
  rectSeed[] seeds;
  int num;
  
  int timer = 0;
  int growTime = 100;
  
  
  seedsController(rectSeed[] _seeds,int _num){
    seeds = _seeds;
    num = _num;
  }
  
  void initialize(){
    for(int i = 0;i < num;i++){
      seeds[i].initialize();
    }
  }
  
  
  void biggerAndStop(){
    timer--;
    for(int i = 0;i < num;i++){
      //seeds[i].stopGrow();//debug
      collide();
      seeds[i].grow();
      
      if(seeds[i].leftCollide){
        seeds[i].x1 += seeds[i].growingSpeedX/2;
        //seeds[i].stopGrow();
      }
      if(seeds[i].rightCollide){
        seeds[i].x2 -= seeds[i].growingSpeedX/2;
        //seeds[i].stopGrow();
      }
      if(seeds[i].topCollide){
        seeds[i].y1 += seeds[i].growingSpeedY/2;
        //seeds[i].stopGrow();
      }
      if(seeds[i].bottomCollide){
        seeds[i].y2 -= seeds[i].growingSpeedY/2;
        //seeds[i].stopGrow();
      }
      
      
      rectMode(CORNERS);
      stroke(0);
      strokeWeight(13);
      fill(0,0);
      rect(seeds[i].x1,seeds[i].y1,seeds[i].x2,seeds[i].y2);
    }   
  }
  
  void moveAll(){
    
  }
  
  
  void collide(){
    for(int i = 0;i <num;i++){
      for(int j = 0;j<num;j++){
        if(i == j){
        break;
        }
        float dx,dy,a,b;
        dx = abs(seeds[i].point.x - seeds[j].point.x);
        dy = abs(seeds[i].point.y - seeds[j].point.y);
        a = abs(seeds[i].x2-seeds[i].x1+seeds[j].x2 - seeds[j].x1)/2;
        b = abs(seeds[i].y2-seeds[i].y1+seeds[j].y2 - seeds[j].y1)/2;
        
        
        if(seeds[i].x1 >= seeds[j].x2-1   && seeds[i].x1 <= seeds[j].x2 +1  && dy<b){
            seeds[i].leftCollide = true;
            seeds[j].rightCollide = true;
          }
        if(seeds[i].x2 >= seeds[j].x1-1  && seeds[i].x2 <= seeds[j].x1 +1 && dy<b){

            seeds[j].leftCollide = true;
            seeds[i].rightCollide = true;
          }  
         if(seeds[i].y2 >= seeds[j].y1-1  && seeds[i].y2 <= seeds[j].y1+1  && dx<a){

            seeds[j].topCollide = true;
            seeds[i].bottomCollide = true;
          }   
         if(seeds[i].y1 >= seeds[j].y2-1  && seeds[i].y1 <= seeds[j].y2+1  && dx<a){

            seeds[i].topCollide = true;
            seeds[j].bottomCollide = true;
          } 
        }
      }
    }
  
  void drawPoints(){
    for(int i = 0;i < num;i++){
      stroke(0);
      strokeWeight(3);
      point(seeds[i].point.x,seeds[i].point.y);
    }
  }
}
