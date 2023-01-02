package src;

import src.client.Galaxy;
import src.sde.GalaxySDE;
import haxe.Resource;
import sys.io.File;
import haxe.http.HttpStatus;
import src.pages.Index;
import weblink.Weblink;
import weblink.Response;
import weblink.Request;
import src.sde.GalaxySDE.*;

class Application {
    static public function main(){
        var app = new Weblink();
        var debug = true;
        trace(Resource.listNames());
        trace("------");
        
        //Lets just get the basics going again, a simple index
        app.get("/", function(req:Request, res:Response){
           var page = new Index();
           res.send(page.pageData);
           return;
        });


        if(debug) {
            app.get("/Client.js.map", function(req, res){
                res.contentType = "text/javascript";
                res.send(Resource.getString("clientScriptMAP"));
            });
        }
        
        // gotta get after PXshadow for letting CR's in that don't have proper Nullchecking, If a browser requests access to a resource that doesn't exist, the entire server kills itself
        app.get("/favicon.ico", function(req:Request, res:Response){
            res.send("0");
        });

        app.get("/client.js", function(req:Request, res:Response){
            res.contentType = "text/javascript";
            res.send(Resource.getString("clientScript"));
        });
        
        app.get("/login.png", function(req, res){
            res.contentType = "image/png";
            res.sendBytes(Resource.getBytes("eveSSOLogin"));
        });


        app.get("/test.lol", function(req:Request, res:Response) {
            res.contentType = "test/javascript";
            var test:GalaxySDE = new GalaxySDE();
            var galaxy:Galaxy = test.createGalaxy();
            res.sendBytes(galaxy);
        });

        trace(app.routes);
        app.listen(80, false);
        while(app.server.running){
            app.server.update(true);
        }
    }


}
