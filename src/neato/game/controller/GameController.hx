package neato.game.controller;

import neato.api.game.IGame;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameView;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.IIntegrationController;
import neato.api.game.controller.ILoadingController;
import neato.core.debug.Debug;
import neato.core.integration.Integrator;
import neato.core.mvc.Controller;
import neato.core.util.StringUtil;

/**
 * ...
 */
class GameController extends Controller implements IGameController
{
	// Game references
	private var _model:IGameModel;
	private var _view:IGameView;
	
	/**
	 * Constructor.
	 */
	public function new(model:IGameModel, view:IGameView) 
	{
		Debug.output("Creating...");
		
		_model = model;
		_view = view;
		
		super();
		
		actions = getActionsController();
		loading = getLoadingController();
		integration = getIntegrationController();
		
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
	
	
	
	// CONFIGURATION
	//============================================================================================================
	
	private function getActionsController():IActionsController
	{
		return new ActionsController(_model);
	}
	
	private function getLoadingController():ILoadingController
	{
		return new LoadingController();
	}
	
	private function getIntegrationController():IIntegrationController
	{
		return new IntegrationController(new Integrator("http://localhost"));
	}
}