package src.client;

@:keep
class System {
    
    var systemID:Int;
    

    //System co-ords based on the centre of the system (represented in exponential value) 
    var systemX:Float;
    var systemY:Float;
    var systemZ:Float;

    var iHubOwner:Alliance;
    public function new(systemId, systemX, systemY, systemX)
    {
        this.systemX = systemX;
    }
}