/*
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
*/

void drawVeins() {
  for (int i=veinsR.size()-1; i>=0; i--) {
    Vein vein = (Vein)veinsR.get(i);
    vein.draw(color(255,0,0));
  }
  
  for (int i=veinsG.size()-1; i>=0; i--) {
    Vein vein = (Vein)veinsG.get(i);
    vein.draw(color(0,255,0));
  }
  
  for (int i=veinsB.size()-1; i>=0; i--) {
    Vein vein = (Vein)veinsB.get(i);
    vein.draw(color(0,0,255));
  }
}
