public class oscSends {
    OscOut out;
    OscOut outMonitor;

    fun void init(string ipAddress, int outPort, int outMonitorPort) {
        out.dest(ipAddress, outPort);
        outMonitor.dest(ipAddress, outMonitorPort);
    }

    fun void send(string instrument, int note, int vel) {
        out.start(instrument);
        out.add(note);
        out.add(vel);
        out.send();

        outMonitor.start(instrument);
        outMonitor.add(note);
        outMonitor.add(vel);
        outMonitor.send();
    }
}