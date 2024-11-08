Particle [] bob = new Particle [300];
float circleCenterX;
float circleCenterY;
float circleRadius;
float rectCenterX;
float rectCenterY;
float rectWidth;

void setup()
{
  size (500, 500);
  noStroke();
  for (int i = 0; i < 1; i++) {
    bob [i] = new OddballParticle(); // inherited oddball
  }

  for (int i = 1; i < bob.length; i++) {
    bob [i] = new Particle();
  }


  circleCenterX = width/2;
  circleCenterY = height/2;
  circleRadius = 250;
  rectCenterX = width/2;
  rectCenterY = height/2;
  rectWidth = 300;
}

void draw()
{
  background (0);
  fill (0);
  ellipse (circleCenterX, circleCenterY, 500, 500);
  rect (rectCenterX, rectCenterY, 500, 500);
  for (int i = 0; i < bob.length; i++) {
    bob[i].move();
    bob[i].show();
  }
}


class Particle
{
  int Color, myOpacity;
  double myX, myY, Speed, Angle;

  Particle() {
    myX = (int)(Math.random () * 4) + 248;
    myY = (int)(Math.random () * 4) + 248;
    Speed = (int)(Math.random () * 4)+1;
    Angle = (int)(Math.random () * 90);
    Color = color (255, 255, (int)(Math.random() * 255));
    myOpacity = (int)(Math.random()*60)+60;
  }
  void move() {
    //make it so when go out then go back to center, go out, repeaet
    myX = myX + Math.cos(Angle) * Speed;
    myY = myY + Math.sin(Angle) * Speed;

    if (dist((float)myX, (float)myY, circleCenterX, circleCenterY) > circleRadius) {
      // if particle is greater than circle radius
      //then goes back => speed is negative
      Speed = -Speed;
    }
  }

  void show() {
    fill (Color, myOpacity);
    ellipse((int)myX, (int)myY, (int)(Math.random () * 20)+5, (int)(Math.random () * 20)+5); // cast as int bc declaration
    //is in double
  }
}

class OddballParticle extends Particle //inherits member variables from Particle

{
  OddballParticle() {
    myX = 250;
    myY = 250;
    Speed = .5;
    //Angle = (int)(Math.random () * 90);
    Angle = 45;
    Color = color(#0DFAD0);
    myOpacity = 100;
  }
  void move(){
    myX = myX + Math.cos(Angle) * Speed;
    myY = myY + Math.sin(Angle) * Speed;

    if (dist((float)myX, (float)myY, rectCenterX, rectCenterY) > rectWidth) {
      // if particle is greater than circle radius
      //then goes back => speed is negative
      Speed = -Speed;
    }
  }

  void show(){
    fill (Color, myOpacity);
    rect ((int)myX, (int)myY, 30, 50); // cast as int bc declaration
    //is in double
  }
}


