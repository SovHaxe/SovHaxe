package web.js;


import js.html.CanvasElement;
import js.html.HtmlElement;
import web.js.components.webgl.WebGLRenderer;
import js.html.Window;
import js.Browser;

//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class Main{
    public static function main(){
        Browser.alert("aylmao");

        //Insert renderer into here
        var canvasElement:CanvasElement = Browser.document.createCanvasElement();
        canvasElement.height = 600;
        canvasElement.width = 800;
        canvasElement.setAttribute("id", "glCanvas");
        Browser.document.body.appendChild(canvasElement);


        var browserWindow:Window = Browser.window;
        //Get the canvas element from the page and Cast it to a CanvasElement to pull the context into our renderer (So we don't need to handle it here.)
        var webGLrenderer = new WebGLRenderer(canvasElement);


    }
}