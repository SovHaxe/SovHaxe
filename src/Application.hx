package src;

import haxe.http.HttpStatus;
import src.pages.Index;
import weblink.Weblink;
import weblink.Response;
import weblink.Request;

class Application {
    static public function main(){
        var app = new Weblink();        
        //Lets just get the basics going again, a simple index
        app.get("/", function(req:Request, res:Response){
            var page = new Index();
            res.send(page.pageData);
        });
        app.listen(80);
    }
}