package sovHaxe;
import h3d.prim.Cube;
import h3d.scene.Scene;
import sovHaxe.models.SolarSystem;
class Galaxy {

    var solarSystemList:List<SolarSystem> = new List<SolarSystem>();
    var jumpList = new List<Any>(); // switch to Jump
    var appScene:Scene;

    // Static field for multiplying the scale from Eve's SDE. 1 is using the SDE definition directly. This exists to squish down the map from Eve's more realistic Galaxy positions.
    public static var NEW_EDEN_SCALE = 1.0;

    /**
    * Pull in the Scene to drop the Model Objectrs directly into the scene with
    **/
    public function new(scene:Scene) {
        this.appScene = scene;
    }

    /**
    *
    **/
    public function pushGalaxyBaseToScene(){
        for(system in solarSystemList) {
            var starCube:Cube = new Cube(1, 1, 1);
            //Move the new cube to it's position in space
            starCube.translate(system.pos.x * NEW_EDEN_SCALE, system.pos.y * NEW_EDEN_SCALE, system.pos.z * NEW_EDEN_SCALE);
        }
        for(jumps in jumpList) {
            var
        }
    }


}
