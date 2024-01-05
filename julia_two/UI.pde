import controlP5.*;
ControlP5 cp5;
Slider2D s;

void UI(){
  cp5 = new ControlP5(this);
  s = cp5.addSlider2D("wave")
         .setPosition(30,40)
         .setSize(100,100)
         .setMinMax(-1,-1,1,1)
         .setValue(0,0)
         //.disableCrosshair()
         ;
}         
