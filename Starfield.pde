Particle[] Particles = new Particle[300];
void setup()
{
  size(750, 750);
  background(255);
  Particles[0] = new OddballParticle();
  for (int i = 1; i < Particles.length; i++) {
    Particles[i] = new Particle();
  }
}

void draw(){
  background(255);
  for (int i = 0; i < Particles.length; i++) {
    Particles[i].show();
    Particles[i].move();
  }
}

void mousePressed(){
   for (int i = 0; i < Particles.length; i++) {
    Particles[i].myX = Particles[i].myY = 375;
    Particles[i].mySpeed = Math.random()*10;
   }
}

class Particle
{
  double myX, myY, mySize, mySpeed, myAngle;
  Particle() {
    myX = myY = 375;
    mySize = 15;
    myAngle = Math.random()*(Math.PI*2);
    mySpeed = Math.random()*10;
  }
  void move() {
    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed; //(Math.random())*
  }
  void show() {
    fill(0);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myX = myY = Math.random()*1000;
    mySize = 20;
    myAngle = Math.random()*(Math.PI*2);
    mySpeed = Math.random()*10;
  }
  void move()
  {
    if (mouseX >= myX)
    myX += 4;
    else if (mouseX <= myX)
    myX -= 4;
    if (mouseY >= myY)
    myY += 4;
    else if (mouseY <= myY)
    myY -= 4;
  }
  void show() {
    noStroke();
    fill(173, 216, 230);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
