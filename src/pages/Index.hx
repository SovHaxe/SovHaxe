package src.pages;
import src.sde.GalaxySDE;
import src.client.Galaxy;
import haxe.Resource;
import sys.FileSystem;
import sys.io.File;
import htmlparser.HtmlDocument;


//Create a new index page to serve the application as well as additional modal bits
class Index{
    public var pageData:String;
    public var gSDE:GalaxySDE = new GalaxySDE();

    public function new(){
        var html = new HtmlDocument(Resource.getString("canvasPage"));
        //Load and embed 
        var pageStyle = html.find("#canvasStyle");
        pageStyle[0].innerHTML = Resource.getString("canvasStyle");

        

        this.pageData = html.toString();
    }

}