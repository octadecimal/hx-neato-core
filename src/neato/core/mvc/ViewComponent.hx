package neato.core.mvc;

import neato.core.display.Container;
import neato.core.geom.Rectangle;

/**
 * ...
 */
class ViewComponent extends Container
{
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
		
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		super.destroy();
	}
	
	
	
	// API
	//============================================================================================================
	
	public function build():Void
	{
		
	}
	
	public function setInitialState():Void
	{
		
	}
	
	public function addRect(name:String, rect:Rectangle) 
	{
		
	}
}