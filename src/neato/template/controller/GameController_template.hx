package neato.template.controller;

import neato.api.game.controller.IActionsController;
import neato.game.controller.GameController;

/**
 * ...
 */
class GameController_template extends GameController
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
	
	
	
	// CONFIGURATION
	//============================================================================================================
	
	override function getActionsController():IActionsController 
	{
		return new ActionsController_template();
	}
}