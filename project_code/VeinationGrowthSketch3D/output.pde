void keyPressed() {
  if (key=='s') {
    save("coverImage.jpg");
  } else if (key=='m') {
    shouldStartSavingFrames = !shouldStartSavingFrames;
  }
}
