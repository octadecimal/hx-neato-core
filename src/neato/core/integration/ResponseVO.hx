package neato.core.integration;

/**
 * ...
 */
class ResponseVO
{
	public var action:Int = -1;
	public var state:Int = -1;
	
	public var balance:Int = 0;
	
	public var result:String;
	
	public var winAmount:Int = 0;
	public var winType:String;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
}