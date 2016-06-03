package neato.game.controller;

import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameView;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.IIntegrationController;
import neato.api.game.controller.ILoadingController;
import neato.api.game.controller.ISoundsController;
import neato.api.game.notifications.INotificationManager;
import neato.core.debug.Debug;
import neato.core.mvc.Controller;

/**
 * ...
 */
class GameController extends Controller implements IGameController
{
	// Game references
	private var _view:IGameView;
	
	/**
	 * Constructor.
	 * @param	model
	 * @param	view
	 * @param	notifications
	 * @param	actions
	 * @param	loading
	 * @param	integration
	 * @param	sounds
	 */
	public function new(model:IGameModel, view:IGameView, notifications:INotificationManager, actions:IActionsController, loading:ILoadingController, integration:IIntegrationController, sounds:ISoundsController) 
	{
		Debug.output("Creating...");
		
		_view = view;
		
		this.actions = actions;
		this.loading = loading;
		this.integration = integration;
		this.sounds = sounds;
		
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
		
		actions.destroy();
		loading.destroy();
		integration.destroy();
		
		actions = null;
		loading = null;
		integration = null;
		
		Debug.output("Destroyed.");
	}
	
	
	
	// PROPERTIES
	//============================================================================================================
	
	/**
	 * Actions controller.
	 */
	public var actions(default, null):IActionsController;
	
	/**
	 * Loading controller.
	 */
	public var loading(default, null):ILoadingController;
	
	/**
	 * Integration controller.
	 */
	public var integration(default, null):IIntegrationController;
	
	/**
	 * Sounds controller.
	 */
	public var sounds(default, null):ISoundsController;
	
	
	
	// API
	//============================================================================================================
	
	public function initialize():Void
	{
		actions.initialize();
	}
	
	public function start():Void
	{
		//actions.startGame(); -- now called on handshake received in GameController
	}
}