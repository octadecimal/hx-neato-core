package neato.game.controller;

import neato.api.game.IGameModel;
import neato.api.game.controller.IActionsController;
import neato.core.debug.Debug;
import neato.core.integration.ResponseVO;
import neato.core.mvc.Controller;

/**
 * ...
 */
class ActionsController extends Controller implements IActionsController
{
	private var _gameModel:IGameModel;
	
	/**
	 * Constructor.
	 */
	public function new(gameModel:IGameModel) 
	{
		Debug.output("Creating...");
		
		_gameModel = gameModel;
		
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