package src;

import haxe.Resource;
import sys.io.File;
import haxe.http.HttpStatus;
import src.pages.Index;
import weblink.Weblink;
import weblink.Response;
import weblink.Request;

class Application {
    static public function main(){
        var app = new Weblink();
        trace(Resource.listNames());
        trace("------");
        
        //Lets just get the basics going again, a simple index
        app.get("/", function(req:Request, res:Response){
           var page = new Index();
           trace("/ get from " + req.ip);
           res.send(page.pageData);
           return;
        });
        
        // gotta get after PXshadow for letting CR's in that don't have proper Nullchecking, If a browser requests access to a resource that doesn't exist, the entire server kills itself
        app.get("/favicon.ico", function(req:Request, res:Response){
            res.send("0");
        });

        app.get("/client.js", function(req:Request, res:Response){
            res.contentType = "text/javascript";
            res.send(Resource.getString("clientScript"));
        });

        trace(app.routes);
        app.listen(80, false);
        while(app.server.running){
            app.server.update(true);
        }
    }


}
