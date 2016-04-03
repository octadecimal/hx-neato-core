package neato.game.controller;

import neato.api.game.controller.IActionsController;
import neato.core.debug.Debug;
import neato.core.mvc.Controller;
import neato.core.util.StringUtil;

/**
 * ...
 */
class ActionsController extends Controller implements IActionsController
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
	
	public function initialize():Void
	{
		
	}
	
	public function startGame():Void
	{
		
	}
	
	public function startRound():Void
	{
		
	}
	
	public function finishRound():Void
	{
		
	}
	
	public function skipToNext():Void
	{
		
	}
	
	public function clear():Void
	{
		
	}
}