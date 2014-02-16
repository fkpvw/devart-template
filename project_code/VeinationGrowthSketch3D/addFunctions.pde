void addNode(float x, float y, float z) {
  Node node = new Node(x,y,z);
  nodes.add(node);
}

void addSource(float x, float y, float z) {
  Source source = new Source(x,y,z);
  sources.add(source);
}

void addVein(float x1, float y1, float z1, float x2, float y2, float z2, float strokeWidth) {
  Vein vein = new Vein(x1,y1,z1,x2,y2,z2,strokeWidth);
  veins.add(vein);
}
