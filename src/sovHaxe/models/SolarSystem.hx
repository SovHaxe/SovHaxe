package sovHaxe.models;
import src.color.Color;
import sovHaxe.primatives.PrimativePosition;

class SolarSystem {

    var id:Int;
    var constID:Int;
    var regionId:Int;
    var apparentSovLevel:Int;
    var pos:PrimativePosition;
    var sovereignty:Alliance;


    public function new(id:Int, constID:Int, regionId:Int, apparentSovLevel:Int, pos:PrimativePosition, ?sovereignty:Alliance) {
        this.id = id;
        this.constID = constID;
        this.regionId = regionId;
        this.apparentSovLevel = apparentSovLevel;
        this.pos = pos;
        if(sovereignty != null){
            this.sovereignty = sovereignty;
        } else {
            this.sovereignty = new Alliance(0, "", true, new Color(128, 128, 128));
        }

    }

}
