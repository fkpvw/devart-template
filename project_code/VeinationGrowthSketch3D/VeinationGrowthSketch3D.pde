ArrayList <Node> nodes;
ArrayList <Source> sources;
ArrayList <Vein> veins;
int nodesToAddPerFrame=100;
float nodeGrowthDistance = 1.0;
float killDistance = 1.0;
float sourceKillDistance = 1.0;
float killDistanceSquared;
float sourceKillDistanceSquared;
boolean shouldStartSavingFrames=true;

void setup() {
  size(800,500,OPENGL);
  nodes = new ArrayList<Node>();
  sources = new ArrayList<Source>();
  veins = new ArrayList<Vein>();
  killDistanceSquared = sq(killDistance);
  sourceKillDistanceSquared = sq(sourceKillDistance);
  int numFirstNodes = 10;
  //cylinder 
  for(int i=0; i<numFirstNodes; i++) {
    float r = 200;
    float theta = TWO_PI/float(numFirstNodes)*i;
    float x = r*sin(theta);
    float y = 0;
    float z = r*cos(theta);
    addNode(x,y,z);
  }
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

  pushMatrix();
    translate(width/2,90,-100);
    //drawNodes();
    drawSources();
    drawVeins();
  popMatrix();
  
  if (shouldStartSavingFrames) { 
    saveFrame("frames2/draw-######.png");
  }
  
}
