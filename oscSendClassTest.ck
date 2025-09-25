@import "../machineLabCode/globalOSCSendClass.ck";

oscSends osc;
osc.init("localhost", 7000, 7001);
osc.send("/meow", 50, 127);