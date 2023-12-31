import controlP5.*;

ControlP5 slider;

void UI() {
  int sliderWidth = 300;//控制条宽度
  int sliderHeight = 30;//控制条高度

  slider = new ControlP5(this, createFont("微软雅黑", 14));

  slider.addSlider("_sep")
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 10)
    .setValue(4)
    ;
  slider.addSlider("_ali")
    .setPosition(20, 20+20+30)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 10)
    .setValue(1.3)
    ;
  slider.addSlider("_coh")
    .setPosition(20, 20+20+30+20+30)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 10)
    .setValue(1.8)
    ;  
  slider.addSlider("_mouse")
    .setPosition(20, 20+20+30+20+30+20+30)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 10)
    .setValue(1.8)
    ;    
  slider.setAutoDraw(true);
}
