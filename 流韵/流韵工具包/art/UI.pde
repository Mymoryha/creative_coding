ControlP5 slider_art;
ControlP5 toggle_art;
void UI_art() {
  int sliderWidth = 280;//控制条宽度
  int sliderHeight = 30;//控制条高度

  slider_art = new ControlP5(this, createFont("微软雅黑", 14));
  toggle_art = new ControlP5(this, createFont("微软雅黑", 14));
  slider_art.addSlider("speed_nei")//圆柱体高度细分数
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 1)
    .setValue(0.05)
    ;
    
    slider_art.addSlider("speed_wai")//圆柱体高度细分数
    .setPosition(20, 20+30+20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 1)
    .setValue(0.05)
    ;
    slider_art.addSlider("proportion_nei")//圆柱体高度细分数
    .setPosition(20, 20+100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 10)
    .setValue(1)
    ;
    slider_art.addSlider("proportion_wai")//圆柱体高度细分数
    .setPosition(20, 20+150)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 10)
    .setValue(1)
    ;
    slider_art.addSlider("scale_nei")//圆柱体高度细分数
    .setPosition(20, 20+200)
    .setSize(sliderWidth, sliderHeight)
    .setRange(20, 200)
    .setValue(50)
    ;
    slider_art.addSlider("scale_wai")//圆柱体高度细分数
    .setPosition(20, 20+250)
    .setSize(sliderWidth, sliderHeight)
    .setRange(20, 200)
    .setValue(50)
    ;
    slider_art.addSlider("num_arm_nei")//圆柱体高度细分数
    .setPosition(20, 20+300)
    .setSize(sliderWidth, sliderHeight)
    .setRange(2, 30)
    .setValue(10)
    ;
    slider_art.addSlider("num_arm_wai")//圆柱体高度细分数
    .setPosition(20, 20+350)
    .setSize(sliderWidth, sliderHeight)
    .setRange(2, 30)
    .setValue(10)
    ;
    
    slider_art.setAutoDraw(false);
}
