// import libraries for I2C, Serial communication and data processing
#include <Kalman.h>
#include <Wire.h> 

const int motorPin = 9;

// Create the Kalman instances:
Kalman kalmanX; 
Kalman kalmanY;

// IMU Raw Data:
int16_t accX, accY, accZ;
int16_t gyroX, gyroY, gyroZ;
int16_t tempRaw;

// Serial Incoming Data
int inByte = 0;         // incoming serial byte

// Calculated Data
double accXangle, accYangle; // Angle calculate using the accelerometer
double gyroXangle, gyroYangle; // Angle calculate using the gyro
double temp; // Temperature
double compAngleX, compAngleY; // Calculate the angle using a complementary filter

// Global Variables
uint32_t timer;
uint8_t i2cData[14]; // Buffer for I2C data

void setup()
{
  pinMode(motorPin, OUTPUT);
  digitalWrite(motorPin, LOW);
  Serial.begin(9600);  // Begin the serial monitor at 9600bps

  Wire.begin();
  MPU6050_Init();
  // wait for processing to establish contact
  establishContact();
}

void loop()
{
  // fetch IMU values and store them
  MPU6050_Update();
  // if we get a valid byte, send all data trough Serial
  if (Serial.available() > 0) { 
    SendData();
    int c = Serial.read();
    if(c == 12345){
      digitalWrite(motorPin, HIGH);
    }
    else if(c == 54321){
      digitalWrite(motorPin, LOW);
    }      
  }
}

void SendData()
{
  for(int i = 0; i < 10; i++){
    Serial.print(accX, DEC);
    Serial.print(",");
    Serial.print(accY, DEC);
    Serial.print(",");
    Serial.print(accZ, DEC);
    Serial.print(",");
    Serial.print(gyroX, DEC);
    Serial.print(",");
    Serial.print(gyroY, DEC);
    Serial.print(",");
    Serial.print(gyroZ, DEC);
    Serial.print(",");
    Serial.print(tempRaw, DEC);
    Serial.print(",");
    Serial.print(compAngleX, DEC);
    Serial.print(",");
    Serial.print(compAngleY, DEC);
    Serial.print(",");
    Serial.println(temp, DEC); 
    // VERY IMPORTANT after data transfer,
    // send a new line.
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.write('A');   // send a capital A till processing responds
    delay(300);
  }
}

void MPU6050_Update()
{
  // Receive fresh data:
  while (i2cRead(0x3B, i2cData, 14));
  accX = ((i2cData[0] << 8) | i2cData[1]);
  accY = ((i2cData[2] << 8) | i2cData[3]);
  accZ = ((i2cData[4] << 8) | i2cData[5]);
  tempRaw = ((i2cData[6] << 8) | i2cData[7]);
  gyroX = ((i2cData[8] << 8) | i2cData[9]);
  gyroY = ((i2cData[10] << 8) | i2cData[11]);
  gyroZ = ((i2cData[12] << 8) | i2cData[13]);

  // atan2 outputs the value of -π to π (radians) - see http://en.wikipedia.org/wiki/Atan2
  // We then convert it to 0 to 2π and then from radians to degrees
  accXangle = (atan2(accY, accZ) + PI) * RAD_TO_DEG;
  accYangle = (atan2(accX, accZ) + PI) * RAD_TO_DEG;

  double gyroXrate = (double)gyroX / 131.0;
  double gyroYrate = -((double)gyroY / 131.0);
  gyroXangle += gyroXrate * ((double)(micros() - timer) / 1000000); // Calculate gyro angle without any filter
  gyroYangle += gyroYrate * ((double)(micros() - timer) / 1000000);
  //gyroXangle += kalmanX.getRate()*((double)(micros()-timer)/1000000); // Calculate gyro angle using the unbiased rate
  //gyroYangle += kalmanY.getRate()*((double)(micros()-timer)/1000000);

  compAngleX = (0.93 * (compAngleX + (gyroXrate * (double)(micros() - timer) / 1000000))) + (0.07 * accXangle); // Calculate the angle using a Complimentary filter
  compAngleY = (0.93 * (compAngleY + (gyroYrate * (double)(micros() - timer) / 1000000))) + (0.07 * accYangle);
  timer = micros();

  temp = ((double)tempRaw + 12412.0) / 340.0;
}

void MPU6050_Init()
{
  TWBR = ((F_CPU / 400000L) - 16) / 2; // Set I2C frequency to 400kHz

  i2cData[0] = 7; // Set the sample rate to 1000Hz - 8kHz/(7+1) = 1000Hz
  i2cData[1] = 0x00; // Disable FSYNC and set 260 Hz Acc filtering, 256 Hz Gyro filtering, 8 KHz sampling
  i2cData[2] = 0x00; // Set Gyro Full Scale Range to ±250deg/s
  i2cData[3] = 0x00; // Set Accelerometer Full Scale Range to ±2g
  while (i2cWrite(0x19, i2cData, 4, false)); // Write to all four registers at once
  while (i2cWrite(0x6B, 0x01, true)); // PLL with X axis gyroscope reference and disable sleep mode

    while (i2cRead(0x75, i2cData, 1));
  if (i2cData[0] != 0x68) { // Read "WHO_AM_I" register
    //Serial.print(F("Error reading sensor"));
    while (1);
  }

  delay(100); // Wait for sensor to stabilize

  /* Set kalman and gyro starting angle */
  while (i2cRead(0x3B, i2cData, 6));
  accX = ((i2cData[0] << 8) | i2cData[1]);
  accY = ((i2cData[2] << 8) | i2cData[3]);
  accZ = ((i2cData[4] << 8) | i2cData[5]);
  // atan2 outputs the value of -π to π (radians) - see http://en.wikipedia.org/wiki/Atan2
  // We then convert it to 0 to 2π and then from radians to degrees
  accYangle = (atan2(accX, accZ) + PI) * RAD_TO_DEG;
  accXangle = (atan2(accY, accZ) + PI) * RAD_TO_DEG;

  gyroXangle = accXangle;
  gyroYangle = accYangle;
  compAngleX = accXangle;
  compAngleY = accYangle;

  timer = micros();
}


