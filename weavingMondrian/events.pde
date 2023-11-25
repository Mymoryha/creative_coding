void mouseDragged(){
  if (mouseButton == RIGHT){
  sand();}
  else burst();
}
void mousePressed(){
  if (mouseButton == RIGHT)
  sand();
  else burst();
}

void mouseReleased(){
  if(mouseButton == RIGHT){
  for(Pixel[] row : grid){
    if(row != null){
      for (Pixel point : row){
      point.seeking = true;
      }
    }
    }
    xiPai();
    turning++; 
    
  }
  

}
