package neato.game.model.vo;
import neato.api.core.integration.IIntegrator;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.IIntegrationController;
import neato.api.game.controller.ILoadingController;
import neato.api.game.controller.ISoundsController;
import neato.api.game.extensions.IExtension;
import neato.api.game.extensions.IExtensionsManager;
import neato.api.game.notifications.INotificationManager;
import neato.core.integration.Integrator;
import neato.game.controller.ActionsController;
import neato.game.controller.GameController;
import neato.game.controller.IntegrationController;
import neato.game.controller.LoadingController;
import neato.game.controller.SoundsController;
import neato.game.extensions.ExtensionsManager;
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
	
	public var extensionManager:Class<IExtensionsManager>;
	public var notificationManager:Class<INotificationManager>;
	
	public var actions:Class<IActionsController>;
	public var loading:Class<ILoadingController>;
	public var sounds:Class<ISoundsController>;
	public var integration:Class<IIntegrationController>;
	public var integrator:Class<IIntegrator>;
	
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
		extensionManager = ExtensionsManager;
		notificationManager = NotificationManager;
		actions = ActionsController;
		loading = LoadingController;
		sounds = SoundsController;
		integration = IntegrationController;
		integrator = Integrator;
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