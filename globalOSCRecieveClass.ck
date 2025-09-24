public class oscReceive {
    OscIn in;
    OscOut inMonitor;

    fun void init(string ipAddress, int inPort, int outMonitorPort) {
        in.dest(ipAddress, inPort);
        inMonitor.dest(ipAddress, outMonitorPort);
    }

    fun void send(string instrument, int note, int vel) {
        in.start(instrument);
        in.add(note);
        in.add(vel);
        in.send();

        outMonitor.start(instrument);
        outMonitor.add(note);
        outMonitor.add(vel);
        outMonitor.send();
    }
}