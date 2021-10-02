package sovHaxe;

class Main extends hxd.App {
    override function init(){
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "App Ok";
    }

    public static function main() {
        new Main();
    }
}
