// Created by Colton Arnold Fall 2025
44100 => int sampleRate;
0::second => dur elapsed;

while (true) {
    1::second => now;
    elapsed + 1::second => elapsed;
    elapsed / sampleRate => elapsed;
    <<< "timelapse:", elapsed >>>;
}