// Created by Colton Arnold Fall 2025
@import "../Classes/checkVolumeClass.ck";

volumeCheck volCheck;

    // monitor in terminal
while (true) {
    <<< "Mic Level:", volCheck.getLevel() >>>;
    100::ms => now;
}