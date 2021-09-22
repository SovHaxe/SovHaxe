package primatives;

import color.Color;
import models.Alliance;

class AllianceTextPrimative implements PrimativePosition {

    /**
    *
    * @param Alliance the alliance this primative is associated with
    * @param Color the alliances Associated color
    **/
    var color:Color;
    public function new(alliance:Alliance, color:Color) {
        // The Associated Alliance to this primitive
        var alliance:Alliance = alliance;
        var this.color
    }

    public var x:Int;
    public var y:Int;


}
