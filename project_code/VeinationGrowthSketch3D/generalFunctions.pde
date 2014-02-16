void addSources() {
  //cylinder
  if (frameCount%12==0 && frameCount<height) {
    for (int i=0; i<nodesToAddPerFrame; i++) {
      float r = 200;
      float theta = random(0.0,TWO_PI);
      float x = r*sin(theta);
      float y = frameCount;
      float z = r*cos(theta);
      addSource(x,y,z);
    }
  }
}

void removeSourcesOnNodeDistance(float _killDistanceSquared) {
    for (int i=sources.size()-1;i>=0;i--) {
      for (int j=nodes.size()-1;j>=0;j--) {
          float dx = sources.get(i).x - nodes.get(j).x;
          float dy = sources.get(i).y - nodes.get(j).y;
          float dz = sources.get(i).y - nodes.get(j).z;
          float nodeToSourceDistance = dx*dx+dy*dy+dz*dz;
          if (nodeToSourceDistance<=_killDistanceSquared) {
              sources.remove(i);
              break;
          }
      }
  }
}

void removeSourcesOnSourceDistance(float _killDistanceSquared) {
    for (int i=sources.size()-1;i>=0;i--) {
        for (int j=i-1;j>=0;j--) {
            float dx = sources.get(i).x - sources.get(j).x;
            float dy = sources.get(i).y - sources.get(j).y;
            float dz = sources.get(i).z - sources.get(j).z;
            float nodeToSourceDistance = dx*dx+dy*dy+dz*dz;
            if (nodeToSourceDistance<=_killDistanceSquared) {
                sources.remove(i);
                break;
            }
        }
    }
}

void calculateNearestNodeForSources() {
  for (int i=0;i<sources.size();i++){
      float shortestDistance=99999999;
      for (int j=0;j<nodes.size();j++) {
          float dx = sources.get(i).x - nodes.get(j).x;
          float dy = sources.get(i).y - nodes.get(j).y;
          float dz = sources.get(i).z - nodes.get(j).z;
          float nodeToSourceDistanceSquared = dx*dx+dy*dy+dz*dz;
          if (sources.get(i).closestNode!=null) {
              if (nodeToSourceDistanceSquared<shortestDistance) {
                  sources.get(i).closestNode = nodes.get(j);
                  PVector nodeVector = new PVector(sources.get(i).x-nodes.get(j).x,sources.get(i).y-nodes.get(j).y,sources.get(i).z-nodes.get(j).z);
                  nodeVector.normalize();
                  sources.get(i).closestFromNodeVectorDir = nodeVector;
                  shortestDistance = nodeToSourceDistanceSquared;
              }
          } else {
              sources.get(i).closestNode = nodes.get(j);
              PVector nodeVector = new PVector(sources.get(i).x-nodes.get(j).x,sources.get(i).y-nodes.get(j).y,sources.get(i).z-nodes.get(j).z);
              nodeVector.normalize();
              sources.get(i).closestFromNodeVectorDir = nodeVector;
              shortestDistance = nodeToSourceDistanceSquared;
          }
      }
  } 
}

void addVeins() {
  for (int i=nodes.size()-1;i>=0;i--){
    PVector sourceVector = new PVector(0,0);
    for (int j=0;j<sources.size();j++) {
      //add all relevant normalised vectors to get final growth direction
      if (sources.get(j).closestNode==nodes.get(i)) {
         sourceVector = new PVector(sourceVector.x+sources.get(j).closestFromNodeVectorDir.x,
         sourceVector.y+sources.get(j).closestFromNodeVectorDir.y,
         sourceVector.z+sources.get(j).closestFromNodeVectorDir.z);
      }
    }
    float sourceVectorLengthSquared = sourceVector.magSq();
    if (sourceVectorLengthSquared>0) {
        sourceVector.normalize();
        float newX = nodes.get(i).x+sourceVector.x*nodeGrowthDistance;
        float newY = nodes.get(i).y+sourceVector.y*nodeGrowthDistance;
        float newZ = nodes.get(i).z+sourceVector.z*nodeGrowthDistance;
        addNode(newX,newY,newZ);
        //stroke width exploration
        //float strokeWidth = (500.0-frameCount)/500.0*2.0;
        //strokeWidth = max(strokeWidth,0.01);
        if (newX != nodes.get(i).connectedX && newY != nodes.get(i).connectedY && newZ != nodes.get(i).connectedZ) {
          addVein(nodes.get(i).x,nodes.get(i).y,nodes.get(i).z,newX,newY,newZ,1.0);
          nodes.get(i).connectedX = newX;
          nodes.get(i).connectedY = newY;
          nodes.get(i).connectedZ = newZ;
        }
    }
  }
}
