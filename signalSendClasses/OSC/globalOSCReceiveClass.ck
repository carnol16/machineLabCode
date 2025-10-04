public class oscReceive {
    OscIn in;
    OscOut inMonitor;
    OscMsg msg;

    int data[];
    


    
    // fun void init(int inPort, int inMonitorPort) {
    //     in.port(inPort);
    //     inMonitor.dest("localhost", inMonitorPort);
    // }

        
    fun void init(int inPort) {
        in.port(inPort);
        inMonitor.dest("localhost", 7001);
    }


    fun string int receive() {
        in.listenAll();
        //in.addAddress(instrument);
        while( true )
        {
            // wait for event to arrive
            in => now;

            // grab the next message from the queue. 
            while( in.recv(msg) )
            { 
                // expected datatypes
                //fetch Address
                msg.address() => string instrument
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

                return instrument;
                return note;
                return vel;
            }
        }
    }
}