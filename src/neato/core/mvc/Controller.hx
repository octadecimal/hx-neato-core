package neato.core.mvc;

import neato.api.core.mvc.IController;
import neato.api.game.IGameModel;
import neato.api.game.notifications.INotificationManager;
import neato.core.types.DynamicExt;
import neato.core.util.StringUtil;

/**
 * ...
 */
class Controller implements IController
{
	private var _notifications:INotificationManager;
	private var _model:IGameModel;
	
	/**
	 * Constructor.
	 */
	public function new(notifications:INotificationManager, model:IGameModel) 
	{
		_notifications = notifications;
		_model = model;
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		_notifications = null;
		_model = null;
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