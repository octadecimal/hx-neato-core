package neato.game;

import neato.api.game.notifications.INotificationManager;
import neato.api.game.IGame;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.extensions.IExtensionsManager;
import neato.game.controller.actions.ActionQueue;
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
	public function new(model:IGameModel, view:IGameView, skin:IGameSkin, controller:IGameController, extensions:IExtensionsManager, notifications:INotificationManager) 
	{
		this.model = model;
		this.view = view;
		this.skin = skin;
		this.controller = controller;
		this.extensions = extensions;
		this.notifications = notifications;
		
		_instance = this;
		
		Debug.output("Created. model=" + StringUtil.getClassName(model) + " view=" + StringUtil.getClassName(view) + " controller=" + StringUtil.getClassName(controller) + " extensions=" + StringUtil.getClassName(extensions));
		
		initialize();
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
	 * Game skin.
	 */
	public var skin(default, null):IGameSkin;
	
	/**
	 * Game controller.
	 */
	public var controller(default, null):IGameController;
	
	/**
	 * Game extensions.
	 */
	public var extensions(default, null):IExtensionsManager;
	
	/**
	 * Game notifications.
	 */
	public var notifications(default, null):INotificationManager;
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * Initialization routine.
	 */
	public function initialize():Void
	{
		// Initialize game controller
		controller.initialize();
		
		// Initialize game skin
		skin.initialize(controller.loading.getTextureMap());
	}
	
	/**
	 * Starts the game.
	 */
	public function start():Void
	{
		// Start extensions
		for (extension in extensions.getAllExtensions())
		{
			extension.start();
		}
		
		// Start controller
		controller.start();
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