package src.client;

import js.Browser;

import createjs.easeljs.Stage;
import createjs.easeljs.Shape;

class Client {

    static public function main(){
        trace("client script loaded");
        //create a createJS stage
        var stage = new Stage("Map");
        var testBox = new Shape();

        testBox.graphics.beginFill("red").drawCircle(50, 50, 40);
        stage.addChild(testBox);
        stage.update();
    }
}