void addNode(float x, float y, String type) {
  Node node = new Node(x,y);
  if (type=="r") {
    nodesR.add(node);
  } else if (type=="g") {
    nodesG.add(node);
  } else if (type=="b") {
    nodesB.add(node);
  }
}

void addSource(float x, float y, String type) {
  Source source = new Source(x,y);
    if (type=="r") {
      sourcesR.add(source);
    } else if (type=="g") {
      sourcesG.add(source);
    } else if (type=="b") {
      sourcesB.add(source);
    }
}

void addVein(float x1, float y1, float x2, float y2, float strokeWidth, String type) {
  Vein vein = new Vein(x1,y1,x2,y2,strokeWidth);
   if (type=="r") {
      veinsR.add(vein);
    } else if (type=="g") {
      veinsG.add(vein);
    } else if (type=="b") {
      veinsB.add(vein);
    }
}
