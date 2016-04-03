package neato.core.mvc;
import neato.api.core.mvc.IController;
import neato.core.util.StringUtil;

/**
 * ...
 */
class Controller implements IController
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
	
	/**
	 * ToString.
	 */
	public function toString():String 
	{ 
		return StringUtil.getClassName(this); 
	}
}