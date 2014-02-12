ArrayList <Node> nodes;
ArrayList <Source> sources;
ArrayList <Vein> veins;
int nodesToAddPerFrame=5;
float nodeGrowthDistance = 1.0;
float killDistance = 4.0;
float sourceKillDistance = 4.0;
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

  addSources();

  removeSourcesOnNodeDistance(killDistanceSquared);
  removeSourcesOnSourceDistance(sourceKillDistanceSquared);
  
  calculateNearestNodeForSources();
  addVeins();

  //drawNodes();
  drawSources();
  drawVeins();
  
  if (shouldStartSavingFrames) { 
    saveFrame("frames/draw-######.png");
  }
}
