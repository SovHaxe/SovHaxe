package backend.swagger.v1.sovreignty;

import DateTools;
import haxe.Http;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
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
    public static var resPath:Path = new Path(Path.normalize("../resources/"));
    public static var endpointURL:String = "https://esi.evetech.net/latest/sovereignty/map/?datasource=tranquility";

    public static var remoteEndpointCacheTime:Float = 3600;
    public var antiRateLimitingMultiplier = 2;


    private var reqInstance:Http;
    public var response(null, null):String;
    /**
    *     Create a main function for if this is Used as a "Web Method" (I.E Create a Page that can be called upon RESTfully and store a Resource in the WebServer itself)
    *       Do this cleverly by essentially just creating a Haxe object of this and returning the results in the objects response.static
    *
    *       only ever really needed if compiled as a Neko Main File since you want it to act as its own "Module" due to how I designed this app
    **/

    public static function main() {
        Sys.println(new Map().response);
    }
    /**
    * Create a new function for if this Used as a Haxe method
    **/
    public function new() {
        if(!FileSystem.exists(resPath.toString())){
            FileSystem.createDirectory(resPath.toString());
        }
        filePulse();
    }

    /**
    * Run the resourcce pulse to check how recent it was created and Act as the main way to create and act as a Default way to Check the pulse and handle the pulse
    *
    * This function can be redefined for different pulse conditions but this isn't necssary unless you need to quickly fix for an API update. See source for how to do this easily.
    * @return String - response content
    **/

    dynamic function filePulse():String {
        // If we've already been runningg
        if(FileSystem.exists(resourcePath.toString())){
            var resourceStat:FileStat = FileSystem.stat(resourcePath.toString());
            var resourceStaleTime:Date = DateTools.delta(resourceStat.mtime, DateTools.seconds(remoteEndpointCacheTime * antiRateLimitingMultiplier));

            if(Date.now().getTime() > resourceStaleTime.getTime()){
                //Resource is stale, refresh it in our resources
                this.response = request();
                FileSystem.deleteFile(resourcePath.toString());
                var file = File.write(resourcePath.toString(), false);
                file.writeString(this.response);
                file.flush();
                file.close();
                return this.response;

            } else {
                // If the resource is not stale, Set the Response to our file content and return the response
                this.response = File.getContent(resourcePath.toString());
                return this.response;
            }
        } else {
            this.response = request();
            var file = File.write(resourcePath.toString(), false);
            file.writeString(this.response);
            file.flush();
            file.close();
            return this.response;
        }
    }
    /**
    * Make the request, limited by another process undefined in the method to prevent getting ratelimited
    * @return response
    **/
    function request(){
        this.reqInstance = new Http(endpointURL);
        return response;
    }
}
