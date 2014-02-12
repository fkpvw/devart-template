class Node {
  float x;
  float y;
  float connectedX;
  float connectedY;
  PVector sourceVector;
  
  Node(float _x, float _y) {
    x=_x;
    y=_y;
  }
  
  void draw() {
    noStroke();
    fill(255);
    ellipse(x,y,1,1); 
  }
}
