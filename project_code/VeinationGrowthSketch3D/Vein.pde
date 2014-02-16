class Vein {
  float x1;
  float y1;
  float x2;
  float y2;
  float z1;
  float z2;
  float strokeWidth;
  
  Vein(float _x1, float _y1, float _z1, float _x2, float _y2, float _z2, float _strokeWidth) {
    x1 = _x1;
    y1 = _y1;
    x2= _x2;
    y2= _y2;
    z1=_z1;
    z2=_z2;
    strokeWidth = _strokeWidth;
  }
  
  void draw() {
    strokeWeight(strokeWidth);
    stroke(255);
    line(x1,y1,z1,x2,y2,z2);
  }
  
}
