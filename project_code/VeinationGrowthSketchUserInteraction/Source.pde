class Source {
  float x;
  float y;
  float shortestDistanceToNodeSquared;
  PVector closestFromNodeVectorDir;
  Node closestNode;
  
  Source(float _x, float _y) {
    x=_x;
    y=_y;
  }
  
  void draw() {
    noStroke();
    fill(255,0,0);
    ellipse(x,y,2,2); 
  }
}
