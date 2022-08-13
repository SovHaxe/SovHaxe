package src.client;

import js.Browser;

import createjs.easeljs.Stage;
import createjs.easeljs.Shape;

@:expose
@:keep
class Client {

    static public function main(){
        trace("client script loaded");

        var stage = new Stage("Map");
        var testCircle = new Shape();

        testCircle.graphics.beginFill("red").drawCircle(40,40,40);
        stage.addChild(testCircle);
        stage.update();
    }
    


}