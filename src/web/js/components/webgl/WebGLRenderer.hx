package web.js.components.webgl;

import js.html.webgl.Program;
import js.lib.ArrayBufferView;
import js.html.webgl.Buffer;
import web.js.components.webgl.shaders.SquareFragment;
import web.js.components.webgl.shaders.Square;
import js.html.webgl.WebGL2RenderingContext;
import js.html.CanvasElement;
import js.Browser;
import js.html.webgl.GL2;
import js.html.webgl.Shader;

//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class WebGLRenderer {
    public var context:GL2;
    public function new(canvas:CanvasElement) {
        //Get the GL2 Instance from the canvas given to us by the page.
        this.context = canvas.getContextWebGL2();
        if(context == null){
            Browser.alert("WebGL2 instance not able to initialize, Browser/Machine likely unable to support WebGL");
            return;
        }

        context.clearColor(0.0, 0.0, 0.0, 1.0);
        clearCanvas();

        var posBuffer:Buffer = context.createBuffer();
        context.bindBuffer(WebGL2RenderingContext.ARRAY_BUFFER, posBuffer);

        var positions = [
            -1.0,  1.0,
            1.0,  1.0,
            -1.0, -1.0,
            1.0, -1.0,
        ];

        context.bufferData(WebGL2RenderingContext.ARRAY_BUFFER,new ArrayBufferView(positions), WebGL2RenderingContext.STATIC_DRAW, 0);



        var square:Shader = new Square();
        var squareFrag:Shader = new SquareFragment();

        var squareProgram:Program = context.createProgram();
        context.attachShader(squareProgram, square);
        context.attachShader(squareProgram, squareFrag);
        context.linkProgram(squareProgram);
    }

    public function clearCanvas() {
        context.clear(WebGL2RenderingContext.COLOR_BUFFER_BIT);
    }
}
