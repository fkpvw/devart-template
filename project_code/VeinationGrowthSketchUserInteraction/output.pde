void keyPressed() {
  if (key=='s') {
    save("coverImage.jpg");
  } else if (key=='c') {
    nodes.clear();
    sources.clear();
    veins.clear();
    addNode(width/2,height/2);
  } else if (key=='m') {
    shouldStartSavingFrames=!shouldStartSavingFrames;
  }
}
