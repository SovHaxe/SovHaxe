package backend.swagger.v1.sovreignty;

import DateTools;
import haxe.Http;
import haxe.io;
import sys.FileSystem;
import sys.FileStat;
import DateTools;

/**
* Web Method and Haxe library implementation of:
* https://esi.evetech.net/ui/?version=latest#/Sovereignty/get_sovereignty_map
*
* When this is a web method (for SovHaxe) it will create a resource object on the webserver for caching within the web service
*
* @returns jsonblob of the current sov map.
**/
class Map {
    //Path to the generated resource within the application.
    public static var resourcePath:Path = new Path(Path.normalize("../resources/map.json"));
    public static var endpointURL:String = "https://esi.evetech.net/latest/sovereignty/map/?datasource=tranquility";

    public static var remoteEndpointCacheTime:Float = 6000;
    public var antiRateLimitingMultiplier = 2;


    private var reqInstance:Http;

    //Create a main function for if this is Used as a "Web Method" (I.E Create a Page that can be called upon RESTfully and store a Resource in the WebServer itself)
    //Do this cleverly by essentially just creating a Haxe object of this and returning the results in the objects response

    public static function main() {
        Sys.println(new Map().response);
    }
    /**
    * Create a new function for if this Used as a Haxe method
    **/
    public function new() {
        filePulse();
    }

    /**
    * Run the resourcce pulse to check how recent it was created and Act as the main way to create and act as a Default way to Check the pulse and handle the pulse
    *
    * Override this method and call
    **/

    function filePulse(){
        if(sys.FileSystem.exists(resourcePath.toString())){
            var resourceStat:FileStat =  sys.FileSystem.stat(resourcePath.toString());

        }
    }

    /**
    * Make the request, limited by another process undefined in the method to prevent getting ratelimited
    * @return response
    **/
    function request(){
        var response:String;
        reqInstance = new Http(endpointURL);
    }
}
