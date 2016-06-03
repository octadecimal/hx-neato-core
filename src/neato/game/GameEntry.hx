package neato.game;

import neato.api.game.IGame;
import neato.api.game.IGameController;
import neato.api.game.IGameEntry;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.extensions.IExtension;
import neato.api.game.extensions.IExtensionManager;
import neato.api.game.notifications.INotificationManager;
import neato.game.model.vo.GameConfigurationVO;

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
	/**
	 * Constructor.
	 */
	public function new() 
	{
		
	}
	
	
	
	// CONFIGURATION
	//============================================================================================================
	
	private function createGameFromConfiguration(config:GameConfigurationVO):IGame
	{
		// Create game component instances
		var model:IGameModel = Type.createInstance(config.model, []);
		var view:IGameView = Type.createInstance(config.view, []);
		var skin:IGameSkin = Type.createInstance(config.skin, []);
		var controller:IGameController = Type.createInstance(config.controller, [model, view]);
		var extensionManager:IExtensionManager = Type.createInstance(config.extensionManager, []);
		var notificationManager:INotificationManager = Type.createInstance(config.notificationManager, []);
		
		// Get registered extensions.
		var extensions:Map<String, Class<IExtension>> = config.getExtensions();
		
		// Register extensions
		for (key in extensions.keys())
		{
			extensionManager.register(key, extensions.get(key));
		}
		
		// Create and return game
		return new Game(model, view, skin, controller, extensionManager, notificationManager);
	}
}