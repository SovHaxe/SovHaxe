package src.client;

@:keep
class System {
    
    var systemID(get, null):Int;
    
    //System co-ords based on the centre of the system (represented in exponential value) 
    public var systemX:Float;
    public var systemY:Float;
    public var systemZ:Float;
    var iHubOwner:Alliance;
    

    
    public function new(systemId:Int, systemX:Float, systemY:Float, systemZ:Float)
    {
        this.systemID = systemId;
        this.systemX = systemX;
        this.systemY = systemY;
        this.systemZ = systemZ;
    }
    

	public function get_systemID():Int {
		return this.systemID;
	}
}