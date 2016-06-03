package neato.game;

import neato.api.core.integration.IIntegrator;
import neato.api.game.IGame;
import neato.api.game.IGameController;
import neato.api.game.IGameEntry;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.IIntegrationController;
import neato.api.game.controller.ILoadingController;
import neato.api.game.controller.ISoundsController;
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
		// Model
		var model:IGameModel = Type.createInstance(config.model, []);
		
		// View
		var view:IGameView = Type.createInstance(config.view, []);
		var skin:IGameSkin = Type.createInstance(config.skin, []);
		
		// Extension Manager
		var extensionManager:IExtensionManager = Type.createInstance(config.extensionManager, []);
		
		// Notification Manager
		var notificationManager:INotificationManager = Type.createInstance(config.notificationManager, []);
		
		// Controller
		var actions:IActionsController = Type.createInstance(config.actions, [model]);
		var loading:ILoadingController = Type.createInstance(config.loading, []);
		var sounds:ISoundsController = Type.createInstance(config.sounds, []);
		var integrator:IIntegrator = Type.createInstance(config.integrator, ["https://www.octadecimal.com/neatocasino/service/index.php"]);
		var integration:IIntegrationController = Type.createInstance(config.integration, [integrator]);
		var controller:IGameController = Type.createInstance(config.controller, [model, view, notificationManager, actions, loading, integration, sounds]);
		
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