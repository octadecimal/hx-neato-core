package neato.game.controller;

import neato.api.game.IGameModel;
import neato.api.game.controller.IActionsController;
import neato.api.game.notifications.INotificationManager;
import neato.core.debug.Debug;
import neato.core.integration.ResponseVO;
import neato.core.mvc.Controller;

/**
 * ...
 */
class ActionsController extends Controller implements IActionsController
{
	/**
	 * Constructor.
	 */
	public function new(notifications:INotificationManager, model:IGameModel) 
	{
		Debug.output("Creating...");
		
		super(notifications, model);
		
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
	
	public function startGame(vo:ResponseVO):Void
	{
		
	}
	
	public function startRound():Void
	{
		
	}
	
	public function finishRound(vo:ResponseVO):Void
	{
		
	}
	
	public function skipToNext():Void
	{
		
	}
	
	public function clear():Void
	{
		
	}
}