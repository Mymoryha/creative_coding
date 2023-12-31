/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */

Flock flock;
void setup() {
  size(800, 800);
  flock = new Flock();
  UI();
  // Add an initial set of boids into the system
  for (int i = 0; i < 1000; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  fill(255);
    //ball.display();  
  
  fill(100);
  circle(mouseX,mouseY,20);
  flock.run();
  
    surface.setTitle("frameRate: " + nfc(frameRate, 2));
    //saveFrame("movie-######.png");
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
