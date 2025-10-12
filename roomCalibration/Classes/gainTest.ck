// Created by Colton Arnold Fall 2025
@import "/Users/mtiid/git/machineLabCode/roomCalibration/Classes/checkVolumeClass.ck";
@import "/Users/mtiid/git/machineLabCode/signalSendClasses/OSC/globalOSCSendClass.ck";


volumeCheck volCheck;
oscSends osc;


// connect microphone (ADC) to blackhole so we can measure it without hearing
//adc => Gain g => blackhole;

// set mic gain if needed (default is 1.0)
//5.0 => g.gain;

// notes (or test labels)
[45, 52, 57, 60, 64, 69, 76, 81, 88, 93, 96] @=> int marimbaNotes[];

// number of readings per note
3 => int repeats;

// time between readings (adjust to give yourself time to strike each note)
1::second => dur waitTime;

// store average levels
float avgLevels[marimbaNotes.size()];

//
//measure average mic level for given note
fun float measureAvgVolume(int note, int repeats) {
    0.0 => float total;
    osc.init("localhost", 50000);
    <<< "----- Measuring note", note, "-----" >>>;

    for (0 => int i; i < repeats; i++) {
        osc.send("/marimba", note, 127);
        <<< "Play note", note, "hit", i+1, "..." >>>;
        waitTime => now;

        volCheck.getLevel() => float level;
        <<< "Measured level:", level >>>;

        total + level => total;
        500::ms => now;
    }

    return total / repeats;
}

// Save averages to JSON
fun void saveAveragesToJSON(float levels[], int notes[]) {
    FileIO file;
    "average_mic_levels.json" => string filename;

    file.open(filename, FileIO.WRITE);
    if (!file.good()) {
        <<< "Error opening", filename >>>;
        return;
    }

    file.write("[\n");
    for (0 => int i; i < notes.size(); i++) {
        Std.itoa(notes[i]) => string noteStr;
        Std.ftoa(levels[i], 5) => string avgStr;

        "{ \"note\": " + noteStr + ", \"average_volume\": " + avgStr + " }" => string entry;
        if (i < notes.size() - 1) entry + "," => entry;
        entry + "\n" => entry;

        file.write(entry);
    }
    file.write("]\n");
    file.close();

    <<< "Saved average mic levels to", filename >>>;
}


fun void test() {
    for (0 => int i; i < marimbaNotes.size(); i++) {
        measureAvgVolume(marimbaNotes[i], repeats) => avgLevels[i];
        <<< "Average mic level for note", marimbaNotes[i], ":", avgLevels[i] >>>;
    }

    saveAveragesToJSON(avgLevels, marimbaNotes);
    <<< "All measurements complete." >>>;
}

test();

