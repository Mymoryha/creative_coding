  DwFluid2D fluid_art;
  PGraphics2D pg_fluid_art;
  PGraphics2D pg_obstacles_art;
  MyParticleSystem particles_art;
  
  //origin是整个眼睛的中心
  PVector origin;
  float rad_nei = 100;
  
  //这一部分是关于网格的
  int num_nei_quan = 10;
  int num_nei = 30;
  int num_ceng = 30;
  int num_wai_quan = 20;
  int num_wai_ceng = 20;
  
  //速度场的整体速度
  float speed_nei = 0.5;
  float speed_wai = 0.05;
  
  //速度比例
  float proportion_nei = 1;
  float proportion_wai = 1;
  
  //生成大小
  float scale_nei = 50;
  float scale_wai = 50;
  
  //触角数量
  int num_arm_nei=10;
  int num_arm_wai=8;
  
  //障碍物
  float border_nei = 0;
  float border_wai = 300;
  
  //粒子数量
  int num_max = 400000;
  
  //自定义的更新操作
public void control_nei(DwFluid2D fluid) {
//制作瞳孔的速度场，包括瞳孔的外围一整圈速度，瞳孔内部向内部坍塌的速度场   

    float speed = -speed_nei/5;
    float p = proportion_nei;
    int num_nei_quan = num_arm_nei;
  //制作瞳孔内部的速度场,是一个涡旋场
  for(int i = 0;i<num_ceng;i++){
    for(int j = 0;j<num_nei_quan;j++){
      float ceta = j*TWO_PI/num_nei_quan;
      float xin  = origin.x+i*rad_art/num_ceng*cos(ceta);
      float yin  = origin.y+i*rad_art/num_ceng*sin(ceta);
      float vxin = (-1*cos(ceta)*(i*rad_art/num_ceng*speed)/(1+p)-p*sin(ceta)/(1+p))*(i*rad_art/num_ceng*speed);
      float vyin = (-1*sin(ceta)*(i*rad_art/num_ceng*speed)/(1+p)+p*cos(ceta)/(1+p))*(i*rad_art/num_ceng*speed);
      fluid.addVelocity(xin,yin,3,vxin,vyin);
    }
  }
  //每帧在外圈投放参考物,每个一段距离投放一组
      for(int i =0;i<num_ceta_art;i++){
          particles_art.spawn(fluid_art, origin.x+rad_art*cos(ceta[i]), origin.y+rad_art*sin(ceta[i]), scale_nei , int((sin(i*PI/30)+1)*10));
      }
    }
  
  
public void control_wai(DwFluid2D fluid) {
//制作虹膜的速度场，要求有一定的混沌性和成束性  

    float speed = speed_wai;
    float p = proportion_wai;
    int num_wai_quan = num_arm_wai;
  //制作瞳孔内部的速度场,是一个涡旋场
  for(int i = 2;i<num_wai_ceng;i++){
    for(int j = 0;j<num_wai_quan;j++){
      float ceta = j*TWO_PI/num_wai_quan;
      float xin  = origin.x+i*rad_art/num_wai_ceng*cos(ceta)+rad_art*cos(ceta);
      float yin  = origin.y+i*rad_art/num_wai_ceng*sin(ceta)+rad_art*sin(ceta);
      float vxin = (1*cos(ceta)/(1+p)-p*sin(ceta)/(1+p))*i*rad_art/num_wai_ceng*speed;
      float vyin = (1*sin(ceta)/(1+p)+p*cos(ceta)/(1+p))*i*rad_art/num_wai_ceng*speed;
      fluid.addVelocity(xin,yin,10,vxin,vyin);


    }
  }
  //每帧在外圈投放参考物,每个一段距离投放一组
      for(int i =0;i<num_ceta_art;i++){
          particles_art.spawn(fluid, origin.x+rad_art*cos(ceta[i])*1.5, origin.y+rad_art*sin(ceta[i])*1.5, scale_wai , int((sin(i*PI/120)+1)*50));
      }
    }  
  
void fluid_update_render(){
  fluid_art.addObstacles(pg_obstacles_art);
  fluid_art.update();  
  particles_art.update(fluid_art);
  pg_fluid_art.beginDraw();
  pg_fluid_art.background(0);
  pg_fluid_art.endDraw();  
    
  fluid_art.renderFluidTextures(pg_fluid_art, 0);
  particles_art.render(pg_fluid_art, 0);
  image(pg_fluid_art    , 0, 0);
  //image(pg_obstacles, 0, 0);
  
}

void fluid_settings(){
  surface.setLocation(230, 0);
  DwPixelFlow context = new DwPixelFlow(this);
  context.print();
  context.printGL();
  
  fluid_art = new DwFluid2D(context, 800, 800, 3);
  fluid_art.param.dissipation_density     = 0.999f;
  fluid_art.param.dissipation_velocity    = 0.99f;
  fluid_art.param.dissipation_temperature = 0.80f;
  fluid_art.param.vorticity               = 0f;
    
  fluid_art.addCallback_FluiData(new  DwFluid2D.FluidData(){
      public void update(DwFluid2D fluid) {
        control_nei(fluid);
        control_wai(fluid);
      }
    });
    
    pg_fluid_art = (PGraphics2D) createGraphics(800,800, P2D);
    pg_fluid_art.smooth(4);
    pg_fluid_art.beginDraw();
    pg_fluid_art.background(0);
    pg_fluid_art.endDraw();    
    
    pg_obstacles_art = (PGraphics2D) createGraphics(800, 800, P2D);
    pg_obstacles_art.smooth(4);
    pg_obstacles_art.beginDraw();
    pg_obstacles_art.clear();
    float radius;
    radius = 200;
    pg_obstacles_art.stroke(64);
    pg_obstacles_art.strokeWeight(5);
    pg_obstacles_art.noFill();
    //pg_obstacles.circle(1*width/2f,  1*height/2f, 2*border_nei);
    pg_obstacles_art.circle(1*width/2f,  1*height/2f, rad_art*6);
    //pg_obstacles.circle(1*width/2f,  1*height/2f, rad/2);
    //pg_obstacles.circle(1*width/2f,  1*height/2f, 130);
    // border-obstacle
    pg_obstacles_art.strokeWeight(20);
    pg_obstacles_art.stroke(64);
    pg_obstacles_art.noFill();
    //pg_obstacles.rect(0, 0, pg_obstacles.width, pg_obstacles.height);
    pg_obstacles_art.endDraw();
    
    fluid_art.addObstacles(pg_obstacles_art);
    
    particles_art = new MyParticleSystem(context, 1000 * 1000);    
   
  }
