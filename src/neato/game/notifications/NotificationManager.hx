package neato.game.notifications;

import neato.api.game.notifications.INotificationManager;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class NotificationManager implements INotificationManager
{
	private var _notificationHandlerMap:Map<String, Array<Dynamic>>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		_notificationHandlerMap = new Map<String, Array<Dynamic>>();
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * Broadcasts a notification.
	 * @param	notification
	 * @param	params
	 */
	public function broadcast(notification:String, ?params:DynamicExt):Void 
	{
		if (_notificationHandlerMap.exists(notification))
		{
			for (handler in _notificationHandlerMap.get(notification))
			{
				handler(params);
			}
		}
	}
	
	/**
	 * Subscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	public function subscribe(notification:String, handler:DynamicExt):Void 
	{
		if (!_notificationHandlerMap.exists(notification))
		{
			_notificationHandlerMap.set(notification, []);
		}
		
		_notificationHandlerMap.get(notification).push(handler);
	}
	
	/**
	 * Unsubscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	public function unsubscribe(notification:String, handler:DynamicExt):Void 
	{
		if (_notificationHandlerMap.exists(notification))
		{
			_notificationHandlerMap.get(notification).remove(handler);
		}
	}
}