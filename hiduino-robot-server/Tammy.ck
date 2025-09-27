// ===================================================================
//  File: Tammy.ck
//  Defines Tammy's OSC address etc. 
//  by Nathan Villicana-Shaw
//  based on code by Ajay Kapur, Owen Vallis & Dimitri Diakopoulos
//  CalArts Music Technology: Interaction, Intelligence & Design
//  2025
// ===================================================================
public class Tammy extends Bot{
    
    fun void init(OscRecv orec,OscSend toClient[]){
        _init(orec,"/tammy","ii",toClient);
        midiInit("Tammy");
        data.size(2);
        12=>numAct;
    }
}