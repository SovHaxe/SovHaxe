package sovHaxe;

import hxd.App;
//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class MapComponent extends App {
    override function init(){

        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "App Ok";
    }

    static function main() {

        new MapComponent();
    }
}
