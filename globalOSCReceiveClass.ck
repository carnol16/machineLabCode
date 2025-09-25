public class oscReceive {
    OscIn in;
    OscOut inMonitor;
    OscMsg msg;

    fun void init(string ipAddress, int inPort, int inMonitorPort) {
        in.port(inPort);
        inMonitor.dest(ipAddress, inMonitorPort);
    }

    fun void receive(string instrument) {
        in.addAddress(instrument);
        while( true )
        {
            // wait for event to arrive
            in => now;

            // grab the next message from the queue. 
            while( in.recv(msg) )
            { 
                // expected datatypes
                // fetch note
                msg.getInt(0) => int note;
                // fetch velocity
                msg.getInt(1) => int vel;

                // print
                <<< "got (via OSC):", instrument, note, vel >>>;
                inMonitor.start(instrument);
                inMonitor.add(note);
                inMonitor.add(vel);
                inMonitor.send();            
            }
        }
    }
}