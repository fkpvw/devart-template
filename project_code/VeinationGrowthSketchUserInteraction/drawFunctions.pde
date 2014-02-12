void drawNodes() {
  for (int i=nodes.size()-1; i>=0; i--) {
    Node node = (Node)nodes.get(i);
    node.draw();
  }
}

void drawSources() {
  for (int i=sources.size()-1; i>=0; i--) {
    Source source = (Source)sources.get(i);
    source.draw();
  }
}

void drawVeins() {
  for (int i=veins.size()-1; i>=0; i--) {
    Vein vein = (Vein)veins.get(i);
    vein.draw();
  }
}
