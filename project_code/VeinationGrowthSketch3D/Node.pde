class Node {
  float x;
  float y;
  float z;
  float connectedX;
  float connectedY;
  float connectedZ;
  PVector sourceVector;
  
  Node(float _x, float _y, float _z) {
    x=_x;
    y=_y;
    z=_z;
  }
  
  void draw() {
    noStroke();
    fill(255);
    pushMatrix();
      translate(x,y,z);
      ellipse(0,0,1,1); 
    popMatrix();
  }
}
