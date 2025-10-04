@import "../OSC/globalOSCReceiveClass.ck";
@import "../OSC/globalOSCSendClass.ck";
@import "../midi/midiInstrumentClass.ck"


oscReceive receive;
oscSends send;
midiInstrumentSends midiSend;

string instrument;
int note;
int vel;
string values[3];



// [8000, 8001, 8002, 8003, 8004, 8005, 8006, 8007, 8008, 8009] @=> int clientRecievePorts[];

// for(0 => int i; i < clientRecievePorts.size(); i++){
//     receive.init(clientRecievePorts[i]);
//     <<<"port ", clientRecievePorts[i], " open">>>;
// }

receive.init(8000);

midiSend.init(1); // breakBot
//midiSend.init(4); // rattleTron
//midiSend.init(3); // tammy
midiSend.init(0); // ganaPati


while(true){
    <<<values, "AHHHHHH">>>;

    receive.receive() @=> values;

    for(0 => int i; i < values.size(); i++){
        <<<values[i]>>>;
    }

    values[0] => instrument;
    values[1] => string noteString;
    values[2] => string velString;

    Std.atoi(noteString) => note;
    Std.atoi(velString) => vel;

    // midiSend.init(0);
    // midiSend.messageSend(note, vel, 100);

    
    <<<("instrument:", instrument, "note: ", note, "vel: ", vel)>>>;

    if(instrument == "/breakBot"){

        midiSend.messageSend(note, vel, 0);

    }

    if(instrument == "/ganaPati"){

        midiSend.init(0);
        midiSend.messageSend(note, vel, 0);

    }
    
    if(instrument == "/tammy"){

        midiSend.init(3);
        midiSend.messageSend(note, vel, 0);

    }

    if(instrument == "/rattleTron"){

        midiSend.messageSend(note, vel, 0);

    }    

    if(instrument == "/marimba"){

        send.send(instrument, note, vel);

    }    

    if(instrument == "/trimpbeat"){

        send.send(instrument, note, vel);

    }
}






    


