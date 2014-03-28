ArrayList <Node> nodes;
ArrayList <Source> sources;
ArrayList <Vein> veins;
ArrayList <PVector> pictureSources;
int nodesToAddPerFrame=5;
float nodeGrowthDistance = 1.0;
float killDistance = 1.0;
float sourceKillDistance = 1.0;
float killDistanceSquared;
float sourceKillDistanceSquared;
boolean shouldStartSavingFrames=true;
PImage img;

void setup() {
  size(1000,500,OPENGL);
  nodes = new ArrayList<Node>();
  sources = new ArrayList<Source>();
  veins = new ArrayList<Vein>();
  pictureSources = new ArrayList<PVector>();
  killDistanceSquared = sq(killDistance);
  sourceKillDistanceSquared = sq(sourceKillDistance);
  //addNode(width/2,height/2);
  img = loadImage("img.jpg");
  
  for (int i=0; i<100; i++) {
    addNode(random(0,width),random(0,height));
  }
  
  setPictureSourcesList();
  
}

void draw() {
  blendMode(ADD);
  background(0);
  //addSources();
  addPictureSource();

  removeSourcesOnNodeDistance(killDistanceSquared);
  //removeSourcesOnSourceDistance(sourceKillDistanceSquared);
  
  calculateNearestNodeForSources();
  addVeins();

  //drawNodes();
  //drawSources();
  drawVeins();
  
  if (shouldStartSavingFrames) { 
    saveFrame("frames/draw-######.png");
  }
}
