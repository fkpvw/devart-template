class Source {
  float x;
  float y;
  float z;
  float shortestDistanceToNodeSquared;
  PVector closestFromNodeVectorDir;
  Node closestNode;
  
  Source(float _x, float _y, float _z) {
    x=_x;
    y=_y;
    z=_z;
  }
  
  void draw() {
    noStroke();
    fill(255,0,0);
    pushMatrix();
      translate(x,y,z);
      ellipse(0,0,2,2); 
    popMatrix();
  }
}
