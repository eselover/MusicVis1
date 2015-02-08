import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


boolean manualMode = false;
ArrayList<Vector> points = new ArrayList<Vector>();
ArrayList<Vector> points2 = new ArrayList<Vector>();

PImage img;
Minim minim2;
AudioPlayer song2;
BeatDetect beat2;

int R = 255;
int G = 10;
int B = 255;

int bR = 0;
int bG = 0;
int bB = 0;

float time = millis()/500.0; // get number of seconds as a float
float scale = 3; // two methods for setting scale
float scale2 = 5;
float angle = (sin(time) + cos(time)); // two methods for setting angle
float angle2 = -(sin(time) + cos(time));

int count = 1;

void setup() {
  size(800, 500, P3D);
  smooth();
  // create points:
  // box shape:
  points2.add(new Vector(0, 0, 0));
  points2.add(new Vector(0, 10, 0));
  points2.add(new Vector(0, 20, 0));
  points2.add(new Vector(0, 30, 0));
  points2.add(new Vector(0, 40, 0));
  points2.add(new Vector(0, 50, 0));
  points2.add(new Vector(10, 50, 0));
  points2.add(new Vector(20, 50, 0));
  // four corners:
  points2.add(new Vector(30, 50, 0));
  points2.add(new Vector(40, 50, 0));
  points2.add(new Vector(50, 50, 0));
  points2.add(new Vector(50, 40, 0));


  points2.add(new Vector(50, 30, 0));
  points2.add(new Vector(50, 20, 0));
  points2.add(new Vector(50, 10, 0));
  points2.add(new Vector(50, 0, 0));
  points2.add(new Vector(50, 0, 0));
  points2.add(new Vector(40, 0, 0));
  points2.add(new Vector(30, 0, 0));
  points2.add(new Vector(20, 0, 0));
  points2.add(new Vector(10, 0, 0));
  points2.add(new Vector(25, 25, 0));

  points.add(new Vector(0, 0, 0));
  points.add(new Vector(0, 10, 0));
  points.add(new Vector(0, 20, 0));
  points.add(new Vector(0, 30, 0));
  points.add(new Vector(0, 40, 0));
  points.add(new Vector(0, 50, 0));
  points.add(new Vector(10, 50, 0));
  points.add(new Vector(20, 50, 0));
  // four corners:
  points.add(new Vector(30, 50, 0));
  points.add(new Vector(40, 50, 0));
  points.add(new Vector(50, 50, 0));
  points.add(new Vector(50, 40, 0));


  points.add(new Vector(50, 30, 0));
  points.add(new Vector(50, 20, 0));
  points.add(new Vector(50, 10, 0));
  points.add(new Vector(50, 0, 0));
  points.add(new Vector(50, 0, 0));
  points.add(new Vector(40, 0, 0));
  points.add(new Vector(30, 0, 0));
  points.add(new Vector(20, 0, 0));
  points.add(new Vector(10, 0, 0));
  points.add(new Vector(25, 25, 0));


  img = loadImage("leaf_test.png");

  minim2 = new Minim(this);
  song2 = minim2.loadFile("music2.mp3", 1024);
  song2.loop();

  beat2 = new BeatDetect();
}
void draw() {
  noStroke();
  fill(bR, bG, bB, 80);
  rect(0, 0, width, height);
  beat2.detectMode(BeatDetect.FREQ_ENERGY);
  beat2.detect(song2.mix);
  
  bR = 0;
  bG = 0;
  bB = 0;

  time = millis()/500.0; // get number of seconds as a float
  scale = 3; // two methods for setting scale
  scale2 = 5;
  angle = (sin(time) + cos(time)); // two methods for setting angle
  angle2 = -(sin(time) + cos(time));

  Matrix m = new Matrix(); // build matrix object
  Matrix m2 = new Matrix();

  if (beat2.isKick())
  {
    scale = 4;
  }
  if (beat2.isSnare())
  {
    scale2 = 7;
    angle += 40;
  }
  if (beat2.isHat())
  {
    angle = 0;
    angle2 = 0;
    
    bR = 10;
    bG = 10;
    bB = 255;
  }

  m2.translate(-25, -25, 0);
  m2.scale(scale2, scale2, scale2);
  m2.rotate(angle2);
  m2.translate(400, 250, 0);

  m.translate(-25, -25, 0); // slide up and to the left
  m.scale(scale, scale, scale); // scale up
  m.rotate(angle); // rotate
  m.translate(400, 250, 0); // reposition in center of window
  //m.translate(150*cos(time), 150*sin(time), 0);

  if (count-- <= 0)
  {
    R += random(2, 10);
    B += random(1, 60);
    G += random(0, 30);

    if (R > 256) R = (int)random(0, 255);
    if (B > 256) B = (int)random(0, 255);
    if (G > 256) G = (int)random(0, 255);
    count = (int)random(1, 5);
  }

  for (Vector v : points2)
  {
    Vector t = m2.transform(v);
    t.drawPoint(R, G, B, img);
  }

  for (Vector v : points) { // for every point...
    Vector t = m.transform(v); // transforms point V into point T
    t.drawPoint(R, G, B, img); // draw point T
  }
}

void mousePressed() {
  manualMode = !manualMode; // switch modes
}

