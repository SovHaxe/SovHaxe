package src.sde;

import sys.FileSystem;

class GalaxySDE {

    var sdeUnpackPath = "./sde/";

    public function new(){
    }

    
    public function digGalaxy(){
        var regionsDisp = FileSystem.readDirectory(sdeUnpackPath + "fsd/universe/eve/");

        var regions:Array<String>;
        for(region in regionsDisp) {
            if(FileSystem.isDirectory(sdeUnpackPath + "fsd/universe/eve/" + region)) 
            {
                regions.push(region);
            }
        }

        //For each region directory, scan it and get the constellations
        

    }


}   