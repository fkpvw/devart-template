ArrayList <Node> nodesR;
ArrayList <Node> nodesG;
ArrayList <Node> nodesB;
ArrayList <Source> sourcesR;
ArrayList <Source> sourcesG;
ArrayList <Source> sourcesB;
ArrayList <Vein> veinsR;
ArrayList <Vein> veinsG;
ArrayList <Vein> veinsB;
ArrayList <PVector> pictureSourcesR;
ArrayList <PVector> pictureSourcesG;
ArrayList <PVector> pictureSourcesB;
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
  nodesR = new ArrayList<Node>();
  nodesG = new ArrayList<Node>();
  nodesB = new ArrayList<Node>();
  sourcesR = new ArrayList<Source>();
  sourcesG = new ArrayList<Source>();
  sourcesB = new ArrayList<Source>();
  veinsR = new ArrayList<Vein>();
  veinsG = new ArrayList<Vein>();
  veinsB = new ArrayList<Vein>();
  pictureSourcesR = new ArrayList<PVector>();
  pictureSourcesG = new ArrayList<PVector>();
  pictureSourcesB = new ArrayList<PVector>();
  killDistanceSquared = sq(killDistance);
  sourceKillDistanceSquared = sq(sourceKillDistance);
  //addNode(width/2,height/2);
  img = loadImage("pearl.jpg");
  
  for (int i=0; i<100; i++) {
    addNode(random(0,width),random(0,height),"r");
    addNode(random(0,width),random(0,height),"g");
    addNode(random(0,width),random(0,height),"b");
  }
  
  setPictureSourcesList();
  
}

void draw() {
  blendMode(ADD);
  background(0);
  //addSources();
  addPictureSource(pictureSourcesR, "r");
  addPictureSource(pictureSourcesG, "g");
  addPictureSource(pictureSourcesB, "b");

  removeSourcesOnNodeDistance(killDistanceSquared); //accounted for rgb
  //removeSourcesOnSourceDistance(sourceKillDistanceSquared);
  
  calculateNearestNodeForSources(); //accounted for rgb
  
  addVeins(); //accounted for rgb

  //drawNodes();
  //drawSources();
  drawVeins(); //accounted for rgb
  
  if (shouldStartSavingFrames) { 
    saveFrame("frames/draw-######.png");
  }
}
