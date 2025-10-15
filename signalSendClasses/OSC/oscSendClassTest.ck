//Written by Colton Arnold Fall 2025


@import "../OSC/globalOSCSendClass.ck";

oscSends osc;
osc.init("192.168.1.145", 8001);
osc.send("/meow", 50, 127);