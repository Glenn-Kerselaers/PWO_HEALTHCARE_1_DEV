class IMU {
  Value value;
  Communication com;
  Graph graph;

  // the constructor
  IMU() {
    com = new Communication();
    value = new Value();
    graph = new Graph();
  }
}

class Value {
  int accX, accY, accZ, gyroX, gyroY, gyroZ, tempRaw, tempCal, compAngleX, compAngleY;
}

class Communication {
  String sPort;
  Serial port;
  int baudRate;
  int serialCount = 0;                 // A count of how many bytes we receive
  boolean serialConnected = false;

  // the constructor
  Communication() {
  }
}

class Graph {
  Points points;

  Graph() {
    points = new Points();
  }
}

class Points {
  public GPointsArray accX;
  public GPointsArray accY; 
  public GPointsArray accZ;
  public GPointsArray gyroX;
  public GPointsArray gyroY;
  public GPointsArray gyroZ;
  public GPointsArray compAngleX;
  public GPointsArray compAngleY;
  public GPointsArray tempRaw;
  public GPointsArray tempCal;

  Points() {
    accX        = new GPointsArray();
    accY        = new GPointsArray(); 
    accZ        = new GPointsArray();
    gyroX       = new GPointsArray();
    gyroY       = new GPointsArray();
    gyroZ       = new GPointsArray();
    compAngleX  = new GPointsArray();
    compAngleY  = new GPointsArray();
    tempRaw     = new GPointsArray();
    tempCal     = new GPointsArray();
  }
}
