// volumeAverager.ck
// Created by Colton Arnold 2025
@import "../roomCalibration/Classes/checkVolumeClass.ck";
@import "../signalSendClasses/midi/midiInstrumentClass.ck";
@import "../signalSendClasses/OSC/globalOSCSendClass.ck";

volumeCheck volCheck;
oscSends osc;
midiInstrumentSends midiSend;

OscIn in;
OscOut inMonitor;
OscMsg msg;

// Notes you want to test
[45, 52, 57, 60, 64, 69, 76, 81, 88, 93, 96] @=> int marimbaNotes[];

// number of repetitions per note
3 => int repeats;

// time between hits
500::ms => dur beat;

// array to store average volumes
float avgVolumes[marimbaNotes.size()];

// ---------------------------------------------------
// function: measure volume for a given note
// ---------------------------------------------------
fun float measureAvgVolume(int note, int repeats) {
    0.0 => float totalVol;

    for (0 => int i; i < repeats; i++) {
        osc.send("/marimba", note, 100); // hit with fixed velocity
        beat => now;

        // measure volume for this note
        volCheck.getVolume("/marimba", note) => float vol;

        <<< "Hit", i+1, "for note", note, "volume:", vol >>>;

        totalVol + vol => totalVol;
        200::ms => now; // short pause between samples
    }

    return totalVol / repeats;
}

// ---------------------------------------------------
// main test loop
// ---------------------------------------------------
fun void runVolumeCheck() {
    osc.init("127.0.0.1", 8000);

    for (0 => int i; i < marimbaNotes.size(); i++) {
        measureAvgVolume(marimbaNotes[i], repeats) => avgVolumes[i];
        <<< "Average volume for note", marimbaNotes[i], ":", avgVolumes[i] >>>;
    }

    // Optionally write results to JSON
    saveAveragesToJSON(avgVolumes, marimbaNotes);
}

//Save to Json
fun void saveAveragesToJSON(float averages[], int notes[]) {
    FileIO file;
    "marimba_volume_averages.json" => string filename;

    file.open(filename, FileIO.WRITE);
    if (!file.good()) {
        <<< "Error opening", filename >>>;
        return;
    }

    file.write("[\n");
    for (0 => int i; i < notes.size(); i++) {
        Std.itoa(notes[i]) => string noteStr;
        Std.ftoa(averages[i]) => string avgStr;

        "{ \"note\": " + noteStr + ", \"average_volume\": " + avgStr + " }" => string entry;
        if (i < notes.size() - 1) entry +="," => entry;
        entry + "\n" => entry;

        file.write(entry);
    }
    file.write("]\n");
    file.close();

    <<< "Saved average volumes to", filename >>>;
}

// ---------------------------------------------------
// Run
// ---------------------------------------------------
runVolumeCheck();
