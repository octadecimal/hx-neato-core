package neato.game.controller;

import neato.api.game.IGameController;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.ILoadingController;
import neato.core.debug.Debug;
import neato.core.mvc.Controller;
import neato.core.util.StringUtil;

/**
 * ...
 */
class GameController extends Controller implements IGameController
{
	/**
	 * Actions controller.
	 */
	public var actions(default, null):IActionsController;
	
	/**
	 * Loading controller.
	 */
	public var loading(default, null):ILoadingController;
	
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Creating...");
		
		super();
		
		actions = getActionsController();
		loading = getLoadingController();
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		Debug.output("Destroying...");
		
		super.destroy();
		
		actions.destroy();
		loading.destroy();
		
		actions = null;
		loading = null;
		
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	public function initialize():Void
	{
		actions.initialize();
	}
	
	
	
	// CONFIGURATION
	//============================================================================================================
	
	private function getActionsController():IActionsController
	{
		return new ActionsController();
	}
	
	private function getLoadingController():ILoadingController
	{
		return new LoadingController();
	}
}