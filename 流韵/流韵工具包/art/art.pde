import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;

import controlP5.Accordion;
import controlP5.ControlP5;
import controlP5.Group;

import controlP5.Toggle;
import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.opengl.PJOGL;

public void settings(){
  size(800,800,P2D);
  smooth(2);
  PJOGL.profile = 3;
}

int num_ceta_art = 30;
float[] ceta;
float rad_art; 

boolean drawUI = true;

  public void setup(){
    
    UI_art();
    ceta = new float[num_ceta_art];
    for(int i = 0;i<num_ceta_art;i++){
      ceta[i] = i*TWO_PI/num_ceta_art;
    }
    rad_art =100;
    
    origin = new PVector(width/2,height/2);
  fluid_settings();
}
boolean pause_aet = false;
public void draw(){  
  
  for(int i = 0;i<num_ceta_art;i++){
    ceta[i] += 0.01;
  }

  if(!pause_aet){
 fluid_update_render();}
 
 if(drawUI){
  slider_art.draw();}
}

void keyPressed(){
  if(key == 'u'){
    drawUI = !drawUI;
  }
  
  if(key == 's'){
    saveFrame("save-######.png");
  }
  if(key == 'p'){
    pause_aet = !pause_aet;
  }
}
