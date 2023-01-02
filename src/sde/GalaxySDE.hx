package src.sde;

import haxe.xml.Access;
import sys.db.ResultSet;
import weblink.Cookie;
import sys.io.File;
import sys.FileSystem;
import sys.db.Sqlite;
import sys.db.Connection;
import src.client.Galaxy;
import src.client.System;
import src.client.Jump;


class GalaxySDE {

    // TODO: Make a scheduled process for acquiring new Static data.
    public function new(){
        
    }
    
    public function createGalaxy():Galaxy{

        var pathToDB = "./db/sqlite-latest.sqlite";
        var connection:Connection = Sqlite.open(pathToDB);

        var rsSystem:ResultSet = connection.request("select * from mapSolarSystems;");

        var galaxy:Galaxy = new Galaxy();

        while(rsSystem.hasNext()){
            rsSystem.next();
            var systemID:Int = rsSystem.getIntResult(2);
            var systemX:Float = rsSystem.getFloatResult(4);
            var systemY:Float = rsSystem.getFloatResult(5);
            var systemZ:Float = rsSystem.getFloatResult(6);
           
            var system:System = new System(systemID, systemX, systemY, systemZ);
            galaxy.pushSystem(system);
        }
        
        var rsJump:ResultSet = connection.request("select * from mapJumps");

        while(rsJump.hasNext()){
            rsJump.next();
            var sys1ID = rsJump.getIntResult(0);
            var sys2ID = rsJump.getIntResult(1);
            
            var jump:Jump = new Jump(galaxy.getSystemById(sys1ID), galaxy.getSystemById(sys2ID));
            galaxy.pushJump(jump);
        }
        
        return galaxy;
    }
}   