package neato.game.controller;

import neato.api.core.IDestroyable;
import neato.api.game.controller.ILoadingController;
import neato.core.debug.Debug;
import neato.core.mvc.Controller;
import neato.core.util.StringUtil;

/**
 * ...
 */
class LoadingController extends Controller implements ILoadingController
{
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Creating...");
		
		super();
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		Debug.output("Destroying...");
		
		super.destroy();
		
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	public function requireResource():Void
	{
		
	}
}