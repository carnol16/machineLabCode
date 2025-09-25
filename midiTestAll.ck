@import "/../midiInstrumentClass.ck";
@import "/../bpmSetClass.ck";
@import "/../globalOSCSendClass.ck";

midiInstrumentSends midiSend;

120 => int tempo;

<<<bpmTime.bpm(tempo)>>>;

float durArray[0];
bpmTime.bpm(tempo)::ms => dur beat;

//notes for marimba
[45, 47, 48, 50, 52, 53, 54, 55, 57, 59, 
60, 62, 64, 65, 66, 67, 69, 71, 72, 74, 
76, 77, 78, 79, 81, 83, 84, 86, 88, 89, 
90, 91, 93, 95, 96] @=> int mScl[];

//notes for galapati drums
[1, 2, 3, 6, 7, 8] = > int drumArray[];

fun breakBot(){
    midiSend.init(1);
    for(int i; i < 10; i++){
        midiSend.messageSend(Math.random2(0,1), 127, 0);
        beat => now; 
    } 
}

fun galaPati(){
    midiSend.init(0);
    for(int i; i < 10; i++){
        for(int j; j < 6; j++){
            midiSend.messageSend(drumArray[j], 127, 0);
            beat => now;
        } 
    } 
}

fun tammyMyLove(){
    midiSend.init(3);
}

fun rattleTron(){
    midiSend.init(3);
}



while(true){
    spork ~ breakBot();
    spork ~ galaPati();
    spork~ tammyMyLove();
    spork~ rattleTron();

}
