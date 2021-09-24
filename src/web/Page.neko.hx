package web;

class Page {

    public var page:Xml = Xml.createDocument();
    public var encoding:Xml = Xml.createElement("meta");

    public var head:Xml = Xml.createElement("head");
    public var body:Xml = Xml.createElement("body");
    private var html:Xml = Xml.createElement("html");
    private var script:Xml = Xml.createElement("script");
    public var access:haxe.xml.Access;

    public function new(pathToJS:String, encodeWith:String = "UTF-8"){

        this.encoding.set("charset", encodeWith);

        //Setup all the things we need for an HTML page to send to the client... at bare minimum
        this.page.addChild(Xml.createDocType("html"));
        this.page.addChild(encoding);
        this.page.addChild(this.html);

        this.script.set("src", pathToJS);
        this.script.addChild(Xml.createElement(""));
          //this.script.set("type", "text/javascript");
        this.body.addChild(this.script);

        //Now add the Elements to the HTML
        this.html.addChild(head);
        this.html.addChild(body);

        //Setup the access for the value
    }



    public function setEncoding(v:String){
        this.encoding.set("charset", v);
    }

    public function getPage():Xml{
        return this.page;
    }

    public function setPage(o:Xml){
        this.page = o;
    }

    public function getBody():Xml{
        return this.body;
    }


}