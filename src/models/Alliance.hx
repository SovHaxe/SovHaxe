package models;

class Alliance {
    /**
    *
    **/
    var id:Int;
    var name:String;
    var npc:Bool;
    public function new(id:Int, name:String, npc:Bool) {
        this.id = id;
        this.name = name;
        this.npc = npc;
    }

}
