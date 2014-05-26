import g4p_controls.*;
import processing.serial.*;
import grafica.*;
import java.util.Random;

IMU myIMU1;                  // 2 IMU-objects for 2 IMU-modules
IMU myIMU2;
DisposeHandler dh;

int linefeed = 10;          // Serial will buffer till this value is received
int value[];                // array to store datapackets temporary

boolean setupDone = false;  // variable to flag setup is done
boolean startCom  = false;

float startTime_Graph;

String timeStamp;  //stamp which is given to each console message

void setup()
{
  //  Take care of the GUI
  size(600, 400);  // size of the main window
  createGUI();     // create auto-generated gui
  customGUI();     // create custom gui

  //  Create IMU objects
  myIMU1 = new IMU();
  myIMU2 = new IMU();

  // initialise content for extra screens
  initAnimation();
  initGraph();

  dh = new DisposeHandler(this);

  setupDone = true;    // this is needed to avoid java warnings, else objects are initialised without pre-initialising of fundamental components
}

void draw() {
  timeStamp = "[" + hour() + ":" + minute() + ":" + second() + "] ";

  background(160, 150, 150);  // background of the main window, no background results into ghosting of gui-objects
  // time = millis();

  if (startCom == true) {
    printValues();
  }
  drawAnimation();
}

public class DisposeHandler {
  DisposeHandler(PApplet pa) {
    pa.registerDispose(this);
  }
  public void dispose() {
    String s[] = split(textarea_console.getText(), "\n");
    String _day = str(day());
    String _month = str(month());
    String _year = str(year());
    String _hour = str(hour());
    String _minute = str(minute());
    String _second = str(second());

    _year = str(int(_year) % 1000); //ugly solution to format year

    if (int(_day) < 10) {
      _day = "0" + _day;
    }
    if (int(_month) < 10) {
      _month = "0" + _month;
    }
    if (int(_hour) < 10) {
      _hour = "0" + _hour;
    }
    if (int(_minute) < 10) {
      _minute = "0" + _minute;
    }
    if (int(_second) < 10) {
      _second = "0" + _second;
    }

    String fileName = "log_" + _day + _month + _year + "_" + _hour + _minute + _second;
    saveStrings("data/logs/" + fileName + ".txt", s);
  }
}

void stop() {
  String s[] = split(textarea_console.getText(), "\n");
  String _day = str(day());
  String _month = str(month());
  String _year = str(year());
  String _hour = str(hour());
  String _minute = str(minute());
  String _second = str(second());

  _year = str(int(_year) % 1000); //ugly solution to format year

  if (int(_day) < 10) {
    _day = "0" + _day;
  }
  if (int(_month) < 10) {
    _month = "0" + _month;
  }
  if (int(_hour) < 10) {
    _hour = "0" + _hour;
  }
  if (int(_minute) < 10) {
    _minute = "0" + _minute;
  }
  if (int(_second) < 10) {
    _second = "0" + _second;
  }

  String fileName = "log_" + _day + _month + _year + "_" + _hour + _minute + _second;
  saveStrings("data/logs/" + fileName + ".txt", s);
}

void sendMessage() {
  String sInput = textfield_send.getText();
  String receiver = dropList_whoSend.getSelectedText();

  textarea_console.appendText(timeStamp + "Send <" + receiver + ">: " + sInput);

  if (dropList_whoSend.getSelectedIndex() == 0) {
    if (myIMU1.com.serialConnected == true) {
      myIMU1.com.port.write(sInput);
    }
    else {
      textarea_console.appendText(timeStamp + "[ERROR] Receiver is not connected.");
    }
  }
  else if (dropList_whoSend.getSelectedIndex() == 1) {
    if (myIMU2.com.serialConnected == true) {
      myIMU2.com.port.write(sInput);
    }
    else {
      textarea_console.appendText(timeStamp + "[ERROR] Receiver is not connected.");
    }
  }
  else if (dropList_whoSend.getSelectedIndex() == 2) {
    if ((myIMU1.com.serialConnected == true) && (myIMU2.com.serialConnected == true)) {
      myIMU1.com.port.write(sInput);
      myIMU2.com.port.write(sInput);
    }
    else {
      textarea_console.appendText(timeStamp + "[ERROR] One of the receivers is not connected.");
    }
  }
  textarea_console.appendText(" ");
  textfield_send.setText("");
}

void connectIMU(IMU thisIMU) {
  int whichIMU = 0;
  String port = "99";
  int baudRate = 0;

  if (thisIMU == myIMU1) { 
    whichIMU = 1;
    port = dropList_com1.getSelectedText();
    baudRate = int(dropList_baud1.getSelectedText());
  }
  else if (thisIMU == myIMU2) { 
    whichIMU = 2;
    port = dropList_com2.getSelectedText();
    baudRate = int(dropList_baud2.getSelectedText());
  }    
  if (thisIMU.com.serialConnected == false) {
    if ((port.equals(myIMU1.com.sPort) == false) && (port.equals(myIMU2.com.sPort) == false)) {

      thisIMU.com.serialConnected = true;
      thisIMU.com.sPort = port;
      thisIMU.com.baudRate = baudRate;
      thisIMU.com.port = new Serial(this, port, thisIMU.com.baudRate);

      // read bytes into a buffetr until you get a linefeed (ASCII 10):
      thisIMU.com.port.bufferUntil(linefeed);

      // GUI configure objects
      if (whichIMU == 1) {
        dropList_com1.setEnabled(false);
        dropList_baud1.setEnabled(false);
        button_connect1.setText("Disconnect");
        button_connect1.setTextBold();
      }
      else if (whichIMU == 2) {
        dropList_com2.setEnabled(false);
        dropList_baud2.setEnabled(false);
        button_connect2.setText("Disconnect");
        button_connect2.setTextBold();
      }

      // debug text
      textarea_console.appendText(timeStamp + "Connecting IMU #" + whichIMU + ".");
      textarea_console.appendText("IMU #" + whichIMU + " connected.");
      textarea_console.appendText("    Port: " + port + "  BaudRate: " + thisIMU.com.baudRate);
    }
    else {
      textarea_console.appendText(timeStamp + "[ERROR]: Port is already occupied.");
    }
  }
  else {
    thisIMU.com.serialConnected = false;
    if (whichIMU == 1) {
      dropList_com1.setEnabled(true);
      dropList_baud1.setEnabled(true);
      button_connect1.setText("Connect");
      button_connect1.setTextBold();
    }
    else if (whichIMU == 2) {
      dropList_com2.setEnabled(true);
      dropList_baud2.setEnabled(true);
      button_connect2.setText("Connect");
      button_connect2.setTextBold();
    }

    thisIMU.com.port.stop();
    thisIMU.com.sPort = "";
    textarea_console.appendText(timeStamp + "Disconnecting IMU #" + whichIMU + ".");
  }
  textarea_console.appendText(" ");
}

void startCommunication() {
  String s = button_start.getText();
  if (s.equals("Start")) {
    startCom = true;
    button_start.setText("Stop");
    textarea_console.appendText(timeStamp + "Communication Started.");
    if (myIMU1.com.serialConnected == true) {
      myIMU1.com.port.write("A");
    }
    if (myIMU2.com.serialConnected == true) {
      myIMU2.com.port.write("A");
    }
  }
  else {
    startCom = false;
    button_start.setText("Start");
    textarea_console.appendText(timeStamp + "Communication Stopped.");
  }
  button_start.setTextBold();
  textarea_console.appendText(" ");
}

void findSerials() {
  String SerialList[] = Serial.list();
  String s;

  s = join(SerialList, "\n");

  saveStrings("data/availableSerial", SerialList);

  // GUI configure objects
  dropList_com1.setItems(loadStrings("data/availableSerial"), 0);
  dropList_com2.setItems(loadStrings("data/availableSerial"), 0);

  // debug text
  textarea_console.appendText(timeStamp + "Scanning Serial Ports.");
  textarea_console.appendText("Available Serial Ports:");
  if (s.equals("")) {
    textarea_console.appendText("No Serial Ports available. Check hardware and re-scan.");
  }
  else {
    textarea_console.appendText(s);
    button_connect1.setEnabled(true);
    button_connect2.setEnabled(true);
  }
  textarea_console.appendText(" ");
}



void printValues() {
  IMU thisIMU;
  thisIMU = new IMU();

  // debug text
  for (int i = 0; i < 2 ; i++) {
    if (i == 0) {
      thisIMU = myIMU1;
    }
    if (i == 1) {
      thisIMU = myIMU2;
    }
    textarea_console.appendText(timeStamp + "Reading of IMU#" + (i+1) + ":");
    textarea_console.appendText("Raw acc: "     + str(thisIMU.value.accX)       + ("  ") + str(thisIMU.value.accY)  + ("  ") + str(thisIMU.value.accZ));
    textarea_console.appendText("Raw gyro: "    + str(thisIMU.value.gyroX)      + ("  ") + str(thisIMU.value.gyroY) + ("  ") + str(thisIMU.value.gyroZ));
    textarea_console.appendText("Comp angle: "  + str(thisIMU.value.compAngleX) + ("  ") + str(thisIMU.value.compAngleY));
    textarea_console.appendText("Temperature: " + str(thisIMU.value.tempRaw)    + ("  ") + str(thisIMU.value.tempCal));
    textarea_console.appendText(" ");
  }
}

void customGUI() {
  // GUI configure objects
  window_graph.setVisible(false);
  window_animation.setVisible(false);

  String sEmpty[] = {
    "Scan First"
  };
  saveStrings("data/availableSerial", sEmpty);

  dropList_com1.setItems(loadStrings("data/availableSerial"), 0);
  dropList_com2.setItems(loadStrings("data/availableSerial"), 0);
  dropList_baud1.setItems(loadStrings("data/availableBaudRate"), 4);
  dropList_baud2.setItems(loadStrings("data/availableBaudRate"), 4);
  textarea_console.setEnabled(false);
  button_start.setText("Start");
  button_start.setTextBold();
  button_connect1.setText("Connect");
  button_connect1.setTextBold();
  button_connect1.setEnabled(false);
  button_connect2.setText("Connect");
  button_connect2.setTextBold();
  button_connect2.setEnabled(false);

  // debug text
  textarea_console.setText("##############################");
  textarea_console.appendText("GUI for xMotionPlus");
  textarea_console.appendText("IMU developed by PXL");
  textarea_console.appendText("Version 1.0, May 2014");
  textarea_console.appendText("");
  textarea_console.appendText("Glenn Kerselaers & Devlin Voets");
  textarea_console.appendText("##############################");
  textarea_console.appendText(" ");
}

void serialEvent(Serial thisPort) {
  IMU thisIMU;
  thisIMU = new IMU();

  int portNumber = 0;
  // check which port caused the serial event
  if (thisPort == myIMU1.com.port) {
    thisIMU = myIMU1;
  }
  else if (thisPort == myIMU2.com.port) {
    thisIMU = myIMU2;
  }

  // read a byte from the port:
  int inByte = thisPort.read();

  // read the serial buffer:
  String myString = thisIMU.com.port.readStringUntil(linefeed);

  // if you got any bytes other than the linefeed:
  if (myString != null) {
    myString = trim(myString);
    // split the string at the commas
    // and convert the sections into integers:
    value = int(split(myString, ','));

    thisIMU.value.accX       = value[0];
    thisIMU.value.accY       = value[1];
    thisIMU.value.accZ       = value[2];
    thisIMU.value.gyroX      = value[3];
    thisIMU.value.gyroY      = value[4];
    thisIMU.value.gyroZ      = value[5];
    thisIMU.value.tempRaw    = value[6];
    thisIMU.value.compAngleX = value[7];
    thisIMU.value.compAngleY = value[8];
    thisIMU.value.tempCal    = value[9];
  }
}

