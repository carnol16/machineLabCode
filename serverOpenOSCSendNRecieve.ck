@import "../machineLabCode/globalOSCSendClass.ck";
@import "../machineLabCode/globalOSCReceiveClass.ck";

OscIn in;

oscReceive receive;
oscSends send;



[8000, 8001, 8002, 8003, 8004, 8005, 8006, 8007, 8008, 8009] @=> int clientRecievePorts[];

for(0 => int i; i < clientRecievePorts.size(); i++){
    receive.init(clientRecievePorts[i]);
}

while(true){

    
    in => now;

    receive.receive();

    receive.instrument @=> string instrument;
    receive.note @=> int note;
    receive.vel @=> int vel;

    send.send(instrument, note, vel);

}






    


