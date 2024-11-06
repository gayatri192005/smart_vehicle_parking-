#include <Servo.h>

// Define the pins for the ultrasonic sensor
const int trigPin = 9;
const int echoPin = 10;

// Define the servo motor
Servo gateServo;
const int servoPin = 11;

// Define LED and Buzzer
const int ledPin = 13;
const int buzzerPin = 12;

// Variables to store distance measurements
long duration;
int distance;

// Threshold distances (in centimeters)
const int openGateDistance = 20;   // Distance to open gate
const int safeDistance = 10;       // Safe distance to avoid collision

void setup() {
  // Initialize serial monitor
  Serial.begin(9600);
  
  // Set up pins
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(buzzerPin, OUTPUT);

  // Attach servo
  gateServo.attach(servoPin);
  gateServo.write(0); // Set initial position of gate (closed)
}

void loop() {
  // Measure distance
  distance = getDistance();
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  // Check if vehicle is within range to open the gate
  if (distance > 0 && distance <= openGateDistance) {
    openGate();
  } else {
    closeGate();
  }

  // Check if vehicle is too close (alert condition)
  if (distance > 0 && distance <= safeDistance) {
    digitalWrite(ledPin, HIGH);
    digitalWrite(buzzerPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
    digitalWrite(buzzerPin, LOW);
  }

  delay(200); // Delay to avoid rapid triggering
}

// Function to measure distance using the ultrasonic sensor
int getDistance() {
  // Send a 10us pulse to the trigger pin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Read the echo pin
  duration = pulseIn(echoPin, HIGH);

  // Calculate the distance (in cm)
  int distance = duration * 0.034 / 2;
  return distance;
}

// Function to open the gate
void openGate() {
  gateServo.write(90); // Open gate to 90 degrees
  Serial.println("Gate opened.");
}

// Function to close the gate
void closeGate() {
  gateServo.write(0); // Close gate to 0 degrees
  Serial.println("Gate closed.");
}
