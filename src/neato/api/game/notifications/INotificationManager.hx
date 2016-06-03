package neato.api.game.notifications;

import neato.core.types.DynamicExt;

/**
 * ...
 */
interface INotificationManager 
{
	/**
	 * Broadcasts a notification.
	 * @param	notification
	 * @param	params
	 */
	public function broadcast(notification:String, ?params:DynamicExt):Void;
	
	/**
	 * Subscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	public function subscribe(notification:String, handler:DynamicExt):Void;
	
	/**
	 * Unsubscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	public function unsubscribe(notification:String, handler:DynamicExt):Void;
}