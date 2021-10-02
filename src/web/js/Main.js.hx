package web.js;


import js.html.ScriptElement;
import js.html.CanvasElement;
import js.Browser;

//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class Main{
    public static function main(){
        Browser.alert("aylmao");

        //Create the canvas element then load the Heaps app into the Page.
        var canvasElement:CanvasElement = Browser.document.createCanvasElement();
        canvasElement.height = 600;
        canvasElement.width = 800;
        canvasElement.setAttribute("id", "webgl");
        Browser.document.body.appendChild(canvasElement);

        var appScript:ScriptElement = Browser.document.createScriptElement();
        appScript.setAttribute("type", "text/javascript");
        appScript.setAttribute("src", "js/sovHaxeMap.js");
        Browser.document.body.appendChild(appScript);


    }
}