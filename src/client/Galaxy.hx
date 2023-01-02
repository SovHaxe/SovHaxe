package src.client;

@:keep
class Galaxy{

    public var ASystems:Map<Int, System> = [];
    public var AJumps:Array<Jump> = [];
    public function new(){
        
    }
    public function pushSystem(system:System){
        this.ASystems.set(system.get_systemID(), system);
    }
    public function pushJump(jump:Jump){
        this.AJumps.push(jump);
    }

    public function getSystemById(id:Int){
        return this.ASystems.get(id);
    }
}