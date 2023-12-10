int maxTime = 2000;
int strokesPerFrame = 300;
int _frameCount = 0;

// Add your image here and on line 1 to preload it properly.
// Works best with images that don't exceed 700px.
String[] imgNames = {"crazyPlanck.jpg","Lucy6.png","maomao2.jpg","Lucy1.jpg", "Lucy5.jpg", "Lucy3.jpg","moon.jpg"};

PImage img;
int imgIndex = -1;
float brightnessShift;

void setup() {
  size(1600, 900);
  colorMode(HSB, 255);
  nextImage();
}

void draw() {
  _frameCount++;
  
  translate(width / 2, height / 2);
  
  for (int i = 0; i < strokesPerFrame; i++) {
    // Pick a random pixel.
    int index = int(random(img.width * img.height));
    
    // Get pixel's color and coordinates.
    color pixelColor = img.pixels[index];
    pixelColor = color(red(pixelColor), green(pixelColor), blue(pixelColor), 255);

    int x = index % img.width;
    int y = index / img.width;
    
    // Move image to center canvas.
    pushMatrix();
    translate(x - img.width / 2, y - img.height / 2);
    paintStroke(map(_frameCount, 0, maxTime, 10, 1), pixelColor, (int)random(0.2, 0.8) * map(_frameCount, 0, maxTime, 1, 0.1),x,y);
    //paintDot(pixelColor, random(2, 20) * map(_frameCount, 0, maxTime, 1, 0.5));
    popMatrix();
  }
  
  // Stop drawing once it exceeds the time.
  if (_frameCount >= maxTime) {
    nextImage();
    //noLoop();
  }
  //saveFrame("movie-######.png");
}

void mousePressed() {
  nextImage();
  background(0);
  _frameCount = frameCount % maxTime;
}

void nextImage() {
  // Reset values.
  loop();
  background(0);
  _frameCount = frameCount % maxTime;
  
  // Make shift random so hues aren't always the same.
  brightnessShift = random(255);
  
  // Load the next image.
  imgIndex++;
  if (imgIndex >= imgNames.length) {
    imgIndex = 0;
  }
  
  img = loadImage(imgNames[imgIndex]);
  img.resize(0,height);
  img.loadPixels();
}

void paintStroke(float strokeLength, color strokeColor, float strokeThickness, int x,int y) {
  float b = blue(strokeColor)+red(strokeColor)+hue(strokeColor);
  
  float bShift = b + brightnessShift ;
  if (bShift > 255) {
    bShift -= 255;
  }
  
  pushMatrix();
  // Map pixel's brightness to determine the stroke's direction.
  rotate(radians(map(bShift, 0, 255, -180, 180)));
  
  // Draw a dark stroke.
  //stroke(map(bShift, 0, 255, 0, 255), 150, map(b, 0, 255, 0, 100), 50);
  //line(-strokeLength, 1, strokeLength, 1);
  
  // Draw a normal stroke.
  colorMode(RGB,255);
  stroke(strokeColor);
  strokeWeight(strokeThickness);
  line(-strokeLength, 0, strokeLength, 0);
  
  // Draw a lighter stroke.
  //stroke(map(bShift, 0, 255, 0, 255), 150, map(b, 0, 255, 150, 255), 20);
  //line(-strokeLength, 2, strokeLength, 2);
  
  popMatrix();
}

void paintDot(color strokeColor, float strokeThickness) {
  float b = brightness(strokeColor);
  
  float bShift = b + brightnessShift;
  if (bShift > 255) {
    bShift -= 255;
  }
  
  pushMatrix();
  // Map pixel's brightness to determine the stroke's direction.
  rotate(radians(random(-180, 180)));
  
  // Draw a stroke with short length.
  colorMode(RGB,255);
  stroke(strokeColor);
  strokeWeight(strokeThickness);
  line(0, 0, 5, 0);
  
  popMatrix();
}
