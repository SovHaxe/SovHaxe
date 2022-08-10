package src.pages;
import sys.io.File;
import htmlparser.HtmlDocument;


//Create a new index page to serve the application as well as additional modal bits
class Index{
    public var pageData:String;
    public function new(){
        var html = new HtmlDocument(File.getContent("canvasPage.html"));
        this.pageData = html.toString();
    }

}