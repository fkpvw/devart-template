void keyPressed() {
  if (key=='s') {
    save("coverImage03.jpg");
  } else if (key=='m') {
    shouldStartSavingFrames = !shouldStartSavingFrames;
  }
}
