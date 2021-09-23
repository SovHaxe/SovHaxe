package sovHaxe.models;

import src.color.Color;

class Alliance {
    /**
    *
    **/
    var id:Int;
    var name:String;
    var npc:Bool;

    var allianceBaseColor:Color;
    var allianceStarColor:Color;
    var allianceNameColor:Color;
    
    var count:Int; // TODO: figure out if this is relevant in the slightest.

    /**
    *
    * @param baseColor the color of the Sov representation
    **/
    public function new(id:Int, name:String, npc:Bool, baseColor:Color) {
        this.id = id;
        this.name = name;
        this.npc = npc;
        
        this.allianceBaseColor = baseColor;
    }

}
