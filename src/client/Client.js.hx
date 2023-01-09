package src.client;

import js.html.FetchEvent;
import haxe.Unserializer;
import js.html.Request;
import createjs.easeljs.Graphics;
import js.html.CanvasElement;
import js.html.RecordingState;
import createjs.easeljs.Rectangle;
import createjs.easeljs.DisplayObject;
import createjs.preloadjs.Event;
import createjs.preloadjs.EventDispatcher;
import js.html.Window;
import js.Browser;
import js.Lib.debug;

import createjs.easeljs.Stage;
import createjs.easeljs.Shape; 

// Our "Injection" code to give us a Haxe instance capable of modifying the canvas... Excuse the Main line, but static can't access itself so.... class splits.
@:expose
@:keep
class Client {

    static public function main(){
        trace("client script loaded");
        var stage = new Stage("Map");
        var view = new View(stage);
        
    }
}

@:expose
@:keep
//The actual class for managing displays, Client is simply to grab and kickoff the client "program" within the canvas
class View {
    public var stage:Stage;
    public var window:Window;
    public var galaxy:Galaxy;

    var canvas:CanvasElement;

    public function new(stage:Stage){
        this.stage = stage;
        this.canvas = stage.canvas;
        var galaxyRequest = new Request("/test.lol");
        var galaxyPromise  = galaxyRequest.text();
        
        galaxyPromise.then(elem -> {
           var ser:Unserializer = new Unserializer(elem);
           this.galaxy = ser.unserialize();
           drawUniverse();
        });
        
    }
    

    public function drawUniverse(){
        for(jump in galaxy.AJumps) {
            drawJump(jump);
        }
        for(star in galaxy.ASystems){
            drawStar(star);
        }
        
    }

    public function drawJump(jump:Jump){
        var line = new Shape();
            var systemA = jump.sysA;
            var systemB = jump.sysB;
            line.graphics
                .setStrokeStyle(1)
                .beginStroke("white")
                .moveTo(systemA.systemX, systemA.systemY)
                .lineTo(systemB.systemX, systemB.systemY)
                .endStroke();
            this.stage.addChild(line);
            this.stage.update();
    }

    public function drawStar(system:System){
        var starGraphic = new Shape();
        starGraphic.name = "star_" + system.get_systemID();
        starGraphic.graphics.beginFill("blue").drawCircle(system.systemX, system.systemY, 10);
        this.stage.addChild(starGraphic);
        this.stage.update();
    }


    public function testDraw(){
        var testShape = new Shape();
        testShape.name = "testShape";
        testShape.graphics.beginFill("red").drawCircle(40,40,40);

        this.stage.addChild(testShape);
        this.stage.update();
    }

    public function scalepos(posX, posY){

    }

}