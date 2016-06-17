package neato.game.controller;

import neato.api.game.IGameModel;
import neato.api.game.controller.IActionsController;
import neato.api.game.notifications.INotificationManager;
import neato.core.debug.Debug;
import neato.core.integration.ResponseVO;
import neato.core.mvc.Controller;
import neato.game.controller.actions.ActionQueue;
import neato.game.controller.actions.initialization.ADetermineGameSize;
import neato.game.controller.actions.initialization.AInitializeApplication;
import neato.game.controller.actions.initialization.AInitializeExtensions;
import neato.game.controller.actions.initialization.ALoadAssetMap;
import neato.game.controller.actions.initialization.ALoadGlobalSettings;
import neato.game.controller.actions.initialization.AParseDOM;
import neato.game.controller.actions.initialization.AParseSettings;
import neato.game.controller.actions.loading.ALoadRequiredContexts;
import neato.game.controller.actions.loading.ARequireContext;

/**
 * ...
 */
class ActionsController extends Controller implements IActionsController
{
	private var _actionQueue:ActionQueue;
	
	/**
	 * Constructor.
	 */
	public function new(notifications:INotificationManager, model:IGameModel) 
	{
		Debug.output("Creating...");
		
		super(notifications, model);
		
		_actionQueue = new ActionQueue();
		
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
		// Get game size (asset prefix)
		add(ADetermineGameSize);
		
		// Load core resources
		add(ALoadGlobalSettings);
		add(ALoadAssetMap);
		
		// Require default context
		add(ARequireContext, "default");
		add(ALoadRequiredContexts);
		
		// Parse settings
		add(AParseSettings);
		
		// Initialize application
		add(AInitializeApplication);
		
		// Parse game dom
		add(AParseDOM);
		
		// Initialize extensions
		add(AInitializeExtensions);
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
	
	
	
	// PRIVATE
	//============================================================================================================
	
	private function add(actionDefinition:Class<Dynamic>, ?params:Dynamic = null):Void
	{
		_actionQueue.add(actionDefinition, params);
	}
	
	private function execute():Void
	{
		_actionQueue.execute();
	}
}