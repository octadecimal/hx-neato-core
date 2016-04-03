package neato.game;

import neato.api.game.IGame;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameView;
import neato.api.game.extensions.IExtensionManager;
import neato.core.actions.ActionQueue;
import neato.core.debug.Debug;
import neato.core.util.StringUtil;

/**
 * The game is a light class that serves as the root of our game by acting as a facade
 * to our game model, view, controller, and all registered game extensions.
 */
class Game implements IGame
{
	private static var _instance:IGame;
	
	/**
	 * Constructor.
	 */
	public function new(model:IGameModel, view:IGameView, controller:IGameController, extensions:IExtensionManager) 
	{
		this.model = model;
		this.view = view;
		this.controller = controller;
		this.extensions = extensions;
		
		_instance = this;
		
		Debug.output("Created. model=" + StringUtil.getClassName(model) + " view=" + StringUtil.getClassName(view) + " controller=" + StringUtil.getClassName(controller) + " extensions=" + StringUtil.getClassName(extensions));
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void
	{
		Debug.output("Destroying...");
		
		extensions.destroy();
		controller.destroy();
		view.destroy();
		model.destroy();
		
		extensions = null;
		controller = null;
		view = null;
		model = null;
		
		Debug.output("Destroyed.");
	}
	
	
	
	// ACCESSORS
	//============================================================================================================
	
	/**
	 * Game model.
	 */
	public var model(default, null):IGameModel;
	
	/**
	 * Game view.
	 */
	public var view(default, null):IGameView;
	
	/**
	 * Game controller.
	 */
	public var controller(default, null):IGameController;
	
	/**
	 * Game extensions.
	 */
	public var extensions(default, null):IExtensionManager;
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * Initialization routine.
	 */
	public function initialize():Void
	{
		controller.initialize();
	}
	
	/**
	 * Special static accessor that may only be invoked by an ActionQueue for convenience reasons
	 * and for not having to pass the game reference around all over the place to places where it shouldn't.
	 * @param	requester
	 * @return
	 */
	public static function getInstance(requester:Dynamic):IGame
	{
		Debug.output("Requesting special access to static reference: " + StringUtil.getClassName(requester));
		
		if(Std.is(requester, ActionQueue))
		{
			return _instance;
		}
		else
		{
			throw "Attempted to retrieve static game reference by: " + requester;
			return null;
		}
	}
}