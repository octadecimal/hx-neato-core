package neato.core.extensions;

import neato.api.core.extensions.IExtension;
import neato.core.debug.Debug;
import neato.core.util.StringUtil;

/**
 * ...
 */
class Extension implements IExtension
{
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		Debug.output("Destroyed.");
	}
	
	/**
	 * ToString.
	 */
	public function toString():String 
	{ 
		return StringUtil.getClassName(this); 
	}
}