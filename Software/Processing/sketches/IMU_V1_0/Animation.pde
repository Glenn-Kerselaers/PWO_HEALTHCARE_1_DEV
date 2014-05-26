PGraphics pg_animation;
float x_animation, y_animation;

void initAnimation() {
  // Now create and clear graphic to be used (JAVA parameter
  // parameter is only needed for Processing 1.5.1)
  pg_animation = createGraphics(200, 160, JAVA2D);
  clearAnimation();
  // Set the graphic for this control. 
  // The graphic will be scaled to fit the control.
  sketchPad_animation.setGraphic(pg_animation);

  x_animation = pg_animation.width * 0.3;
  y_animation = pg_animation.height * 0.5;
  pg_animation.strokeWeight(3);
  pg_animation.stroke(255);
  pg_animation.smooth(4);
}

// Clear the sketchpad graphic
void clearAnimation() {
  pg_animation.beginDraw();
  pg_animation.background(0);
  pg_animation.noFill();
  pg_animation.ellipseMode(CORNERS);
  pg_animation.endDraw();
}

//  Clear the sketchpad graphic
void drawAnimation() {
  clearAnimation();
  float segLength = pg_animation.height / 4 * 0.8;

  float angle1 = (float(myIMU1.value.compAngleY) / 360) * 2 * -PI;
  float angle2 = (float(myIMU2.value.compAngleY) / 360) * 2 * PI;

  pg_animation.beginDraw();

  //pg_animation.line(10, 10, pg_animation.width-10, pg_animation.height - 1);
  pg_animation.pushMatrix();
  segment(x_animation, y_animation, angle1);
  segment(segLength, 0, angle2);
  pg_animation.popMatrix();

  pg_animation.endDraw();
}

//  Calculate and draw the segments
void segment(float x, float y, float a) { 
  float segLength = pg_animation.height / 4 * 0.8;
  pg_animation.translate(x, y);
  pg_animation.rotate(a);
  pg_animation.line(0, 0, segLength, 0);
}

