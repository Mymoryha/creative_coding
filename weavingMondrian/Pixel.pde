class Pixel{
  PVector supposed;//目标的位置
  PVector pos;//现在的位置
  PVector vel;//目前的速度
  PVector acc;//目前的加速度
  boolean seeking = true;
  boolean easing = true;
  
  Pixel(float x,float y){
    supposed = new PVector(x,y);//输入值是supposed
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void update(){
    if(seeking){
    seek(supposed);}
    //seeking控制了是否回弹，easing控制了怎么回弹
    vel.add(acc);
    pos.add(vel);
    pos.set(constrain(pos.x,-20,width + 20),constrain(pos.y,-20,height + 20));
    vel.mult(friction);//对速度更新摩擦力的影响，摩擦力等同于加速度的作用.这里是直接乘以摩擦力，进行速度的变小，不是传统的摩擦力
    vel.set(constrain(vel.x,-40,40),constrain(vel.y,-40,40));
    acc.mult(0);//对acc进行归零，为什么？每一帧都要归零然后在每一帧重新计算所有运动量，burst的作用就只存在于一帧中
    strokeWeight(0);
    fill(255);
    rectMode(CENTER);
    rect(pos.x,pos.y,blockSize-1,blockSize-1);
  }
  
  void seek(PVector target){
    if(easing){
      PVector diff = PVector.sub(target,pos);
      float easing = 0.09;
      pos.add(diff.mult(easing));
    }
    else{//弹弹弹
    PVector diff = PVector.sub(pos,target);
    float distance = diff.mag();
    PVector force = diff.mult(distance).mult(resiliency);
    acc.add(force);
    if(diff.mag()>blockSize*5)
      acc.add(force.mult(0.000001/diff.mag() ));}
    //将target规定为原始的点坐标，就可以让点始终可以回到原始位置
    //seek规定了点的运动模式是平方反比加上摩擦力的形式
    //需要注意的点是force和distance的平方相关，不是线性相关
  }
  
  
}
