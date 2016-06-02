package neato.game;

import neato.api.game.notifications.INotificationManager;
import neato.api.game.IGame;
import neato.api.game.IGameController;
import neato.api.game.IGameEntry;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.extensions.IExtensionManager;
import neato.game.notifications.NotificationManager;
import neato.game.controller.GameController;
import neato.game.extensions.ExtensionManager;
import neato.game.model.GameModel;
import neato.game.view.GameSkin;
import neato.game.view.GameView;

/**
 * Responsible for creating the game and all of its extensions. Game entries
 * don't necessarily need to implement IGameEntry -- by design, the purpose of
 * a game entry is to not implement any specific interfaces for cases where a
 * 3rd party platform might require very specific requirements in the game's
 * document class. This class is provided for cases where this isn't necessary,
 * and also serves as a reference for how other game entries could be created.
 */
class GameEntry implements IGameEntry
{
	private var _game:IGame;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		// Create game
		_game = getGame();
		
		// Initialize game
		_game.initialize();
	}
	
	/**
	 * Destructor.
	 */
	public function destroy() 
	{
		_game.destroy();
		_game = null;
	}
	
	
	
	// CONFIGURATION
	//============================================================================================================
	
	/**
	 * Creates the game instance. This method can not be overridden.
	 * @return
	 */
	private inline function getGame():IGame
	{
		// Create game components
		var model:IGameModel = getGameModel();
		var view:IGameView = getGameView();
		var skin:IGameSkin = getGameSkin();
		var controller:IGameController = getGameController(model, view);
		var extensions:IExtensionManager = getExtensionManager();
		var notifications:INotificationManager = getNotificationManager();
		
		// Register extensions
		registerExtensions(extensions);
		
		// Create and return game
		return new Game(model, view, skin, controller, extensions, notifications);
	}
	
	/**
	 * Creates the game model instance, can be overridden to provide a different IGameModel to the game.
	 * @return
	 */
	public function getGameModel():IGameModel
	{
		return new GameModel();
	}
	
	/**
	 * Creates the game view instance, can be overridden to provide a different IGameView to the game.
	 * @return
	 */
	public function getGameView():IGameView
	{
		return new GameView();
	}
	
	/**
	 * Creates the game skin instance, can be overridden to provide a different IGameSkin to the game.
	 * @return
	 */
	public function getGameSkin():IGameSkin
	{
		return new GameSkin();
	}
	
	/**
	 * Creates the game controller instance, can be overridden to provide a different IGameController to the game.
	 * @return
	 */
	public function getGameController(model:IGameModel, view:IGameView):IGameController
	{
		return new GameController(model, view);
	}
	
	/**
	 * Creates the game extension manager instance, can be overridden to provide a different IExtensionManager to the game.
	 * @return
	 */
	public function getExtensionManager():IExtensionManager
	{
		return new ExtensionManager();
	}
	
	/**
	 * Creates the game notification manager instance, can be overridden to provide a different INotificationManager to the game.
	 * @return
	 */
	public function getNotificationManager():INotificationManager
	{
		return new NotificationManager();
	}
	
	/**
	 * Registers any game extensions needed by the game, intended to be overridden and then using the
	 * `extensionManager` argument provided to register any needed extensions. This is called after our game 
	 * components (model, view, controller) have been created but before the game itself has been created.
	 * @param	extensionManager	A reference to our extension manager.
	 */
	public function registerExtensions(extensionManager:IExtensionManager):Void
	{
		
	}
}