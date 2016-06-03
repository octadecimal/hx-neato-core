package neato.game.model.vo;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.extensions.IExtension;
import neato.api.game.extensions.IExtensionManager;
import neato.api.game.notifications.INotificationManager;
import neato.game.controller.GameController;
import neato.game.extensions.ExtensionManager;
import neato.game.notifications.NotificationManager;
import neato.game.view.GameSkin;
import neato.game.view.GameView;

/**
 * ...
 */
class GameConfigurationVO
{
	public var model:Class<IGameModel>;
	public var view:Class<IGameView>;
	public var skin:Class<IGameSkin>;
	public var controller:Class<IGameController>;
	
	public var extensionManager:Class<IExtensionManager>;
	public var notificationManager:Class<INotificationManager>;
	
	private var _extensions:Map<String, Class<IExtension>>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		_extensions = new Map<String, Class<IExtension>>();
		
		// Set defaults
		model = GameModel;
		view = GameView;
		skin = GameSkin;
		controller = GameController;
		extensionManager = ExtensionManager;
		notificationManager = NotificationManager;
	}
	
	public function extension(name:String, definition:Class<IExtension>):Void
	{
		_extensions.set(name, definition);
	}
	
	public function getExtensions():Map<String, Class<IExtension>>
	{
		return _extensions;
	}
}