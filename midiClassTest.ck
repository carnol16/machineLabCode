@import "/Users/mtiid/git/robots/machineLabCode/midiInstrumentClass.ck"

midiInstrumentSends midiSend;

midiSend.init(1);
midiSend.messageSend(1, 127, 0);

