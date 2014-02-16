void addNode(float x, float y) {
  Node node = new Node(x,y);
  nodes.add(node);
}

void addSource(float x, float y) {
  Source source = new Source(x,y);
  sources.add(source);
}

void addVein(float x1, float y1, float x2, float y2, float strokeWidth) {
  Vein vein = new Vein(x1,y1,x2,y2,strokeWidth);
  veins.add(vein);
}


