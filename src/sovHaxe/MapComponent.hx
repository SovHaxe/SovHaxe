package sovHaxe;

import h3d.Camera;
import h3d.scene.Scene;
import hxd.App;
//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class MapComponent extends App {
    override function init(){
        var appScene:Scene = s3d;
        var camera:Camera = appScene.camera; 

    }

    static function main() {

        new MapComponent();
    }
}
