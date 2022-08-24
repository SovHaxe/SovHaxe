package src.client;

@:keep
class Galaxy{

    public var ASystems:Array<System> = [];
    public var AJumps:Array<Jump> = [];
    public function new(){
        
    }
    public function pushSystem(system:System){
        this.ASystems.push(system);
    }
    public function pushJump(jump:Jump){
        this.AJumps.push(jump);
    }

    public function getSystemById(id:Int){
    }
}