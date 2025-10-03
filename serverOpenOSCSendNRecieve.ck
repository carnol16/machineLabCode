@import "../machineLabCode/globalOSCSendClass.ck";
@import "../machineLabCode/globalOSCReceiveClass.ck";

OscIn in;

oscReceive receive;
oscSends send;



[8000, 8001, 8002, 8003, 8004, 8005, 8006, 8007, 8008, 8009] => int clientRecievePorts[];

for(0 => int i, i < clientRecievePorts.size(); i++){
    recieve.init(clientRecievePorts[i])
}

while(true){

    
    in => now;

    receive.recieve();

    recieve.instrument @=> string instrument;
    recieve.note @=> int note;
    receive.vel @=> int vel;

    send(instrument, note, vel);

}






    


