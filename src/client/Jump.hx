package src.client;


//Definition of a jump between two systems, as defined by two mutually connected stargates as resolved by the SDE parser
//TODO: create the SDE parser
class Jump{
    public var sysA(default, default):System;
    public var sysB(default, default):System;
    public function new(p1:System, p2:System){
        this.sysA = p1;
        this.sysB = p2;
    }

    //using the fact that a jump is a mutual connection, we calculate equals by checking both ways
    public function equal(jump:Jump):Bool{
        if(this.sysA == jump.sysA || this.sysA == jump.sysB 
            &&  this.sysB == jump.sysA || this.sysB == jump.sysB)
            {
                return true;
            }
        return false;   
    }
}