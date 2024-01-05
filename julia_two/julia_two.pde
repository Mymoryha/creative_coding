float w = 4;
float h = (w*height)/width;
//规定取景框在复平面上的位置
float xmin = -w/2;
float ymin = -h/2;

int maxiterations = 100;

float xmax = xmin + w;
float ymax = ymin + h;

float dx = w / width/10;
float dy = h /height/10;
//实际上这里的dx = dy表示复平面和像素的放大倍数关系

float ca = 0.4;
float cb = -0.1;

void setup(){
  size(1000,1000);
  background(255);
  UI();
}

void draw(){
  background(255);
  loadPixels();
  float y = ymin;
for (int j = 0;j<height;j++){
  float x = xmin;//初始化应该放在循环之前
  for(int i = 0;i<width;i++){
    //当i等于零时，x等于xmin，i增加1,x增加dx，结果是i和x存在对应的关系
    //a和b是c的实部和虚部，遍历每个像素，，看这个像素的值做c能不能包含在m集里面
    float a = x;
    float b = y;
    int n = 0;
    float max = 4.0;//定义的无穷点
    float absOld = 0.0;
    float convergeNumber = maxiterations;
    //cn表示的是最终迭代的次数
    //n是计数器
    //max是迭代的最大次数
    while(n<maxiterations){
      float aa = a*a;
      float bb = b*b;
      float abs = sqrt(aa + bb);
      //如果发散
      if(abs>max){
        float diffToLast = (float)(abs - absOld);//发散速度
        float diffToMax = (float) (max - absOld);//到无穷的距离
        convergeNumber = n + diffToMax/diffToLast;
        //cn不仅反映出迭代的次数，还反应出到达无穷的时间，n越大发散性越小，后项越大发散性越小，同向的
        break;
      }
      float twoab = 2.0 *a*b;
      a = aa-bb + s.getArrayValue()[0];
      b = twoab + s.getArrayValue()[1];
      //第一项是0，第二项是c，后面的每一项都是迭代的结果
      n++;
      absOld = abs;
    }
    if(n == maxiterations){
      pixels[i + j*width] = color(0);
    }else{
    //float norm = map(convergeNumber , 0,maxiterations,0,1);
    float norm = map(convergeNumber%n , 0,maxiterations,0,1);
    //pixels[i+j*width] = color(norm*160*1.5,norm*80*1.5,norm*70*1.5);
    //pixels[i+j*width] = color(norm*160,norm*800,norm*70*1.5);
    //pixels[i+j*width] = color(255-norm*160*5,255-norm*800*5,255-norm*70*1.5*5);
    //colorMode(HSB);
    pixels[i+j*width] = color(i/width*360+norm*160,i+norm*800,i+norm*70*1.5);
    //pixels[i+j*width] = color(norm*100,norm*140,norm*200);
    //pixels[i+j*width] = color(map(sqrt(norm), 0, 1, 0, 255));
    }
    //渲染的原则是完全收敛为黑色，发散性越弱（cn越大）给色越白，这样字就可以勾勒出来边缘
    //计算和渲染放在同一个循环体里进行，因为每一个像素的计算和渲染都是相互独立的。
    x+=dx;//每次走一遍代码块i加1，x也增加一个dx，
  }
  y+=dy;
}
updatePixels();
}
