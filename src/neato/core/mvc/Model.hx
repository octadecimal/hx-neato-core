package neato.core.mvc;

import neato.core.util.StringUtil;

/**
 * ...
 */
class Model
{
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
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * ToString.
	 */
	public function toString():String 
	{ 
		return StringUtil.getClassName(this); 
	}
	
	/**
	 * Resets the model state.
	 */
	public function reset():Void
	{
		
	}
}