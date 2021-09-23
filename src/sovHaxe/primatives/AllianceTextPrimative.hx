package sovHaxe.primatives;

import src.color.Color;
import sovHaxe.models.Alliance;

interface AllianceTextPrimative implements PrimativePosition {

    /**
    *
    * @param Alliance the alliance this primative is associated with
    * @param Color the alliances Associated color
    **/
    var color:Color;

    public var x:Int;
    public var y:Int;
}
