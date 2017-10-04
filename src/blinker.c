#include <stdio.h>    // Used for printf() statements
#include <wiringPi.h> // Include WiringPi library!

// Pin number declarations. We're using the Broadcom chip pin numbers.
const int ledPin = 23; // Regular LED - Broadcom pin 23, P1 pin 16
const int pirPin = 17; // Active-high PIR - Broadcom pin 17, P1 pin 11

int main(void)
{
    // Setup stuff:
    wiringPiSetupGpio(); // Initialize wiringPi -- using Broadcom pin numbers

    pinMode(ledPin, OUTPUT);     // Set regular LED as output
    pinMode(pirPin, INPUT);      // Set PIR as INPUT
//    pullUpDnControl(pirPin, PUD_UP); // Enable pull-up resistor on button

    printf("Detector is running! Press CTRL+C to quit.\n");

    // Loop (while(1)):
    while(1)
    {
        if (!digitalRead(pirPin)) // PIR is not active
        {
            digitalWrite(ledPin, LOW);     // Regular LED off
        }
        else // PIR is active
        {
            digitalWrite(ledPin, HIGH); // Turn LED ON
        }
        delay(250);
    }

    return 0;
}
