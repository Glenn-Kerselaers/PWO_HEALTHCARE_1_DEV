public GPlot plot1, plot2;

float time_Graph;

void initGraph() { 
  // Setup first plot for IMU #1 data
  plot1 = new GPlot(window_graph.papplet, 0, 0, 400, 250);
  plot1.getTitle().setText("Graph for IMU #1");
  plot1.getXAxis().getAxisLabel().setText("Time");
  plot1.getYAxis().getAxisLabel().setText("Value");

  // Setup second plot for IMU #2 data
  plot2 = new GPlot(window_graph.papplet, 0, 250, 400, 250);
  plot2.getTitle().setText("Graph for IMU #2");
  plot2.getXAxis().getAxisLabel().setText("Time");
  plot2.getYAxis().getAxisLabel().setText("Value");

  // Setup layers
  // for IMU #1 data
  plot1.addLayer("accX 1", myIMU1.graph.points.accX);
  plot1.getLayer("accX 1").setLineColor(color(255, 255, 0));  //geel          
  plot1.addLayer("accY 1", myIMU1.graph.points.accY);
  plot1.getLayer("accY 1").setLineColor(color(0, 255, 0));  //groen        
  plot1.addLayer("accZ 1", myIMU1.graph.points.accZ);
  plot1.getLayer("accZ 1").setLineColor(color(255, 165, 0));  //oranje          
  plot1.addLayer("gyroX 1", myIMU1.graph.points.gyroX);
  plot1.getLayer("gyroX 1").setLineColor(color(0, 0, 139));  //dblauw        
  plot1.addLayer("gyroY 1", myIMU1.graph.points.gyroY);
  plot1.getLayer("gyroY 1").setLineColor(color(173, 216, 230));  //lblauw         
  plot1.addLayer("gyroZ 1", myIMU1.graph.points.gyroZ);
  plot1.getLayer("gyroZ 1").setLineColor(color(128, 0, 128));  //paars          
  plot1.addLayer("compAngleX 1", myIMU1.graph.points.compAngleX);
  plot1.getLayer("compAngleX 1").setLineColor(color(165, 42, 42));  //bruin          
  plot1.addLayer("compAngleY 1", myIMU1.graph.points.compAngleY);
  plot1.getLayer("compAngleY 1").setLineColor(color(255, 0, 0));  //rood          
  plot1.addLayer("tempCal 1", myIMU1.graph.points.tempCal);          
  plot1.getLayer("tempCal 1").setLineColor(color(128, 138, 135));  //grijs       
  plot1.addLayer("tempRaw 1", myIMU1.graph.points.tempRaw);
  plot1.getLayer("tempRaw 1").setLineColor(color(0, 0, 0));  //zwart

  // for IMU #2 data
  plot2.addLayer("accX 2", myIMU2.graph.points.accX);
  plot2.getLayer("accX 2").setLineColor(color(255, 255, 0));  //geel          
  plot2.addLayer("accY 2", myIMU2.graph.points.accY);
  plot2.getLayer("accY 2").setLineColor(color(0, 255, 0));  //groen        
  plot2.addLayer("accZ 2", myIMU2.graph.points.accZ);
  plot2.getLayer("accZ 2").setLineColor(color(255, 165, 0));  //oranje          
  plot2.addLayer("gyroX 2", myIMU2.graph.points.gyroX);
  plot2.getLayer("gyroX 2").setLineColor(color(0, 0, 139));  //dblauw        
  plot2.addLayer("gyroY 2", myIMU2.graph.points.gyroY);
  plot2.getLayer("gyroY 2").setLineColor(color(173, 216, 230));  //lblauw         
  plot2.addLayer("gyroZ 2", myIMU2.graph.points.gyroZ);
  plot2.getLayer("gyroZ 2").setLineColor(color(128, 0, 128));  //paars          
  plot2.addLayer("compAngleX 2", myIMU2.graph.points.compAngleX);
  plot2.getLayer("compAngleX 2").setLineColor(color(165, 42, 42));  //bruin          
  plot2.addLayer("compAngleY 2", myIMU2.graph.points.compAngleY);
  plot2.getLayer("compAngleY 2").setLineColor(color(255, 0, 0));  //rood          
  plot2.addLayer("tempCal 2", myIMU2.graph.points.tempCal);          
  plot2.getLayer("tempCal 2").setLineColor(color(128, 138, 135));  //grijs       
  plot2.addLayer("tempRaw 2", myIMU2.graph.points.tempRaw);
  plot2.getLayer("tempRaw 2").setLineColor(color(0, 0, 0));  //zwart

  // Setup the mouse actions
  plot1.activatePanning();
  plot1.activatePointLabels();
  plot1.activateZooming(1.2, CENTER, CENTER);
  plot2.activatePanning();
  plot2.activatePointLabels();
  plot2.activateZooming(1.2, CENTER, CENTER);
}

public void drawGraph() {
  int sampleTime1 = int(textfield_sampleTime1.getText());
  int sampleTime2 = int(textfield_sampleTime2.getText());

  // add new points to the graph points
  // link the update points back to the layer
  time_Graph = millis() - startTime_Graph;

  plot1.beginDraw();
  plot1.drawBackground();
  plot1.drawBox();
  plot1.drawXAxis();
  plot1.drawYAxis();
  plot1.drawTopAxis();
  plot1.drawRightAxis();
  plot1.drawTitle();
  plot1.drawLabels();
  if (checkbox_accX1.isSelected() == true) {
    myIMU1.graph.points.accX.add(time_Graph, myIMU1.value.accX, "(" + "accX1" + "," + time_Graph + " , " + myIMU1.value.accX + ")");
    plot1.setPoints(myIMU1.graph.points.accX, "accX 1");
    plot1.getLayer("accX 1").drawLines();
  }
  if (checkbox_accY1.isSelected() == true) {
    myIMU1.graph.points.accY.add(time_Graph, myIMU1.value.accY, "(" + "accY1" + "," + time_Graph + " , " + myIMU1.value.accY + ")");
    plot1.setPoints(myIMU1.graph.points.accY, "accY 1");
    plot1.getLayer("accY 1").drawLines();
  }
  if (checkbox_accZ1.isSelected() == true) {
    myIMU1.graph.points.accZ.add(time_Graph, myIMU1.value.accZ, "(" + "accZ1" + "," + time_Graph + " , " + myIMU1.value.accZ + ")");
    plot1.setPoints(myIMU1.graph.points.accZ, "accZ 1");
    plot1.getLayer("accZ 1").drawLines();
  }
  if (checkbox_gyroX1.isSelected() == true) {
    myIMU1.graph.points.gyroX.add(time_Graph, myIMU1.value.gyroX, "(" + "gyroX1" + "," + time_Graph + " , " + myIMU1.value.gyroX + ")");
    plot1.setPoints(myIMU1.graph.points.gyroX, "gyroX 1");
    plot1.getLayer("gyroX 1").drawLines();
  }
  if (checkbox_gyroY1.isSelected() == true) {
    myIMU1.graph.points.gyroY.add(time_Graph, myIMU1.value.gyroY, "(" + "gyroY1" + "," + time_Graph + " , " + myIMU1.value.gyroY + ")");
    plot1.setPoints(myIMU1.graph.points.gyroY, "gyroY 1");
    plot1.getLayer("gyroY 1").drawLines();
  }
  if (checkbox_gyroZ1.isSelected() == true) {
    myIMU1.graph.points.gyroZ.add(time_Graph, myIMU1.value.gyroZ, "(" + "gyroZ1" + "," + time_Graph + " , " + myIMU1.value.gyroZ + ")");
    plot1.setPoints(myIMU1.graph.points.gyroZ, "gyroZ 1");
    plot1.getLayer("gyroZ 1").drawLines();
  }
  if (checkbox_compAngleX1.isSelected() == true) {
    myIMU1.graph.points.compAngleX.add(time_Graph, myIMU1.value.compAngleX, "(" + "compAngleX1" + "," + time_Graph + " , " + myIMU1.value.compAngleX + ")");
    plot1.setPoints(myIMU1.graph.points.compAngleX, "compAngleX 1");
    plot1.getLayer("compAngleX 1").drawLines();
  }
  if (checkbox_compAngleY1.isSelected() == true) {
    myIMU1.graph.points.compAngleY.add(time_Graph, myIMU1.value.compAngleY, "(" + "compAngleY1" + "," + time_Graph + " , " + myIMU1.value.compAngleY + ")");
    plot1.setPoints(myIMU1.graph.points.compAngleY, "compAngleY 1");
    plot1.getLayer("compAngleY 1").drawLines();
  }
  if (checkbox_tempRaw1.isSelected() == true) {
    myIMU1.graph.points.tempRaw.add(time_Graph, myIMU1.value.tempRaw, "(" + "tempRaw1" + "," + time_Graph + " , " + myIMU1.value.tempRaw + ")");
    plot1.setPoints(myIMU1.graph.points.tempRaw, "tempRaw 1");
    plot1.getLayer("tempRaw 1").drawLines();
  }
  if (checkbox_tempCal1.isSelected() == true) {
    myIMU1.graph.points.tempCal.add(time_Graph, myIMU1.value.tempCal, "(" + "tempCal1" + "," + time_Graph + " , " + myIMU1.value.tempCal + ")");
    plot1.setPoints(myIMU1.graph.points.tempCal, "tempCal 1");
    plot1.getLayer("tempCal 1").drawLines();
  }
  plot1.endDraw();

  plot2.beginDraw();
  plot2.drawBackground();
  plot2.drawBox();
  plot2.drawXAxis();
  plot2.drawYAxis();
  plot2.drawTopAxis();
  plot2.drawRightAxis();
  plot2.drawTitle();
  plot2.drawLabels();
  if (checkbox_accX2.isSelected() == true) {
    myIMU2.graph.points.accX.add(time_Graph, myIMU2.value.accX, "(" + "accX2" + "," + time_Graph + " , " + myIMU2.value.accX + ")");
    plot2.setPoints(myIMU2.graph.points.accX, "accX 2");
    plot2.getLayer("accX 2").drawLines();
  }
  if (checkbox_accY2.isSelected() == true) {
    myIMU2.graph.points.accY.add(time_Graph, myIMU2.value.accY, "(" + "accY2" + "," + time_Graph + " , " + myIMU2.value.accY + ")");
    plot2.setPoints(myIMU2.graph.points.accY, "accY 2");
    plot2.getLayer("accY 2").drawLines();
  }
  if (checkbox_accZ2.isSelected() == true) {
    myIMU2.graph.points.accZ.add(time_Graph, myIMU2.value.accZ, "(" + "accZ2" + "," + time_Graph + " , " + myIMU2.value.accZ + ")");
    plot2.setPoints(myIMU2.graph.points.accZ, "accZ 2");
    plot2.getLayer("accZ 2").drawLines();
  }
  if (checkbox_gyroX2.isSelected() == true) {
    myIMU2.graph.points.gyroX.add(time_Graph, myIMU2.value.gyroX, "(" + "gyroX2" + "," + time_Graph + " , " + myIMU2.value.gyroX + ")");
    plot2.setPoints(myIMU2.graph.points.gyroX, "gyroX 2");
    plot2.getLayer("gyroX 2").drawLines();
  }
  if (checkbox_gyroY2.isSelected() == true) {
    myIMU2.graph.points.gyroY.add(time_Graph, myIMU2.value.gyroY, "(" + "gyroY2" + "," + time_Graph + " , " + myIMU2.value.gyroY + ")");
    plot2.setPoints(myIMU2.graph.points.gyroY, "gyroY 2");
    plot2.getLayer("gyroY 2").drawLines();
  }
  if (checkbox_gyroZ2.isSelected() == true) {
    myIMU2.graph.points.gyroZ.add(time_Graph, myIMU2.value.gyroZ, "(" + "gyroZ2" + "," + time_Graph + " , " + myIMU2.value.gyroZ + ")");
    plot2.setPoints(myIMU2.graph.points.gyroZ, "gyroZ 2");
    plot2.getLayer("gyroZ 2").drawLines();
  }
  if (checkbox_compAngleX2.isSelected() == true) {
    myIMU2.graph.points.compAngleX.add(time_Graph, myIMU2.value.compAngleX, "(" + "compAngleX2" + "," + time_Graph + " , " + myIMU2.value.compAngleX + ")");
    plot2.setPoints(myIMU2.graph.points.compAngleX, "compAngleX 2");
    plot2.getLayer("compAngleX 2").drawLines();
  }
  if (checkbox_compAngleY2.isSelected() == true) {
    myIMU2.graph.points.compAngleY.add(time_Graph, myIMU2.value.compAngleY, "(" + "compAngleY2" + "," + time_Graph + " , " + myIMU2.value.compAngleY + ")");
    plot2.setPoints(myIMU2.graph.points.compAngleY, "compAngleY 2");
    plot2.getLayer("compAngleY 2").drawLines();
  }
  if (checkbox_tempRaw2.isSelected() == true) {
    myIMU2.graph.points.tempRaw.add(time_Graph, myIMU2.value.tempRaw, "(" + "tempRaw2" + "," + time_Graph + " , " + myIMU2.value.tempRaw + ")");
    plot2.setPoints(myIMU2.graph.points.tempRaw, "tempRaw 2");
    plot2.getLayer("tempRaw 2").drawLines();
  }
  if (checkbox_tempCal2.isSelected() == true) {
    myIMU2.graph.points.tempCal.add(time_Graph, myIMU2.value.tempCal, "(" + "tempCal2" + "," + time_Graph + " , " + myIMU2.value.tempCal + ")");
    plot2.setPoints(myIMU2.graph.points.tempCal, "tempCal 2");
    plot2.getLayer("tempCal 2").drawLines();
  }
  plot2.endDraw();
}

