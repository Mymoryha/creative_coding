import controlP5.*;
import peasy.*;

ControlP5 slider;

void UI() {
  int sliderWidth = 300;//控制条宽度
  int sliderHeight = 30;//控制条高度

  slider = new ControlP5(this, createFont("微软雅黑", 14));

  slider.addSlider("r1")//圆柱体高度细分数
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(5, 72)
    .setValue(5)
    ;
  slider.addSlider("control")//圆柱体高度细分数
    .setPosition(20, 20+20+30+20+30+20+30)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 50)
    .setValue(0)
    ;
  slider.setAutoDraw(false);
}

/**
 * [showNormal description]
 * @Author   bit2atom
 * @DateTime 2022-10-20T21:18:36+0800
 * @param    {[type]}                 boolean theFlag       [toggle status: on / off]
 * @return   {[type]}                         [该toggle用于控制法线的显示]
 */
