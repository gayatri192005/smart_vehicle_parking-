# Automatic Vehicle Parking System
## Introduction
This system automates vehicle parking by using an ultrasonic sensor to detect the distance of a vehicle from the gate. The servo motor acts as a gate, opening automatically when a vehicle is detected within a specific range. Additionally, an LED and buzzer are used to signal when the vehicle gets too close to an obstacle, assisting drivers in parking safely.

## Components
- Arduino UNO (or compatible board)
- Ultrasonic Sensor (HC-SR04) - measures distance from the vehicle
- Servo Motor - opens/closes the gate
- LED - indicates parking status
- Buzzer - sounds an alert if the vehicle is too close
- Jumper Wires
- Breadboard (optional, for connecting components)

## Circuit Diagram
### Connections
1. Ultrasonic Sensor (HC-SR04)
VCC to 5V on Arduino
GND to GND
Trig to Pin 9 on Arduino
Echo to Pin 10 on Arduino

2.Servo Motor
Signal to Pin 11 on Arduino
VCC to 5V on Arduino
GND to GND

3. Buzzer and LED
Buzzer positive lead to Pin 12, negative to GND
LED positive lead to Pin 13, negative to GND (through a resistor) 
  
