//change file path to local path on Machine Lab device
//not letting us use the relative path?
@import "../MachineLabCode/globalOSCReceiveClass.ck";

oscReceive oscReceive;

oscReceive.init("localhost", 8000, 7001);
while(true){
    oscReceive.receive("/thunderMcQueen");
}

