// PROGRAMMED FOR USE WITH TEENSY 4.1
// SHOULD BE FLASHED AS USB TYPE: MIDI


//L293D 1 control pins
#define M1A1 0  //M1A-   :   C-2   :   0
#define M1A2 1  //M1A+   :   C#-2  :   1
#define M1B1 2  //M1B-   :   D-2   :   2
#define M1B2 3  //M1B+   :   D#-2  :   3

//L293D 2 control pins
#define M2A1 4  //M2A-   :   E-2   :   4
#define M2A2 5  //M2A+    :   F-2   :   5
#define M2B1 6  //M2B-   :   F#-2  :   6
#define M2B2 7  //M2B+   :   G-2   :   7

//L293D 3 control pins
#define M3A1 8   //M3A-   :   G#-2  :   8
#define M3A2 9   //M3A+   :   A-2   :   9
#define M3B1 10  //M3B-  :   A#-2  :   10
#define M3B2 11  //M3B+  :   B-2   :   11

//L293D 4 control pins
#define M4A1 12  //M4A-  :   C-1   :   12
#define M4A2 14  //M4A+  :   C#-1  :   13
#define M4B1 15  //M4B-  :   D-1   :   14
#define M4B2 22  //M4B+  :   D#-1  :   15

//E-1 thru B-1 (16-23) not mapped, mapping repeats at C0, C2, C4, etc...

#define MOTOR_EN 23

const uint8_t motor_pin[16] = { M1A1, M1A2, M1B1, M1B2, M2A1, M2A2, M2B1, M2B2, M3A1, M3A2, M3B1, M3B2, M4A1, M4A2, M4B1, M4B2 };


void setup() {
  pinMode(motor_pin[0], OUTPUT);
  pinMode(motor_pin[1], OUTPUT);
  pinMode(motor_pin[2], OUTPUT);
  pinMode(motor_pin[3], OUTPUT);
  pinMode(motor_pin[4], OUTPUT);
  pinMode(motor_pin[5], OUTPUT);
  pinMode(motor_pin[6], OUTPUT);
  pinMode(motor_pin[7], OUTPUT);
  pinMode(motor_pin[8], OUTPUT);
  pinMode(motor_pin[9], OUTPUT);
  pinMode(motor_pin[10], OUTPUT);
  pinMode(motor_pin[11], OUTPUT);
  pinMode(motor_pin[12], OUTPUT);
  pinMode(motor_pin[13], OUTPUT);
  pinMode(motor_pin[14], OUTPUT);
  pinMode(motor_pin[15], OUTPUT);

  usbMIDI.setHandleNoteOff(OnNoteOff);
  usbMIDI.setHandleNoteOn(OnNoteOn) ;

}

void OnNoteOn(byte channel, byte note, byte velocity) {
  digitalWrite(motor_pin[note], HIGH); //sends note value to solenoid pin
  delay(map(velocity, 0, 127, 1, 15)); //velocity sets delay value
  digitalWrite(motor_pin[note], LOW); //write solenoid value to low

  Serial.print("Note:");
  Serial.print(note);
  Serial.print(" Velocity: ");
  Serial.print(velocity);
  Serial.println();
  Serial.println();
}

void OnNoteOff(byte channel, byte note, byte velocity) {

}

void loop() {

    usbMIDI.read();

    delay(10);
}
