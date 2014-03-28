/*
void addSources() {
  for (int i=0; i<nodesToAddPerFrame; i++) {
    float r = frameCount;
    float theta = random(0.0,TWO_PI);
    float x = r*sin(theta)+width/2;
    float y = r*cos(theta)+height/2;
    addSource(x,y);
  }
}
*/

void setPictureSourcesList() {
  for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        int loc = x + y * img.width;
        /*
        float lum = (0.2126*red(img.pixels[loc])+0.7152*green(img.pixels[loc])+0.0722*blue(img.pixels[loc]))/255;
        if (lum>0.5) {
          PVector pos = new PVector(x,y);
          pictureSources.add(pos);
        }
        */
        if (red(img.pixels[loc])/255>0.5){
          PVector pos = new PVector(x,y);
          pictureSourcesR.add(pos);
        }
        if (green(img.pixels[loc])/255>0.5){
          PVector pos = new PVector(x,y);
          pictureSourcesG.add(pos);
        }
        if (blue(img.pixels[loc])/255>0.5){
          PVector pos = new PVector(x,y);
          pictureSourcesB.add(pos);
        }
      }
  }
}

void addPictureSource(ArrayList <PVector> pictureSources, String type) {
  if (pictureSources.size()>0) {
    for (int i=0; i<nodesToAddPerFrame; i++) {
      int randomIndex = int(random(0,pictureSources.size()));
      PVector pos = pictureSources.get(randomIndex);
      addSource(pos.x,pos.y, type);
      pictureSources.remove(pos);
    }
  }
}

void removeSourcesOnNodeDistance(float _killDistanceSquared) {
    for (int i=sourcesR.size()-1;i>=0;i--) {
      for (int j=0;j<nodesR.size();j++) {
          float dx = sourcesR.get(i).x - nodesR.get(j).x;
          float dy = sourcesR.get(i).y - nodesR.get(j).y;
          float nodeToSourceDistance = dx*dx+dy*dy;
          if (nodeToSourceDistance<=_killDistanceSquared) {
              sourcesR.remove(i);
              break;
          }
      }
  }
  
  for (int i=sourcesG.size()-1;i>=0;i--) {
      for (int j=0;j<nodesG.size();j++) {
          float dx = sourcesG.get(i).x - nodesG.get(j).x;
          float dy = sourcesG.get(i).y - nodesG.get(j).y;
          float nodeToSourceDistance = dx*dx+dy*dy;
          if (nodeToSourceDistance<=_killDistanceSquared) {
              sourcesG.remove(i);
              break;
          }
      }
  }
  
  for (int i=sourcesB.size()-1;i>=0;i--) {
      for (int j=0;j<nodesB.size();j++) {
          float dx = sourcesB.get(i).x - nodesB.get(j).x;
          float dy = sourcesB.get(i).y - nodesB.get(j).y;
          float nodeToSourceDistance = dx*dx+dy*dy;
          if (nodeToSourceDistance<=_killDistanceSquared) {
              sourcesB.remove(i);
              break;
          }
      }
  }
  
}
/*
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
*/
void calculateNearestNodeForSources() {
  for (int i=0;i<sourcesR.size();i++){
      float shortestDistance=99999999;
      for (int j=0;j<nodesR.size();j++) {
          float dx = sourcesR.get(i).x - nodesR.get(j).x;
          float dy = sourcesR.get(i).y - nodesR.get(j).y;
          float nodeToSourceDistanceSquared = dx*dx+dy*dy;
          if (sourcesR.get(i).closestNode!=null) {
              if (nodeToSourceDistanceSquared<shortestDistance) {
                  sourcesR.get(i).closestNode = nodesR.get(j);
                  PVector nodeVector = new PVector(sourcesR.get(i).x-nodesR.get(j).x,sourcesR.get(i).y-nodesR.get(j).y);
                  nodeVector.normalize();
                  sourcesR.get(i).closestFromNodeVectorDir = nodeVector;
                  shortestDistance = nodeToSourceDistanceSquared;
              }
          } else {
              sourcesR.get(i).closestNode = nodesR.get(j);
              PVector nodeVector = new PVector(sourcesR.get(i).x-nodesR.get(j).x,sourcesR.get(i).y-nodesR.get(j).y);
              nodeVector.normalize();
              sourcesR.get(i).closestFromNodeVectorDir = nodeVector;
              shortestDistance = nodeToSourceDistanceSquared;
          }
      }
  } 
  
    for (int i=0;i<sourcesG.size();i++){
      float shortestDistance=99999999;
      for (int j=0;j<nodesG.size();j++) {
          float dx = sourcesG.get(i).x - nodesG.get(j).x;
          float dy = sourcesG.get(i).y - nodesG.get(j).y;
          float nodeToSourceDistanceSquared = dx*dx+dy*dy;
          if (sourcesG.get(i).closestNode!=null) {
              if (nodeToSourceDistanceSquared<shortestDistance) {
                  sourcesG.get(i).closestNode = nodesG.get(j);
                  PVector nodeVector = new PVector(sourcesG.get(i).x-nodesG.get(j).x,sourcesG.get(i).y-nodesG.get(j).y);
                  nodeVector.normalize();
                  sourcesG.get(i).closestFromNodeVectorDir = nodeVector;
                  shortestDistance = nodeToSourceDistanceSquared;
              }
          } else {
              sourcesG.get(i).closestNode = nodesG.get(j);
              PVector nodeVector = new PVector(sourcesG.get(i).x-nodesG.get(j).x,sourcesG.get(i).y-nodesG.get(j).y);
              nodeVector.normalize();
              sourcesG.get(i).closestFromNodeVectorDir = nodeVector;
              shortestDistance = nodeToSourceDistanceSquared;
          }
      }
  }
  
    for (int i=0;i<sourcesB.size();i++){
      float shortestDistance=99999999;
      for (int j=0;j<nodesB.size();j++) {
          float dx = sourcesB.get(i).x - nodesB.get(j).x;
          float dy = sourcesB.get(i).y - nodesB.get(j).y;
          float nodeToSourceDistanceSquared = dx*dx+dy*dy;
          if (sourcesB.get(i).closestNode!=null) {
              if (nodeToSourceDistanceSquared<shortestDistance) {
                  sourcesB.get(i).closestNode = nodesB.get(j);
                  PVector nodeVector = new PVector(sourcesB.get(i).x-nodesB.get(j).x,sourcesB.get(i).y-nodesB.get(j).y);
                  nodeVector.normalize();
                  sourcesB.get(i).closestFromNodeVectorDir = nodeVector;
                  shortestDistance = nodeToSourceDistanceSquared;
              }
          } else {
              sourcesB.get(i).closestNode = nodesB.get(j);
              PVector nodeVector = new PVector(sourcesB.get(i).x-nodesB.get(j).x,sourcesB.get(i).y-nodesB.get(j).y);
              nodeVector.normalize();
              sourcesB.get(i).closestFromNodeVectorDir = nodeVector;
              shortestDistance = nodeToSourceDistanceSquared;
          }
      }
  }
}

void addVeins() {
  for (int i=nodesR.size()-1;i>=0;i--){
    PVector sourceVector = new PVector(0,0);
    for (int j=0;j<sourcesR.size();j++) {
      //add all relevant normalised vectors to get final growth direction
      if (sourcesR.get(j).closestNode==nodesR.get(i)) {
         sourceVector = new PVector(sourceVector.x+sourcesR.get(j).closestFromNodeVectorDir.x,
         sourceVector.y+sourcesR.get(j).closestFromNodeVectorDir.y);
      }
    }
    float sourceVectorLengthSquared = sourceVector.magSq();
    if (sourceVectorLengthSquared>0) {
        sourceVector.normalize();
        float newX = nodesR.get(i).x+sourceVector.x*nodeGrowthDistance;
        float newY = nodesR.get(i).y+sourceVector.y*nodeGrowthDistance;
        addNode(newX,newY,"r");
        //stroke width exploration
        float strokeWidth = (500.0-frameCount)/500.0*2.0;
        strokeWidth = max(strokeWidth,0.01);
        if (newX != nodesR.get(i).connectedX && newY != nodesR.get(i).connectedY) {
          addVein(nodesR.get(i).x,nodesR.get(i).y,newX,newY,strokeWidth,"r");
          nodesR.get(i).connectedX = newX;
          nodesR.get(i).connectedY = newY;
        }
    }
  }
  
    for (int i=nodesG.size()-1;i>=0;i--){
    PVector sourceVector = new PVector(0,0);
    for (int j=0;j<sourcesG.size();j++) {
      //add all relevant normalised vectors to get final growth direction
      if (sourcesG.get(j).closestNode==nodesG.get(i)) {
         sourceVector = new PVector(sourceVector.x+sourcesG.get(j).closestFromNodeVectorDir.x,
         sourceVector.y+sourcesG.get(j).closestFromNodeVectorDir.y);
      }
    }
    float sourceVectorLengthSquared = sourceVector.magSq();
    if (sourceVectorLengthSquared>0) {
        sourceVector.normalize();
        float newX = nodesG.get(i).x+sourceVector.x*nodeGrowthDistance;
        float newY = nodesG.get(i).y+sourceVector.y*nodeGrowthDistance;
        addNode(newX,newY,"g");
        //stroke width exploration
        float strokeWidth = (500.0-frameCount)/500.0*2.0;
        strokeWidth = max(strokeWidth,0.01);
        if (newX != nodesG.get(i).connectedX && newY != nodesG.get(i).connectedY) {
          addVein(nodesG.get(i).x,nodesG.get(i).y,newX,newY,strokeWidth,"g");
          nodesG.get(i).connectedX = newX;
          nodesG.get(i).connectedY = newY;
        }
    }
  }
  
    for (int i=nodesB.size()-1;i>=0;i--){
    PVector sourceVector = new PVector(0,0);
    for (int j=0;j<sourcesB.size();j++) {
      //add all relevant normalised vectors to get final growth direction
      if (sourcesB.get(j).closestNode==nodesB.get(i)) {
         sourceVector = new PVector(sourceVector.x+sourcesB.get(j).closestFromNodeVectorDir.x,
         sourceVector.y+sourcesB.get(j).closestFromNodeVectorDir.y);
      }
    }
    float sourceVectorLengthSquared = sourceVector.magSq();
    if (sourceVectorLengthSquared>0) {
        sourceVector.normalize();
        float newX = nodesB.get(i).x+sourceVector.x*nodeGrowthDistance;
        float newY = nodesB.get(i).y+sourceVector.y*nodeGrowthDistance;
        addNode(newX,newY,"b");
        //stroke width exploration
        float strokeWidth = (500.0-frameCount)/500.0*2.0;
        strokeWidth = max(strokeWidth,0.01);
        if (newX != nodesB.get(i).connectedX && newY != nodesB.get(i).connectedY) {
          addVein(nodesB.get(i).x,nodesB.get(i).y,newX,newY,strokeWidth,"b");
          nodesB.get(i).connectedX = newX;
          nodesB.get(i).connectedY = newY;
        }
    }
  }
}
