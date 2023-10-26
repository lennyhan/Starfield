Particle[] Particles = new Particle[201];
void setup()
{
  size(1000, 1000);
  background(255, 202, 229);
  for (int i = 0; i < Particles.length; i++) {
    Particles[i] = new Particle();
    Particles[200] = new OddballParticle();
  }
}
void draw()
{
  for (int i = 0; i < Particles.length; i++) {
    Particles[i].show();
    Particles[i].move();
  }
}
class Particle
{
  double myX, myY, mySize, mySpeed, myAngle;
  Particle() {
    myX = myY = 500;
    mySize = 5;
    myAngle = Math.random()*(Math.PI*2);
    mySpeed = Math.random()*10;
  }
  void move() {
    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed; //(Math.random())*
  }
  void show() {
    fill(173, 216, 230);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}

class OddballParticle extends Particle
{
  double myX, myY, size, speed, angle;
  OddballParticle() {
    myX = myY = Math.random()*1000;
    size = 20;
    myAngle = Math.random()*(Math.PI*2);
    mySpeed = Math.random()*10;
  }
  void move()
  {
    if (mouseX >= myX)
    myX += Math.random()*4;
    else if (mouseX <= myX)
    myX -= Math.random()*4;
    if (mouseY >= myY)
    myY += Math.random()*4;
    else if (mouseY <= myY)
    myY -= Math.random()*4;
  }
  void show() {
    noStroke();
    fill(255);
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
}
