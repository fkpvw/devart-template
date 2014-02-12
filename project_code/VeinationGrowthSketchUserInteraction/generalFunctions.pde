void addSources() {
  for (int i=0; i<nodesToAddPerFrame; i++) {
    float r = frameCount;
    float theta = random(0.0,TWO_PI);
    float x = r*sin(theta)+width/2;
    float y = r*cos(theta)+height/2;
    addSource(x,y);
  }
}

void removeSourcesOnNodeDistance(float _killDistanceSquared) {
    for (int i=sources.size()-1;i>=0;i--) {
      for (int j=0;j<nodes.size();j++) {
          float dx = sources.get(i).x - nodes.get(j).x;
          float dy = sources.get(i).y - nodes.get(j).y;
          float nodeToSourceDistance = dx*dx+dy*dy;
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
            float nodeToSourceDistance = dx*dx+dy*dy;
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
          float nodeToSourceDistanceSquared = dx*dx+dy*dy;
          if (sources.get(i).closestNode!=null) {
              if (nodeToSourceDistanceSquared<shortestDistance) {
                  sources.get(i).closestNode = nodes.get(j);
                  PVector nodeVector = new PVector(sources.get(i).x-nodes.get(j).x,sources.get(i).y-nodes.get(j).y);
                  nodeVector.normalize();
                  sources.get(i).closestFromNodeVectorDir = nodeVector;
                  shortestDistance = nodeToSourceDistanceSquared;
              }
          } else {
              sources.get(i).closestNode = nodes.get(j);
              PVector nodeVector = new PVector(sources.get(i).x-nodes.get(j).x,sources.get(i).y-nodes.get(j).y);
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
         sourceVector.y+sources.get(j).closestFromNodeVectorDir.y);
      }
    }
    float sourceVectorLengthSquared = sourceVector.magSq();
    if (sourceVectorLengthSquared>0) {
        sourceVector.normalize();
        float newX = nodes.get(i).x+sourceVector.x*nodeGrowthDistance;
        float newY = nodes.get(i).y+sourceVector.y*nodeGrowthDistance;
        addNode(newX,newY);
        //stroke width exploration
        //float strokeWidth = (500.0-frameCount)/500.0*2.0;
        //strokeWidth = max(strokeWidth,0.01);
        float strokeWidth = 1.0;
        if (newX != nodes.get(i).connectedX && newY != nodes.get(i).connectedY) {
          addVein(nodes.get(i).x,nodes.get(i).y,newX,newY,strokeWidth);
          nodes.get(i).connectedX = newX;
          nodes.get(i).connectedY = newY;
        }
    }
  }
}
