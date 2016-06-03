package neato.game.extensions;

import neato.api.game.extensions.IExtension;
import neato.api.game.notifications.INotificationManager;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.core.debug.Debug;
import neato.core.types.DynamicExt;
import neato.core.util.StringUtil;

/**
 * ...
 */
class Extension implements IExtension
{
	// Game model reference, gets set via initialize method.
	private var _gameModel:IGameModel;
	
	// Game view reference, gets set via initialize method.
	private var _gameView:IGameView;
	
	// Game skin reference, gets set via initialize method.
	private var _gameSkin:IGameSkin;
	
	// Notification manager reference, gets set via initialize method.
	private var _notifications:INotificationManager;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * ToString.
	 */
	public function toString():String 
	{ 
		return StringUtil.getClassName(this); 
	}
	
	/**
	 * Initialization routine, allows for the AInitializeExtensions action to pass in references for this extension.
	 */
	public function initialize(gameModel:IGameModel, gameView:IGameView, gameSkin:IGameSkin, notifications:INotificationManager):Void
	{
		_gameModel = gameModel;
		_gameView = gameView;
		_gameSkin = gameSkin;
		_notifications = notifications;
	}
	
	/**
	 * Starts this extension.
	 */
	public function start():Void
	{
		
	}
	
	
	
	// PRIVATE
	//============================================================================================================
	
	/**
	 * Broadcasts a notification.
	 * @param	notification
	 * @param	params
	 */
	private function broadcast(notification:String, ?params:DynamicExt):Void
	{
		_notifications.broadcast(notification, params);
	}
	
	/**
	 * Subscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	private function subscribe(notification:String, handler:DynamicExt):Void
	{
		_notifications.subscribe(notification, handler);
	}
	
	/**
	 * Unsubscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	private function unsubscribe(notification:String, handler:DynamicExt):Void
	{
		_notifications.unsubscribe(notification, handler);
	}
}