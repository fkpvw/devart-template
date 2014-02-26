import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;
import toxi.math.waves.*;
import toxi.processing.*;
import toxi.geom.Vec3D;

ArrayList <Node> nodes;
ArrayList <Source> sources;
ArrayList <Vein> veins;
int nodesToAddPerFrame=50;
float nodeGrowthDistance = 1.0;
float killDistance = 0.5;
float sourceKillDistance = 0.5;
float killDistanceSquared;
float sourceKillDistanceSquared;
boolean shouldStartSavingFrames=true;

int DIMX=192;
int DIMY=336;
int DIMZ=192;

float ISO_THRESHOLD=0.1;
Vec3D SCALE=new Vec3D(100,175,100);

VolumetricSpace volume;
VolumetricBrush brush;
IsoSurface surface;
TriangleMesh mesh;

ToxiclibsSupport gfx;

float currScale=4;
float density=0.5;
boolean shouldAddVolumeBrush=true;

void setup() {
  size(800,500,OPENGL);
  //toxi
  gfx=new ToxiclibsSupport(this);
  volume=new VolumetricSpaceArray(SCALE,DIMX,DIMY,DIMZ);
  brush=new RoundBrush(volume,SCALE.x/2);
  brush.setSize(0.7);
  surface=new ArrayIsoSurface(volume);
  mesh=new TriangleMesh();
  
  nodes = new ArrayList<Node>();
  sources = new ArrayList<Source>();
  veins = new ArrayList<Vein>();
  killDistanceSquared = sq(killDistance);
  sourceKillDistanceSquared = sq(sourceKillDistance);
  int numFirstNodes = 4;
  //cylinder 
  for(int i=0; i<numFirstNodes; i++) {
    float r = 50;
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
  
  beginShape(TRIANGLES);
  addVeins();

  pushMatrix();
    translate(width/2,90,-100);
    scale(3.0);
    //drawNodes();
    //drawSources();
    //drawVeins();
  popMatrix();
  
  pushMatrix();
    translate(width/2,90,-100);
    scale(3.2);
    rotate(PI);
    translate(0,-100,0);
    lightSpecular(230,230,230);
    directionalLight(255,255,255,1,1,-1);
    noStroke();
    fill(255);
    gfx.mesh(mesh);
  popMatrix();
  
  if (shouldStartSavingFrames) { 
    saveFrame("frames3DC/draw-######.png");
  }
  
}
