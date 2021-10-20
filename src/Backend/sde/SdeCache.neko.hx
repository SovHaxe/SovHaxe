package backend.sde;

import haxe.Http;
import haxe.io.Path;

/**
* Functionality to service the local SDE cache and it's
**/


class SdeCache {
    static var sdePath:Path = new Path(Path.normalize("./resources/sde.zip"));

    public static function downloadSDE(){
        var http = new Http("https://eve-static-data-export.s3-eu-west-1.amazonaws.com/tranquility/sde.zip");
        http.onData = function (data) {
            haxe.io.Bytes.ofData(data);
        }
    }
}
