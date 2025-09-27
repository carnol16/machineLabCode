// Modulettes.ck
// Will Rinkoff
// CalArts Music Tech // MTIID4LIFE

// ===================================================================
//  File: Modulettes.ck
//  Defines Modulettes's OSC address etc. 
//  by Will Rinkoff
//  based on code by Ajay Kapur, Owen Vallis & Dimitri Diakopoulos
//  CalArts Music Technology: Interaction, Intelligence & Design
//  2025
// ===================================================================
public class Modulettes extends Bot{
    
    fun void init(OscRecv orec,OscSend toClient[]){
        _init(orec,"/modulettes","ii",toClient);
        midiInit("Modulettes");
        data.size(2);
        13=>numAct;
    }
}