PVector centB,fangxiangB;
PVector centC;
PVector centD;
PVector centE;
PVector centF;
PVector centG;
PVector centH;
PVector centI;

void updateCent(){
  fangxiang[0] = new PVector(-1.1,-1,1);
  fangxiang[1] = new PVector(-0.1,-1,1);
  fangxiang[2] = new PVector(1,1,0);
  fangxiang[3] = new PVector(-1,1.2,1);
  fangxiang[4] = new PVector(0,-1,-1);
  fangxiang[5] = new PVector(0,1,-1);
  fangxiang[6] = new PVector(1,-0.2,0);
  fangxiang[7] = new PVector(1.1,-1.4,0);
  centB = new PVector(50,50,50).add(fangxiang[0].mult(control));
  centC = new PVector(50,50,50).add(fangxiang[1].mult(control));
  centD = new PVector(50,50,50).add(fangxiang[2].mult(control));
  centE = new PVector(50,50,50).add(fangxiang[3].mult(control));
  centF = new PVector(50,50,50).add(fangxiang[4].mult(control));
  centG = new PVector(50,50,50).add(fangxiang[5].mult(control));
  centH = new PVector(50,50,50).add(fangxiang[6].mult(control));
  centI = new PVector(50,50,50).add(fangxiang[7].mult(control));
}
