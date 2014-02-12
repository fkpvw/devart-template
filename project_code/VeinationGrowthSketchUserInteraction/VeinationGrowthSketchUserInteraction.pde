ArrayList <Node> nodes;
ArrayList <Source> sources;
ArrayList <Vein> veins;
int nodesToAddPerFrame=5;
float nodeGrowthDistance = 1.0;
float killDistance = 1.0;
float sourceKillDistance = 1.0;
float killDistanceSquared;
float sourceKillDistanceSquared;
boolean shouldStartSavingFrames;

void setup() {
  size(1000,500);
  nodes = new ArrayList<Node>();
  sources = new ArrayList<Source>();
  veins = new ArrayList<Vein>();
  killDistanceSquared = sq(killDistance);
  sourceKillDistanceSquared = sq(sourceKillDistance);
  addNode(width/2,height/2);
  /*
  for (int i=-50; i<50; i++) {
    addNode(width/2,height/2+i);
  }
  */
}

void draw() {
  background(0);
  
  //addSources();

  removeSourcesOnNodeDistance(killDistanceSquared);
  //removeSourcesOnSourceDistance(sourceKillDistanceSquared);
  
  calculateNearestNodeForSources();
  addVeins();

  //drawNodes();
  drawSources();
  drawVeins();
  
  if (shouldStartSavingFrames) { 
    saveFrame("frames2/draw-######.png");
  } else {
    fill(255);
    ellipse(width/2,height/2,2,2);
    text("click to add nutrient source",10,20);
    text("press 'c' to clear",10,40);
    text("press 's' to save",10,60);
  }
}

void mousePressed() {
  addSource(mouseX,mouseY); 
}

void mouseDragged() {
  addSource(mouseX,mouseY);  
}
