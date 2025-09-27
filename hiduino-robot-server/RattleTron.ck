// RattleTron.ck
// Nathan Villicana-Shaw
// CalArts Music Tech // MTIID4LIFE

// ===================================================================
//  File: GanaPati.ck
//  Defines GanaPati's OSC address etc. 
//  by Ness Morris and Bruce Lott 
//  based on code by Ajay Kapur, Owen Vallis & Dimitri Diakopoulos
//  CalArts Music Technology: Interaction, Intelligence & Design
//  2013-2014
// ===================================================================
public class RattleTron extends Bot{
    
    fun void init(OscRecv orec,OscSend toClient[]){
        _init(orec,"/rattletron","ii",toClient);
        midiInit("Rattletron");
        data.size(2);
        11=>numAct;
    }
}