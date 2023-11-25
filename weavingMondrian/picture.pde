int turning = 0;

void Picture(){
  truningUpdate();
  if(turning == 0){
    drawStroke(0,0,35,0,35);//大框
    
    drawStrokeRect(yellow,10,20,10,20);
    drawStroke(0,0,29,10,10);
    drawStroke(0,20,20,0,10);
    drawStroke(0,10,10,20,35);
    drawStroke(0,0,35,30,30);
    drawStroke(0,20,20,20,30);
    drawStroke(0,30,30,20,35);
    drawStrokeRect(red,30,35,0,20);
    drawStroke(0,20,30,20,25);
    drawStrokeRect(blue,20,30,0,10);
    drawStrokeRect(red,0,5,30,35);
  }
  if(turning == 1){
    drawStroke(0,0,35,0,35);
    drawStroke(0,0,20,0,5);
    drawRect(0,7,7,0,5);
    drawStrokeRect(yellow,20,25,0,21);
    drawStrokeRect(blue,25,30,0,21);
    drawStrokeRect(red,30,35,0,21);
    drawStrokeRect(red,0,35,32,35);
    drawStroke(0,0,35,21,24);
  }
  if(turning == 2){
    drawStroke(0,0,35,0,35);
    drawStrokeRect(blue,25,30,13,21);
    drawStrokeRect(red,32,35,0,3);
    drawStrokeRect(yellow,4,22,10,13);
    drawStrokeRect(yellow,30,34,23,32);
    
    drawStroke(0,0,22,0,3);
    drawStroke(0,4,22,3,10);
    drawStroke(0,22,24,13,13);
    drawStroke(0,22,35,7,7);
    drawStroke(0,32,32,0,7);
    drawStroke(0,22,35,13,13);
    drawStroke(0,25,25,21,35);
    drawPoint(0,22,30);
    drawStroke(0,34,34,13,35);
    drawStroke(0,26,30,32,32);
    drawStroke(0,0,3,13,13);
  }
  if(turning == 3){
    drawStroke(0,0,35,0,35);
    drawRect(yellow,0,21,14,35);
    drawRect(blue,23,35,0,12);
    drawStroke(0,0,35,13,13);
    drawStroke(0,22,22,0,35);
    drawRect(0,22,35,30,35);
    drawRect(255,35,35,14,29);
  }
  if(turning == 4){
    drawStroke(0,0,35,0,35);
    drawStrokeRect(red,15,20,20,25);
    drawStroke(0,15,15,0,20);
    drawStroke(0,20,20,25,35);
    drawStroke(0,0,15,25,25);
    drawStroke(0,20,35,20,20); 
    drawStrokeRect(yellow,0,15,0,4);
    drawStrokeRect(yellow,0,3,25,35);
    drawStrokeRect(yellow,20,35,33,35);
    drawStrokeRect(yellow,30,35,0,20);
  }
}
void truningUpdate(){
  if(turning >= 5){
    turning = 0;
  }
}
//注意update必须写在picture之前
