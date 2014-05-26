/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void imgButton1_LogoPxl_click(GImageButton source, GEvent event) { //_CODE_:imgButton_LogoPxl:810868:
  link("http://www.pxl.be");
  textarea_console.appendText(timeStamp + "Visiting PXL webpage ...");
} //_CODE_:imgButton_LogoPxl:810868:

public void imgButton_logoGithub_click(GImageButton source, GEvent event) { //_CODE_:imgButton_logoGithub:943067:
  link("https://github.com/Glenn-Kerselaers/PWO_HEALTHCARE_1_DEV");
  textarea_console.appendText(timeStamp + "Visiting Github repo ...");
} //_CODE_:imgButton_logoGithub:943067:

public void imgButton_logoImu_click(GImageButton source, GEvent event) { //_CODE_:imgButton_logoImu:933533:
  link("http://xmotionplus.co.nf/");
  textarea_console.appendText(timeStamp + "Visiting xMotionPlus webpage ...");
} //_CODE_:imgButton_logoImu:933533:

public void textarea_console_change(GTextArea source, GEvent event) { //_CODE_:textarea_console:563522:
} //_CODE_:textarea_console:563522:

public void button_start_click(GButton source, GEvent event) { //_CODE_:button_start:906387:
  startCommunication();
} //_CODE_:button_start:906387:

public void button_clearConsole_click(GButton source, GEvent event) { //_CODE_:button_clearConsole:654478:
  textarea_console.setText("");  // empty textarea by writing "nothing" 
  customGUI();  //re-create custom GUI
} //_CODE_:button_clearConsole:654478:

public void dropList_baud1_click(GDropList source, GEvent event) { //_CODE_:dropList_baud1:308840:
} //_CODE_:dropList_baud1:308840:

public void dropList_com1_click(GDropList source, GEvent event) { //_CODE_:dropList_com1:253554:
} //_CODE_:dropList_com1:253554:

public void dropList_baud2_click(GDropList source, GEvent event) { //_CODE_:dropList_baud2:833132:
} //_CODE_:dropList_baud2:833132:

public void dropList_com2_click1(GDropList source, GEvent event) { //_CODE_:dropList_com2:355172:
} //_CODE_:dropList_com2:355172:

public void button_connect1_click(GButton source, GEvent event) { //_CODE_:button_connect1:530530:
  connectIMU(myIMU1);
} //_CODE_:button_connect1:530530:

public void button_connect2_click(GButton source, GEvent event) { //_CODE_:button_connect2:851447:
  connectIMU(myIMU2);
} //_CODE_:button_connect2:851447:

public void button_findSerial_click(GButton source, GEvent event) { //_CODE_:button_findSerial:469101:
  findSerials();
} //_CODE_:button_findSerial:469101:

public void button_openGraph_click(GButton source, GEvent event) { //_CODE_:button_openGraph:455514:
  window_graph.setVisible(true);
  textarea_console.appendText(timeStamp + "Opening Graph window");
  textarea_console.appendText(" ");
  startTime_Graph = millis();
} //_CODE_:button_openGraph:455514:

public void button_openAnimation_click(GButton source, GEvent event) { //_CODE_:button_openAnimation:996082:
  window_animation.setVisible(true);
  textarea_console.appendText(timeStamp + "Opening Animation window");
  textarea_console.appendText(" ");
} //_CODE_:button_openAnimation:996082:

public void textfield_send_change(GTextField source, GEvent event) { //_CODE_:textfield_send:529509:
} //_CODE_:textfield_send:529509:

public void button_send_click(GButton source, GEvent event) { //_CODE_:button_send:515935:
  sendMessage();
} //_CODE_:button_send:515935:

public void dropList_whoSend_click(GDropList source, GEvent event) { //_CODE_:dropList_whoSend:741946:
} //_CODE_:dropList_whoSend:741946:

synchronized public void win_graph_draw(GWinApplet appc, GWinData data) { //_CODE_:window_graph:648207:
  appc.background(255);
  if (setupDone == true) {
    drawGraph();
  }
} //_CODE_:window_graph:648207:

public void checkbox_accX1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_accX1:760319:
} //_CODE_:checkbox_accX1:760319:

public void checkbox_accY1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_accY1:779671:
} //_CODE_:checkbox_accY1:779671:

public void checkbox_accZ1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_accZ1:866521:
} //_CODE_:checkbox_accZ1:866521:

public void checkbox_gyroX1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_gyroX1:473591:
} //_CODE_:checkbox_gyroX1:473591:

public void checkbox_gyroY1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_gyroY1:881533:
} //_CODE_:checkbox_gyroY1:881533:

public void checkbox_gyroZ1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_gyroZ1:452883:
} //_CODE_:checkbox_gyroZ1:452883:

public void checkbox_compAngleX1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_compAngleX1:287258:
} //_CODE_:checkbox_compAngleX1:287258:

public void checkbox_compAngleY1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_compAngleY1:349615:
} //_CODE_:checkbox_compAngleY1:349615:

public void checkbox_tempRaw1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_tempRaw1:952285:
} //_CODE_:checkbox_tempRaw1:952285:

public void checkbox_tempCal1_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_tempCal1:456568:
} //_CODE_:checkbox_tempCal1:456568:

public void textfield_sampleTime1_change(GTextField source, GEvent event) { //_CODE_:textfield_sampleTime1:524841:
} //_CODE_:textfield_sampleTime1:524841:

public void checkbox_accX2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_accX2:631084:
  println("checkbox_accX2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_accX2:631084:

public void checkbox_accY2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_accY2:762599:
  println("checkbox_accY2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_accY2:762599:

public void checkbox_accZ2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_accZ2:922405:
  println("checkbox_accZ2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_accZ2:922405:

public void checkbox_gyroX2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_gyroX2:569707:
  println("checkbox_gyroX2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_gyroX2:569707:

public void checkbox_gyroY2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_gyroY2:358279:
  println("checkbox_gyroY2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_gyroY2:358279:

public void checkbox_gyroZ2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_gyroZ2:807207:
  println("checkbox_gyroZ2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_gyroZ2:807207:

public void checkbox_compAngleX2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_compAngleX2:907479:
  println("checkbox_compAngleX2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_compAngleX2:907479:

public void checkbox_compAngleY2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_compAngleY2:407878:
  println("checkbox_compAngleY2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_compAngleY2:407878:

public void checkbox_tempRaw2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_tempRaw2:239821:
  println("checkbox_tempRaw2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_tempRaw2:239821:

public void checkbox_tempCal2_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox_tempCal2:953413:
  println("checkbox_tempCal2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:checkbox_tempCal2:953413:

public void textfield_sampleTime2_change(GTextField source, GEvent event) { //_CODE_:textfield_sampleTime2:506967:
  println("textfield_sampleTime2 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield_sampleTime2:506967:

synchronized public void win_animation_draw(GWinApplet appc, GWinData data) { //_CODE_:window_animation:552405:
  appc.background(0);
} //_CODE_:window_animation:552405:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("xMotionPlus - IMU Developed by PXL {V1.0}");
  imgButton_LogoPxl = new GImageButton(this, -1, 300, new String[] { "logo_pxl_tech_143x60.png", "logo_pxl_tech_143x60.png", "logo_pxl_tech_143x60.png" } );
  imgButton_LogoPxl.addEventHandler(this, "imgButton1_LogoPxl_click");
  label1 = new GLabel(this, 120, 370, 360, 20);
  label1.setText("Glenn Kerselaers & Devlin Voets");
  label1.setOpaque(false);
  imgButton_logoGithub = new GImageButton(this, 150, 300, 146, 60, new String[] { "logo_github_146x60.png", "logo_github_146x60.png", "logo_github_146x60.png" } );
  imgButton_logoGithub.addEventHandler(this, "imgButton_logoGithub_click");
  imgButton_logoImu = new GImageButton(this, 290, 300, 306, 60, new String[] { "logo_xmotionplus_306x60.png", "logo_xmotionplus_306x60.png", "logo_xmotionplus_306x60.png" } );
  imgButton_logoImu.addEventHandler(this, "imgButton_logoImu_click");
  textarea_console = new GTextArea(this, 330, 60, 248, 200, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE);
  textarea_console.setOpaque(true);
  textarea_console.addEventHandler(this, "textarea_console_change");
  label2 = new GLabel(this, 330, 40, 127, 20);
  label2.setText("Console window");
  label2.setTextBold();
  label2.setOpaque(false);
  button_start = new GButton(this, 325, 10, 80, 30);
  button_start.setText("Start");
  button_start.setTextBold();
  button_start.addEventHandler(this, "button_start_click");
  button_clearConsole = new GButton(this, 505, 10, 80, 30);
  button_clearConsole.setText("Clear");
  button_clearConsole.setTextBold();
  button_clearConsole.addEventHandler(this, "button_clearConsole_click");
  dropList_baud1 = new GDropList(this, 110, 155, 90, 66, 3);
  dropList_baud1.setItems(loadStrings("availableBaudRate"), 0);
  dropList_baud1.addEventHandler(this, "dropList_baud1_click");
  dropList_com1 = new GDropList(this, 10, 155, 90, 66, 3);
  dropList_com1.setItems(loadStrings("availableSerial"), 0);
  dropList_com1.addEventHandler(this, "dropList_com1_click");
  dropList_baud2 = new GDropList(this, 110, 205, 90, 63, 3);
  dropList_baud2.setItems(loadStrings("availableBaudRate"), 0);
  dropList_baud2.addEventHandler(this, "dropList_baud2_click");
  dropList_com2 = new GDropList(this, 10, 205, 90, 66, 3);
  dropList_com2.setItems(loadStrings("availableSerial"), 0);
  dropList_com2.addEventHandler(this, "dropList_com2_click1");
  label3 = new GLabel(this, 10, 185, 192, 20);
  label3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label3.setText("IMU-Module #2");
  label3.setTextBold();
  label3.setOpaque(false);
  label4 = new GLabel(this, 10, 135, 192, 20);
  label4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label4.setText("IMU-Module #1");
  label4.setTextBold();
  label4.setOpaque(false);
  button_connect1 = new GButton(this, 210, 150, 80, 30);
  button_connect1.setText("Connect");
  button_connect1.setTextBold();
  button_connect1.addEventHandler(this, "button_connect1_click");
  button_connect2 = new GButton(this, 210, 200, 80, 30);
  button_connect2.setText("Connect");
  button_connect2.setTextBold();
  button_connect2.addEventHandler(this, "button_connect2_click");
  button_findSerial = new GButton(this, 15, 10, 80, 30);
  button_findSerial.setText("Scan Serials");
  button_findSerial.setTextBold();
  button_findSerial.addEventHandler(this, "button_findSerial_click");
  togGroup1 = new GToggleGroup();
  button_openGraph = new GButton(this, 110, 10, 80, 30);
  button_openGraph.setText("Open Graph");
  button_openGraph.setTextBold();
  button_openGraph.addEventHandler(this, "button_openGraph_click");
  button_openAnimation = new GButton(this, 109, 49, 80, 30);
  button_openAnimation.setText("Open Animation");
  button_openAnimation.setTextBold();
  button_openAnimation.addEventHandler(this, "button_openAnimation_click");
  textfield_send = new GTextField(this, 330, 270, 160, 21, G4P.SCROLLBARS_NONE);
  textfield_send.setDefaultText("Type here your message");
  textfield_send.setOpaque(true);
  textfield_send.addEventHandler(this, "textfield_send_change");
  button_send = new GButton(this, 500, 265, 80, 30);
  button_send.setText("Send");
  button_send.setTextBold();
  button_send.addEventHandler(this, "button_send_click");
  dropList_whoSend = new GDropList(this, 230, 270, 90, 66, 3);
  dropList_whoSend.setItems(loadStrings("availableReceivers"), 0);
  dropList_whoSend.addEventHandler(this, "dropList_whoSend_click");
  window_graph = new GWindow(this, "Graph", 0, 0, 640, 500, false, JAVA2D);
  window_graph.setActionOnClose(G4P.CLOSE_WINDOW);
  window_graph.addDrawHandler(this, "win_graph_draw");
  checkbox_accX1 = new GCheckbox(window_graph.papplet, 420, 50, 100, 20);
  checkbox_accX1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_accX1.setText("AccX");
  checkbox_accX1.setOpaque(false);
  checkbox_accX1.addEventHandler(this, "checkbox_accX1_clicked");
  checkbox_accY1 = new GCheckbox(window_graph.papplet, 420, 70, 100, 20);
  checkbox_accY1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_accY1.setText("AccY");
  checkbox_accY1.setOpaque(false);
  checkbox_accY1.addEventHandler(this, "checkbox_accY1_clicked");
  checkbox_accZ1 = new GCheckbox(window_graph.papplet, 420, 90, 100, 20);
  checkbox_accZ1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_accZ1.setText("AccZ");
  checkbox_accZ1.setOpaque(false);
  checkbox_accZ1.addEventHandler(this, "checkbox_accZ1_clicked");
  checkbox_gyroX1 = new GCheckbox(window_graph.papplet, 420, 110, 100, 20);
  checkbox_gyroX1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gyroX1.setText("GyroX");
  checkbox_gyroX1.setOpaque(false);
  checkbox_gyroX1.addEventHandler(this, "checkbox_gyroX1_clicked");
  checkbox_gyroY1 = new GCheckbox(window_graph.papplet, 420, 130, 100, 20);
  checkbox_gyroY1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gyroY1.setText("GyroY");
  checkbox_gyroY1.setOpaque(false);
  checkbox_gyroY1.addEventHandler(this, "checkbox_gyroY1_clicked");
  checkbox_gyroZ1 = new GCheckbox(window_graph.papplet, 420, 150, 100, 20);
  checkbox_gyroZ1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gyroZ1.setText("GyroZ");
  checkbox_gyroZ1.setOpaque(false);
  checkbox_gyroZ1.addEventHandler(this, "checkbox_gyroZ1_clicked");
  checkbox_compAngleX1 = new GCheckbox(window_graph.papplet, 530, 50, 100, 20);
  checkbox_compAngleX1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_compAngleX1.setText("CompAngleX");
  checkbox_compAngleX1.setOpaque(false);
  checkbox_compAngleX1.addEventHandler(this, "checkbox_compAngleX1_clicked");
  checkbox_compAngleX1.setSelected(true);
  checkbox_compAngleY1 = new GCheckbox(window_graph.papplet, 530, 70, 100, 20);
  checkbox_compAngleY1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_compAngleY1.setText("CompAngleY");
  checkbox_compAngleY1.setOpaque(false);
  checkbox_compAngleY1.addEventHandler(this, "checkbox_compAngleY1_clicked");
  checkbox_compAngleY1.setSelected(true);
  checkbox_tempRaw1 = new GCheckbox(window_graph.papplet, 530, 90, 100, 20);
  checkbox_tempRaw1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_tempRaw1.setText("TempRaw");
  checkbox_tempRaw1.setOpaque(false);
  checkbox_tempRaw1.addEventHandler(this, "checkbox_tempRaw1_clicked");
  checkbox_tempCal1 = new GCheckbox(window_graph.papplet, 530, 110, 100, 20);
  checkbox_tempCal1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_tempCal1.setText("TempCal");
  checkbox_tempCal1.setOpaque(false);
  checkbox_tempCal1.addEventHandler(this, "checkbox_tempCal1_clicked");
  checkbox_tempCal1.setSelected(true);
  label5 = new GLabel(window_graph.papplet, 445, 20, 150, 20);
  label5.setText("Show IMU #1 Data");
  label5.setTextBold();
  label5.setOpaque(false);
  label6 = new GLabel(window_graph.papplet, 420, 180, 120, 20);
  label6.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label6.setText("Sample Time (ms)");
  label6.setOpaque(false);
  textfield_sampleTime1 = new GTextField(window_graph.papplet, 530, 180, 100, 20, G4P.SCROLLBARS_NONE);
  textfield_sampleTime1.setText("50");
  textfield_sampleTime1.setOpaque(true);
  textfield_sampleTime1.addEventHandler(this, "textfield_sampleTime1_change");
  label7 = new GLabel(window_graph.papplet, 445, 270, 150, 20);
  label7.setText("Show IMU #2 Data");
  label7.setTextBold();
  label7.setOpaque(false);
  checkbox_accX2 = new GCheckbox(window_graph.papplet, 420, 300, 100, 20);
  checkbox_accX2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_accX2.setText("AccX");
  checkbox_accX2.setOpaque(false);
  checkbox_accX2.addEventHandler(this, "checkbox_accX2_clicked");
  checkbox_accY2 = new GCheckbox(window_graph.papplet, 420, 320, 100, 20);
  checkbox_accY2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_accY2.setText("AccY");
  checkbox_accY2.setOpaque(false);
  checkbox_accY2.addEventHandler(this, "checkbox_accY2_clicked");
  checkbox_accZ2 = new GCheckbox(window_graph.papplet, 420, 340, 100, 20);
  checkbox_accZ2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_accZ2.setText("AccZ");
  checkbox_accZ2.setOpaque(false);
  checkbox_accZ2.addEventHandler(this, "checkbox_accZ2_clicked");
  checkbox_gyroX2 = new GCheckbox(window_graph.papplet, 420, 360, 100, 20);
  checkbox_gyroX2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gyroX2.setText("GyroX");
  checkbox_gyroX2.setOpaque(false);
  checkbox_gyroX2.addEventHandler(this, "checkbox_gyroX2_clicked");
  checkbox_gyroY2 = new GCheckbox(window_graph.papplet, 420, 380, 100, 20);
  checkbox_gyroY2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gyroY2.setText("GyroY");
  checkbox_gyroY2.setOpaque(false);
  checkbox_gyroY2.addEventHandler(this, "checkbox_gyroY2_clicked");
  checkbox_gyroZ2 = new GCheckbox(window_graph.papplet, 420, 400, 100, 20);
  checkbox_gyroZ2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gyroZ2.setText("GyroZ2");
  checkbox_gyroZ2.setOpaque(false);
  checkbox_gyroZ2.addEventHandler(this, "checkbox_gyroZ2_clicked");
  checkbox_compAngleX2 = new GCheckbox(window_graph.papplet, 530, 300, 100, 20);
  checkbox_compAngleX2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_compAngleX2.setText("CompAngleX");
  checkbox_compAngleX2.setOpaque(false);
  checkbox_compAngleX2.addEventHandler(this, "checkbox_compAngleX2_clicked");
  checkbox_compAngleX2.setSelected(true);
  checkbox_compAngleY2 = new GCheckbox(window_graph.papplet, 530, 320, 100, 20);
  checkbox_compAngleY2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_compAngleY2.setText("CompAngleY");
  checkbox_compAngleY2.setOpaque(false);
  checkbox_compAngleY2.addEventHandler(this, "checkbox_compAngleY2_clicked");
  checkbox_compAngleY2.setSelected(true);
  checkbox_tempRaw2 = new GCheckbox(window_graph.papplet, 530, 340, 100, 20);
  checkbox_tempRaw2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_tempRaw2.setText("TempRaw");
  checkbox_tempRaw2.setOpaque(false);
  checkbox_tempRaw2.addEventHandler(this, "checkbox_tempRaw2_clicked");
  checkbox_tempCal2 = new GCheckbox(window_graph.papplet, 530, 360, 100, 20);
  checkbox_tempCal2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_tempCal2.setText("TempCal");
  checkbox_tempCal2.setOpaque(false);
  checkbox_tempCal2.addEventHandler(this, "checkbox_tempCal2_clicked");
  checkbox_tempCal2.setSelected(true);
  label8 = new GLabel(window_graph.papplet, 420, 430, 120, 20);
  label8.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label8.setText("Sample Time (ms)");
  label8.setOpaque(false);
  textfield_sampleTime2 = new GTextField(window_graph.papplet, 530, 430, 100, 20, G4P.SCROLLBARS_NONE);
  textfield_sampleTime2.setText("50");
  textfield_sampleTime2.setOpaque(true);
  textfield_sampleTime2.addEventHandler(this, "textfield_sampleTime2_change");
  window_animation = new GWindow(this, "Animation", 0, 0, 640, 360, false, JAVA2D);
  window_animation.setActionOnClose(G4P.CLOSE_WINDOW);
  window_animation.addDrawHandler(this, "win_animation_draw");
  sketchPad_animation = new GSketchPad(window_animation.papplet, 0, 0, 640, 360);
  sketchPad_animation.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GImageButton imgButton_LogoPxl; 
GLabel label1; 
GImageButton imgButton_logoGithub; 
GImageButton imgButton_logoImu; 
GTextArea textarea_console; 
GLabel label2; 
GButton button_start; 
GButton button_clearConsole; 
GDropList dropList_baud1; 
GDropList dropList_com1; 
GDropList dropList_baud2; 
GDropList dropList_com2; 
GLabel label3; 
GLabel label4; 
GButton button_connect1; 
GButton button_connect2; 
GButton button_findSerial; 
GToggleGroup togGroup1; 
GButton button_openGraph; 
GButton button_openAnimation; 
GTextField textfield_send; 
GButton button_send; 
GDropList dropList_whoSend; 
GWindow window_graph;
GCheckbox checkbox_accX1; 
GCheckbox checkbox_accY1; 
GCheckbox checkbox_accZ1; 
GCheckbox checkbox_gyroX1; 
GCheckbox checkbox_gyroY1; 
GCheckbox checkbox_gyroZ1; 
GCheckbox checkbox_compAngleX1; 
GCheckbox checkbox_compAngleY1; 
GCheckbox checkbox_tempRaw1; 
GCheckbox checkbox_tempCal1; 
GLabel label5; 
GLabel label6; 
GTextField textfield_sampleTime1; 
GLabel label7; 
GCheckbox checkbox_accX2; 
GCheckbox checkbox_accY2; 
GCheckbox checkbox_accZ2; 
GCheckbox checkbox_gyroX2; 
GCheckbox checkbox_gyroY2; 
GCheckbox checkbox_gyroZ2; 
GCheckbox checkbox_compAngleX2; 
GCheckbox checkbox_compAngleY2; 
GCheckbox checkbox_tempRaw2; 
GCheckbox checkbox_tempCal2; 
GLabel label8; 
GTextField textfield_sampleTime2; 
GWindow window_animation;
GSketchPad sketchPad_animation; 

