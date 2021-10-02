package web.js;


import js.html.MetaElement;
import js.html.ScriptElement;
import js.html.CanvasElement;
import js.Browser;

//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class Main{
    public static function main(){
        //Create the canvas element then load the Heaps app into the Page.
        var viewport:MetaElement = Browser.document.createMetaElement();
        var formatDetection:MetaElement = Browser.document.createMetaElement();
        var apple_mobile_web_app_capable:MetaElement = Browser.document.createMetaElement();
        var mobile_web_app_capable:MetaElement = Browser.document.createMetaElement();

        viewport.name = "viewport";
        viewport.content = "width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui";
        Browser.document.head.appendChild(viewport);

        formatDetection.name = "format-detection";
        formatDetection.content = "telephone=no";
        Browser.document.head.appendChild(formatDetection);

        apple_mobile_web_app_capable.name = "apple-mobile-web-app-capable";
        apple_mobile_web_app_capable.content = "yes";
        Browser.document.head.appendChild(apple_mobile_web_app_capable);

        mobile_web_app_capable.name = "mobile-web-app-capable";
        mobile_web_app_capable.content = "yes";


        var canvasElement:CanvasElement = Browser.document.createCanvasElement();
        canvasElement.height = Browser.window.innerHeight;
        canvasElement.width = Browser.window.innerWidth;
        canvasElement.setAttribute("id", "webgl");
        Browser.document.body.appendChild(canvasElement);

        var appScript:ScriptElement = Browser.document.createScriptElement();
        //appScript.setAttribute("type", "text/javascript");
        appScript.setAttribute("src", "js/sovHaxeMap.js");
        Browser.document.body.appendChild(appScript);


    }
}