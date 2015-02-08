class Vector {
  float x = 0;
  float y = 0;
  float z = 0;
  // constructor that leaves x and y at their default values
  public Vector() {
  }

  // constructor that sets x and y to the same value
  public Vector(float value) {
    this.x = value;
    this.y = value;
    this.z = value;
  }

  // constructor that sets x and y independently
  public Vector(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  // returns a copy of this vector
  Vector copy() {
    Vector copy = new Vector();

    copy.x = this.x;
    copy.y = this.y;
    copy.z = this.z;

    return copy;
  }

  // adds a vector to this vector
  void add(Vector v) {
    v = v.copy();

    this.x += v.x;
    this.y += v.y;
  }

  // subtracts a vector from this vector
  void sub(Vector v) {

    v = v.copy();
    this.x -= v.x;
    this.y -= v.y;
  }

  // multiplies this vector with a scalar
  void mult(float s) {  
    this.x *= s;
    this.y *= s;
  }

  // returns the dot product of the two vectors
  float dot(Vector v) {

    v = v.copy();

    float dot = (this.x*v.x) + (this.y*v.y);

    return dot;
  }

  // returns the vector's magnitude squared
  float magSq() {
    float magsq = ((x*x) + (y*y));

    return magsq;
  }

  // returns the vector's magnitude
  float mag() {
    // tip: call magSq()
    float Mag = sqrt(magSq());
    return Mag;
  }

  // returns the distance from this Vector (point) to another Vector (point)
  float disTo(Vector v) {
    float dx;
    float dy;
    float dis;

    dx = this.x - v.x;
    dy = this.y - v.y;

    dis = sqrt(dx*dx + dy*dy);

    return dis;
  }

  // normalizes the vector
  void norm() {
    x = this.x / mag();
    y = this.y / mag();
  }

  // returns the angle of the Vector (in radians)
  float angle() {
    float vAngle = atan2(this.y, this.x);

    return vAngle;
  }

  // returns the angle from this Vector (point) to another Vector (point)
  float angleTo(Vector v) {
    v = v.copy();
    v.sub(this);          

    return v.angle();
  }

  // draws a circle at (x, y)
  void drawPoint(int R, int G, int B, PImage img) {
    
    //image(img, x, y, 50, 50);
    //tint(R, G, B);
    //image(img, x, y, 50, 50);
    noStroke();
    fill(R, G, B);
    ellipse(x, y, 10, 10);
  }

  // returns a string representing this object (for debugging)
  String toString() {
    String str = "X:  " + this.x + ",   Y:  " + this.y;

    return str;
  }
}

