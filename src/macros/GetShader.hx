package macros;
/**
* based off of https://code.haxe.org/category/macros/include-file-next-to-module-file.html
* To create a shader from a .glsl file, Name the GLSL file after the hx class.
* the hx class will compile and work with the Source file that is returned.
**/
import haxe.macro.Expr;
import sys.io.File;
import sys.FileSystem;
import haxe.macro.Type.ClassType;
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr.Field;

import haxe.macro.Expr.ExprOf;
using haxe.macro.Tools;

//Expose and keep class for JS Global and DCE precompiler
@:expose
@:keep
class GetShader {
    /**
    * @params get path to file from class File calling this macro
**/
    public static macro function get(fileReference:String):ExprOf<String>{

        var fields:Array<Field> = Context.getBuildFields();
        var posInfos = Context.getPosInfos(Context.currentPos());
        var directory = Path.directory(posInfos.file);

        var ref:ClassType = Context.getLocalClass().get();

        var filePath:String = Path.join([directory, fileReference]);

        if (FileSystem.exists(filePath)) {
            var fileContent:String = File.getContent(filePath);

        } else {
            return macro null;
        }
    }
}