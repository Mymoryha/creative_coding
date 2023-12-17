import peasy.*;
PeasyCam cam;
float[] SDofVoxels; 
int scale1 = 100;
int sphereNum = 8;

PVector[] cent;
PVector[] fangxiang;
float[] rad;
float speed = 1;
float r1 = 10;
float control=0;



void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this,300);
  SDofVoxels = new float[scale1*scale1*scale1];
  cent = new PVector[sphereNum];
  rad = new float[sphereNum];
  fangxiang = new PVector[sphereNum];
  for(int i = 0;i<sphereNum;i++){
    cent[i] = new PVector(50,50,50);
    rad[i] = i*30+10;
    fangxiang[i] = new PVector(random(5,10),random(5,10),random(5,10));
  }
  UI();
}

void draw() {
  background(225);
  point(0,0,0);
  fill(0,0,0);
  box(10);
  updateCent();
  
    for(int i = 0;i<SDofVoxels.length;i++){
    int x = i%scale1;
    int y = floor(i%(scale1*scale1)/scale1);
    int z = floor(i/(scale1*scale1));
    
    PVector p = new PVector(x,y,z);
    PVector o1 = new PVector(50,50,50);
    float DstofSphere = 0;
    fangxiangB = new PVector(-1,1,1);
    updateCent();
    float dstA = SDofSphere(p,o1,r1);
    float dstB = SDofSphere(p,centB,r1/2);
    float dstC = SDofSphere(p,centC,r1/2);
    float dstD = SDofSphere(p,centD,r1/2);
    float dstE = SDofSphere(p,centE,r1/2);
    float dstF = SDofSphere(p,centF,r1/2);
    float dstG = SDofSphere(p,centG,r1/2);
    float dstH = SDofSphere(p,centH,r1/2);
    float dstI = SDofSphere(p,centI,r1/2);
    DstofSphere = softMin(dstA,dstB,20);
    DstofSphere = softMin(DstofSphere,dstC,20);
    DstofSphere = softMin(DstofSphere,dstD,20);
    DstofSphere = softMin(DstofSphere,dstE,20);
    DstofSphere = softMin(DstofSphere,dstF,20);
    DstofSphere = softMin(DstofSphere,dstG,20);
    DstofSphere = softMin(DstofSphere,dstH,20);
    DstofSphere = softMin(DstofSphere,dstI,20);
    
    float dstBox = SDofBox(p,100);
    SDofVoxels[i] = softMin(DstofSphere,dstBox,8);
    
    //SDofVoxels[i] = dstA;
    //SDofVoxels[i] = dstB;
  }
  
    for(int i = 0;i<SDofVoxels.length;i++){
    int x = i%scale1;
    int y = floor(i%(scale1*scale1)/scale1);
    int z = floor(i/(scale1*scale1));    
    if(SDofVoxels[i]<0&& SDofVoxels[i]>-1){
      if(x<100&&y<100&&z<100){
      stroke(0);
      strokeWeight(1);
      pushMatrix();
      translate(x,y,z);
      //noStroke();
      fill(#90CE77);
      box(1);
      popMatrix();
    }
    }
  }
  noFill();
  stroke(0,3);
    //iso.plotVoxels();
  //camera(width / 2.0, height / 2.0, (height / 2.0) / tan(PI * 30.0 / 180.0), width / 2.0, height / 2.0, 0, 0, 1, 0);
  lights();
   pointLight(144, 206, 119, 100, 100, 200);
  surface.setTitle("frameRate:" + nfc(frameRate,2)); 
  
  cam.beginHUD();
  slider.draw();
  cam.endHUD();
  
    if (mouseX<300 && mouseY<200) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
  
    fill(255, 0, 0,100);
  strokeWeight(1);
    surface.setTitle("frameRate:" + nfc(frameRate,2));
    //iso.clear();
    
    for (int i = 0; i < 100; i ++) {
      for(int j=0;j<100;j++){
        stroke(51,100);
        strokeWeight(1);
        point(i, j,0);
        point(0, i,j);
        point(j, 0,i);
        point(i, j,100);
        point(100, i,j);
        point(j, 100,i);
        strokeWeight(1);
        stroke(0,255);
        point(i,0,0);
        point(0,i,0);
        point(0,0,i);
      }
    }
    
}
float SDofSphere(PVector p,PVector pos,float rad){
  PVector diff = pos.sub(p);
  float SD = diff.mag() - rad;
  return SD;
}

float SDofBox(PVector p,float a){
  if(p.x<a&&p.y<a&&p.z<a){
  return min(min(p.x+1,100-p.x+1),min(p.y+1,100-p.y+1),min(p.z+1,100-p.z+1));
}
else {return 1.0;}
}
float simpleMin(float dstA,float dstB){
  return min(dstA,dstB);
}
float lineMin(float dstA,float dstB){
  return (dstA+dstB)/2;
}

float softMin(float a, float b, float v) {
    if(a - b >= -v && a - b <= v) {      
        float k = (a - b + v) / (2 * v);
        return (1 - k) * a + k * b - v * k + v * k * k;
    } else if (a < b) {
        return a;
    } else {
        return b;
    }
}
